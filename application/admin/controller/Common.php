<?php
namespace app\admin\controller;

use think\Controller;
use app\api\Api;
use app\api\Auth;

class Common extends Controller
{
    public function _initialize()
    {
        $mp_session = session('admin');
        if (!$mp_session) {
            $this->redirect(url('plugin/helper/account'));
        } else {
            $this->assign('user', $mp_session);
        }
        //auth权限认证 自己弄的，非官方
        $checkAuth = Auth::checkAuth();
        if($checkAuth['code'] != 200){
            $this->error($checkAuth['msg']);
        }


        $this->assign('rqst',self::rqst());
        $this->assign('sub_auth_rule',Auth::naction());
        $this->assign('now_auth_rule',Auth::requestLocal());
        $this->assign('config',Api::config());
        $this->assign('left_menu',Auth::mainAuthRule());
        $this->assign('sub_menu',Auth::subAuthRule());
    }

    public static function rqst(){
        return [
            'controller' => request()->controller(),
            'action' => request()->action(),
            'name'  => strtolower( request()->module().'/'.request()->controller().'/'.request()->action() ),
        ];
    }

    public static function re_auth_rule_name(){
        $db=  db('auth_rule');
        $data = $db->select();
        foreach ($data as  $item=>$value){
            $db->where('id',$value['id'])->setField('name',str_replace('mp','admin',$value['name']));
        }
    }
}