<?php
namespace com\wechat;
class User
{
    /**
     * 获取用户OpenID列表
     * @return mixed|string
     */
    public static function getUserOpenidList()
    {
        $wechat = new Wechat();
        $access_token = $wechat::get_access_token();
        if ($access_token) {
            $url = $wechat::$api . '/user/get?access_token=' . $access_token . '&next_openid=';
            $callback = Func::Get($url);
            if (isset($callback->errcode)) {
                return false;
            }
            return $callback;
        }
        return null;
    }


    /**
     * 批量获取用户信息
     * @return bool|mixed
     */
    public static function getUserInfoList()
    {
        $wx = new Wechat();
        $access_token = $wx::get_access_token();
        if ($access_token) {
            $openidList = self::getUserOpenidList();
            $openidList = $openidList->data;
            $data = $openidList->openid;
            //url接口地址
            $url = $wx::$api . '/user/info/batchget?access_token=' . $access_token;

            $postData = [];
            foreach ($data as $item => $value) {
                $postData['userlist'][$item][0] = $value;
                $postData['userlist'][$item][1] = 'zh-CN';
            }
            $userList = Func::Post(json_encode($postData, JSON_UNESCAPED_UNICODE), $url);
            if (!isset($userList->errcode)) {
                return $userList;
            } else {
                return false;
            }
        }
        return false;
    }

    /**
     * 根据openid换取用户基础信息
     * @param $openid
     * @return bool|mixed
     */
    public static function getUserInfoOne($openid)
    {
        $wx = new Wechat();
        $access_token = $wx::get_access_token();
        if ($access_token) {
            $url = $wx::$api . '/user/info?access_token=' . $access_token . '&openid=' . $openid . '&lang=zh_CN';
            $callback = Func::Get($url);
            if (isset($callback->errcode)) {
                return $callback->errmsg;
            } else {
                return $callback;
            }
        }
        return false;
    }
}