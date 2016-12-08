<?php
namespace app\index\controller;
/**
 * Created by PhpStorm.
 * User: imdante
 * Date: 2016/11/30
 * Time: 12:20
 */
class Index extends Common {
    public function index(){
        return $this->fetch();
    }
}