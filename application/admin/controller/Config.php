<?php
namespace app\admin\controller;

use app\api\Api;
use app\api\Auth;

class Config extends Common
{
    /**
     * 基础信息设置控制器
     * @return mixed
     */
    public function index()
    {
        $config = Api::config();
        if(request()->isPost()){
            $data = input('post.');
            if($data['id']){
                $status = db('config')->update($data);
            }else{
                $status = db('config')->insert($data);
            }

            if($status){
                cache('config',null);
                $this->result('',200,'设置信息保存成功');
            }else{
                $this->result('insert error',500,'保存失败！');
            }
        }
        $this->assign('config',$config);
        return $this->fetch();
    }

    public function navigation(){
        $list = Api::navigation();
        $this->assign('list', unlimitedForLevel($list));
        return $this->fetch();
    }

    public function add_navigation(){
        $data = input('post.');
        $status = db('navigation')->insert($data);
        if($status){
            cache('navigation',null);
            $this->result('',200,'导航添加成功');
        }else{
            $this->result('services is error',500,'导航添加失败，请重试或是联系管理员');
        }
    }

    /**
     * 删除导航记录
     */
    public function del_navigation(){
        $id = input('get.id');
        if(isset($id) && !empty($id)){
            $status = db('navigation')->where('id',$id)->delete();
            if($status){
                cache('navigation',null);
                $this->result('',200,'删除成功，正在为您刷新页面');
            }else{
                $this->result('err',500,'删除失败');
            }
        }
        $this->result('param is null',403,'参数错误，请刷新页面');
    }

    /**
     * 获取导航数据
     */
    public function get_navigation_json(){
        $id = input('get.id');
        $dataArray = Api::navigation(); //缓存中获取
        $result = [];
        foreach ($dataArray as $item => $value){
            if($value['id'] == $id){
                $result = $value;
            }
        }
        $this->result($result,200,'success');
    }

    /**
     * 更新导航信息
     */
    public function ed_navigation(){
        $data =input('post.');
        $status  = db('navigation')->update($data);
        if ($status){
            cache('navigation',null);
            $this->result('',200,'导航更新成功');
        }else{
            $this->result('error',500,'更新失败，没有更改任何数据或是内部错误');
        }
    }

    /**
     * 菜单
     * @return mixed
     */
    public function menus()
    {
        $auth_rule = Auth::allAuthRuleList();
        $this->assign('list',unlimitedForLevel($auth_rule));
        return $this->fetch();
    }

    /**
     * 添加菜单
     */
    public function add_auth_rule(){
        $data = input('post.');
        $status= db('auth_rule')->insert($data);
        if($status) {
            cache('auth_rule', null); //清空菜单缓存
            cache('auth_rule_all', null); //清空菜单缓存
            $this->result('', 200, '菜单添加成功', 'json');
        }else {
            $this->result('error', 500, '菜单添加失败，请重试或是联系技术', 'json');
        }
    }

    /**
     * 删除菜单
     */
    public function del_auth_rule(){
        $id = input('get.id');
        $status = db('auth_rule')->where('id',$id)->delete();
        if($status){
            cache('auth_rule',null);
            cache('auth_rule_all', null); //清空菜单缓存
            $this->result('',200,'删除成功','json');
        }else{
            $this->result('error',500,'删除失败，请重试或是联系技术支持','json');
        }
    }

    /**
     * 请求菜单信息数据
     */
    public function ed_auth_rule_calldata(){
        $id= input('get.id');
        $data = Auth::search_array('id',$id);
        $this->result($data['0'],200,'查询数据返回成功');
    }
    public function ed_auth_rule(){
        $data = input('post.');
        $status = db('auth_rule')->update($data);
        if($status){
            cache('auth_rule',null);
            cache('auth_rule_all', null); //清空菜单缓存
            $this->result('',200,'修改保存成功，正在刷新','json');
        }else{
            $this->result('error',500,'修改失败，请重试或是反馈技术人员');
        }
    }

}