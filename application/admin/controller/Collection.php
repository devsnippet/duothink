<?php
namespace app\admin\controller;

class Collection extends Common
{
    public function index(){
        return $this->fetch();
    }
}