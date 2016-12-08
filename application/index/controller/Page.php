<?php
namespace app\index\controller;
/**
 * Created by PhpStorm.
 * User: imdante
 * Date: 2016/11/30
 * Time: 12:20
 */
class Page extends Common {
    public function index(){
        if(request()->isPost()){
            abort(404,'找不到啥飞机');
        }
        $id = input('param.id');
        $material = db('material')->where('id',$id)->find();
        $this->assign('data',$material);

        $this->author($material['uid']);

        return $this->fetch();
    }

    public function author($uid){
        $user = db('user')->where('uid',$uid)->find();
        $user['avatar'] = db('user_avatar')->where('uid',$user['uid'])->find();
        $this->assign('author',$user);
    }
}