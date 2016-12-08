<?php
namespace app\api;

use think\Model;
use org\Verify;

/**
 * 用户操作
 * Class User
 * @package app\api
 */
class User extends Model
{

    /**
     * 请求用户信息
     * 通过session key 或是用户uid返回数组
     * @param string $model
     * @param string $uid
     * @return array|mixed
     */
    public static function userinfo($model = 'admin', $uid = '')
    {
        if ($uid) {
            $userinfo = User::where('uid', $uid)->find();
            return $userinfo->toArray();
        }
        return session($model);
    }

    /**
     * 用户登录
     * @param $data
     * @param string $type
     * @return array
     */
    public static function user_login($data, $type = 'admin')
    {
        //用户输入安全过滤
        $username = htmlspecialchars(strip_tags($data['username']));
        $password = htmlspecialchars(strip_tags($data['password']));
        if ($type == 'admin') {
            if (empty($data['verify'])) {
                return ['code' => 403, 'msg' => '后台登陆验证码不能为空'];
            }
            $verifycode = htmlspecialchars(strip_tags($data['verify']));
            $verify = new Verify();
            if (!$verify->check($verifycode)) {
                return ['code' => 403, 'msg' => '验证码错误，请刷新重试'];
            }
        }
        if (!$username || !$password) {
            return ['code' => 403, 'msg' => '登录名、密码不能为空'];
        }
        //查询用户
        $user = db('user')->where('status', 1)
            ->whereOr('username', $username)
            ->whereOr('mobile', $username)
            ->find();
        if (!$user) {
            return ['code' => 404, 'msg' => '用户不存在或已经被禁用'];
        }
        //对比密码
        $contrastPassword = self::dencrypted($password, $user['openid'], $user['password']);
        if (!$contrastPassword) {
            return ['code' => 403, 'msg' => '密码错误，请检查重试或是联系管理员'];
        }
        //登录成功
        //更新登录状态
        $updateUserStatus = [
            'uid' => $user['uid'],
            'last_login_time' => time(),
            'last_login_ip' => request()->ip()
        ];
        User::update($updateUserStatus);
        //写入session
        //session 有效时间1个小时
        session($type, $user);
        return ['code' => 200, 'msg' => '登录成功，欢迎回来'];
    }

    public static function user_register($data)
    {
        return self::encrypted($data['password']);
    }

    /**
     * 加密密码
     * sha1加密用户输入密码 连接openid 二次采用md5加密
     * 最终sha1加密 md5字符串 三重加密密码
     * @param string $str 用户输入密码
     * @return array string 返回加密密码和openid
     */
    private static function encrypted($str)
    {
        $openid = guid(); //用户标识id 参照微信openid
        return ['password' => sha1(md5(sha1($str) . $openid)), 'openid' => $openid];
    }

    /**
     * 用户登录输入密码和数据库密码对比
     * @param string $str 明文密码
     * @param string $openid 用户openid
     * @param string $passwrod 用户存储密码
     * @return bool
     */
    private static function dencrypted($str, $openid, $passwrod)
    {
        $encryPassWord = sha1(md5(sha1($str) . $openid));
        if ($passwrod === $encryPassWord) //严格对比密码
            return true;
        else
            return false;
    }

    /**
     * 关联用户积分
     * @return \think\model\Relation
     */
    public function score(){
        return $this->hasOne('user_score','uid','uid');
    }

    /**
     * 关联用户头像
     * @return \think\model\Relation
     */
    public function avatar(){
        return $this->hasOne('user_avatar','uid','uid');
    }
}