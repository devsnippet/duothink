<?php
namespace app\admin\controller;

class User extends Common
{
    public function index()
    {
        return $this->fetch();
    }
    public function groups(){
        return $this->fetch();
    }
}