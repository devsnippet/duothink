<?php
namespace app\admin\controller;

use app\api\Category;
use app\api\Channel;
use app\api\User;

class Posts extends Common
{
    public function index()
    {
        $channel = Channel::data_formcat(1);
        $cid = input('get.cid',$channel['0']['id']);
        $this->assign('cid',$cid);
        $this->assign('channel', $channel);

        $category = Category::category($cid);
        $this->assign('category',$category);

        return $this->fetch();
    }

    /**
     * 发布文章
     * @return mixed
     */
    public function article(){
        $data =input('post.');
        if(empty($data['subject'])  || empty($data['catid']) || empty($data['message'])){
            $this->result('403',403,'标题，内容，栏目不能为空');
        }
        $callback = \app\api\Posts::article($data);
        return $callback;
    }

    public static function category($type='article'){
       return Channel::type_channel_list('document',$type);
    }
    public function get_category(){
        $id = input('get.id');
        $data = Category::category($id);
        $this->result($data,200,'分类返回成功');
    }
}