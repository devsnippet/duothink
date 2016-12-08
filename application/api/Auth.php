<?php
namespace app\api;

use think\Model;

class Auth extends Model
{
    /**
     * 可见权限表
     * @return false|mixed|\PDOStatement|string|\think\Collection
     */
    public static function authList(){
        $auth_rule = cache('auth_rule');
        if(!$auth_rule){
            $auth_rule = db('auth_rule')->where('status',1)->order('sort','asc')->select();
            cache('auth_rule',$auth_rule,0);
        }

        return $auth_rule;
    }

    /**
     * 全部权限表
     * @return false|mixed|\PDOStatement|string|\think\Collection
     */
    public static function allAuthRuleList(){
        $auth_rule = cache('auth_rule_all');
        if(!$auth_rule){
            $auth_rule = db('auth_rule')->order('sort','asc')->select();
            cache('auth_rule_all',$auth_rule,0);
        }

        return $auth_rule;
    }
    /**
     * 获取顶部菜单
     * @return array
     */
    public static function mainAuthRule(){
        $data = self::search_array('pid',0);
        return $data;
    }

    /**
     * 获取访问控制器所有子菜单
     * @return array
     */
    public static function subAuthRule(){
        $requstMCI = request()->module() .'/'.request()->controller().'/index';
        $parentAuthRule = self::search_array('name',strtolower($requstMCI));
        $subAuthRuel = self::search_array('pid',$parentAuthRule['0']['id']);
        return $subAuthRuel;
    }

    /**
     * 用户组
     * @return false|mixed|\PDOStatement|string|\think\Collection
     */
    public static function authGroup(){
        $authGroup = cache('auth_group');
        if(!$authGroup){
            $authGroup = db('auth_group')->order('order','desc')->select();
            cache('auth_group',$authGroup,0);
        }
        return $authGroup;
    }

    /**
     * 菜单搜索
     * @param $key
     * @param $val
     * @return array
     */
    public static function search_array($key,$val,$data=''){
        $data = $data ?: self::authList();
        $result = [];
        foreach ($data as $item=>$value){
            if($value[$key] == $val){
                $result[] = $value;
            }
        }
        if($result){
            return $result;
        }else{
            return null;
        }
    }

    /**
     * 权限检查
     * @return array|bool
     */
    public static function checkAuth(){
        //访问请求模型 控制器 方法
        $requstMCA = request()->module() .'/'.request()->controller().'/'.request()->action();
        //查询数据库存储信息
        $cacheRuleFind = self::search_array('name',strtolower($requstMCA),self::allAuthRuleList());
        if(!$cacheRuleFind){
            return ['code'=>200,'msg'=>'访问对象在数据库或是缓存中没有找到，请刷新缓存重试'];
        }
        $objRule = $cacheRuleFind['0']; //赋值当前访问模型控制器方法数组
        $userinfo = User::userinfo();

        //根据当前登录用uid去查询权限对照中间表 获取 group_id
        $get_gourp_id = db('auth_access')->where('uid',$userinfo['uid'])->find();
        if($get_gourp_id['group_id'] == 1){
            return ['code'=>200];
        }
        $group = db('auth_group')->where('id',$get_gourp_id['group_id'])->find();
        $get_rule_list = explode(',',$group['rules']); //将用户组表权限存储转换为数组

        $checkAuthIsTrue = array_search($objRule['id'],$get_rule_list); //访问对象id查询数组
        if($checkAuthIsTrue){
            return ['code'=>200];
        }else{
            return ['code'=>403,'msg'=>'您没有访问权限 ):'];
        }
    }

    /**
     * 当前访问方法
     * @return array|null
     */
    public static function naction(){
        $data = self::search_array('status',1);
        $dataName = self::requestLocal();
        if($dataName)
            $result = self::search_array('pid',$dataName['0']['id'],$data);
        else
            $result = null;
        return $result;
    }

    /**
     * 当前访问控制器
     * @return array
     */
    public static function requestLocal(){
        $requestName = strtolower(request()->module().'/'.request()->controller().'/index');
        return self::search_array('name',$requestName);
    }
}