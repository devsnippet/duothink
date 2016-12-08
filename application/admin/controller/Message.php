<?php
namespace app\admin\controller;

class Message extends Common
{
    public function index(){
        return $this->fetch();
    }
}