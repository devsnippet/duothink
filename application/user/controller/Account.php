<?php
namespace app\user\controller;

use app\api\User;
use app\index\controller\Common;

class Account extends Common
{
    private $callbackurl;
    public function user_login(){
        return $this->fetch();
    }

    /**
     * 用户登录验证
     * @return array
     */
    public function user_login_do(){
        $data = input('post.');
        $this->callbackurl = $data['callback'];
        unset($data['callback']);
        $status = User::user_login($data,'user');
        if($status['code'] ==200){
            $status['data'] = $this->callbackurl;
        }
        return $status;
    }

    /**
     * 用户注册验证
     */
    public function user_register_do(){
        $data =input('post.');
    }
}