<?php
namespace app\admin\controller;

class Index extends Common
{
    public function index()
    {
        return $this->fetch();
    }
    public function refresh_login_status(){
        $this->result('login is normal',200,'json');
    }
}
