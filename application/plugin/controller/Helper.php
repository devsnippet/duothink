<?php
namespace app\plugin\controller;

use think\Cache;
use think\Controller;
use think\Log;
use org\Verify;
use app\api\User;
vendor('qiniu.autoload');
use Qiniu\Auth;
use Qiniu\Storage\UploadManager;
class Helper extends  Controller
{
    public function clear_cache_log_temp(){
        Cache::clear();
        Log::clear();
        $this->result('',200,'缓存和日志记录清空成功，正在为您刷新页面，请稍等','json');
    }

    public function uploader(){
        ini_set('max_execution_time', '0');
        $fileName = input('get.filename') ?: 'file';
        $file =request()->file($fileName);
        $info = $file->rule('sha1')->move(ROOT_PATH . 'public' . DS . 'attach');
        if($info){
            $filePath = '/attach/' . $info->getSaveName();
            echo $this->qiniu_upload(str_replace('\\','/',$filePath));
        }else{
            // 上传失败获取错误信息
            echo $file->getError();
        }
    }

    /**
     * 七牛上传文件
     * @param $file
     * @return string
     */
    public static function qiniu_upload($file){
        ini_set('max_execution_time', '0');
        $accessKey = 'NyHLhUjWyFP2nFaedCgJdZVuMuboydnzx2iJvw79';
        $secretKey = 'nDqV4GTWK-RkEGxXvjbgPSLgO0tOW3-LvX37P5ll';
        $auth = new Auth($accessKey, $secretKey);

        $bucket = 'static-duothink';
        // 上传文件到七牛后， 七牛将文件名和文件大小回调给业务服务器

        $token = $auth->uploadToken($bucket);

        // 要上传文件的本地路径
        $filePath = '.'.$file;

        // 上传到七牛后保存的文件名
        $key = mb_substr($file,1);

        // 初始化 UploadManager 对象并进行文件的上传
        $uploadMgr = new UploadManager();

        // 调用 UploadManager 的 putFile 方法进行文件的上传
        list($ret, $err) = $uploadMgr->putFile($token, $key, $filePath);
        if ($err !== null) {
            return $err;
        } else {
            @unlink($filePath);
            return 'http://st.duothink.com'.$file;
        }

    }
    public function unlink_file()
    {
        $file = input('get.file');
        @unlink('.'.$file);
        $this->result('ok',200,'img file destroyed');
    }

    public function account(){
        return $this->fetch('/account');
    }

    //后台用户登录
    public function account_login()
    {
        $data = input('post.');
        $user_login = User::user_login($data, 'admin');
        return $user_login;
    }

    public function api_user_account(){
        $data = input('post.');
        $user_login = User::user_login($data,'user');
        return $user_login;
    }

    /**
     * 验证码
     */
    public function verify(){
        $w = input('w', '174');
        $h = input('h', '39');
        $config = [
            'codeSet'  => '2345678abcdefhijkmnpqrstuvwxyzABCDEFGHJKLMNPQRTUVWXY', // 验证码字符集合
            'expire'   => 160, // 验证码过期时间（s）
            'fontSize' => 20, // 验证码字体大小(px)
            'useCurve' => false, // 是否画混淆曲线
            'useNoise' => true, // 是否添加杂点
            'imageH'   => $h, // 验证码图片高度
            'imageW'   => $w, // 验证码图片宽度
            'length'   => 4, // 验证码位数
        ];
        $verify = new Verify($config);
        $verify->entry();
    }
}