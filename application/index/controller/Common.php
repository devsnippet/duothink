<?php
namespace app\index\controller;
use think\Controller;

/**
 * Created by PhpStorm.
 * User: imdante
 * Date: 2016/11/30
 * Time: 12:20
 */
use app\api\Api;
class Common extends Controller {
    public function _initialize()
    {
        header ("Cache-Control: max-age=600");
        header ("X-Powered-By: DUOTHINK-THINKPHP5");
        $this->assign('config', Api::config()); //全局配置加载
        $this->assign('navigation', unlimitedForChild(Api::navigation())); //全局顶部导航
        $this->assign('action',request()->action());
    }
}