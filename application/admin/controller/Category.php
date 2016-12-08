<?php
namespace app\admin\controller;

use app\api\Channel;

class Category extends Common
{
    public function index()
    {
        $category = cache('category');
        if(!$category){
            $category = db('category')->where('status',1)->order('order','asc')->select();
            cache('category',$category,0);
        }
        $this->assign('category',unlimitedForLevel($category));

        $channel = Channel::data_formcat('1');

        //db('category')->where('type','in','7,8,15,16')->delete();
        $this->assign('channel',$channel);

        return $this->fetch();
    }
    public function add(){
        $data = input('post.');
        $status = db('category')->insert($data);
        if($status){
            cache('category',null);
            $this->result('',200,'添加成功');
        }else{
            $this->result('error',500,'添加失败');
        }
    }
    public function del(){
        $id =input('get.id');
        if(isset($id)){
            $status  =db('category')->where('id',$id)->delete();
            if($status){
                cache('category',null);
                $this->result('',200,'删除成功，正在刷新');
            }else{
                $this->result('error',500,'删除失败');
            }
        }
        $this->result('param is error',403,'参数错误');
    }
    public function get_category(){
        $id = input('get.id');
        $data = db('category')->where('id',$id)->find();
        if($data){
            $this->result($data,200,'success');
        }else{
            $this->result('null',500,'数据不存在，请清空缓存');
        }
    }
    public function ed(){
        $data = input('post.');
        $status = db('category')->update($data);
        if($status){
            cache('category',null);
            $this->result('',200,'修改成功');
        }else{
            $this->result('error',500,'修改失败');
        }
    }
}