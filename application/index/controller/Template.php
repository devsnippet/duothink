<?php
namespace app\index\controller;
use app\api\Category;

/**
 * Created by PhpStorm.
 * User: imdante
 * Date: 2016/11/30
 * Time: 12:20
 */
class Template extends Common {
    private $cid = 8; //栏目id
    public function index(){
        $category = Category::category(10);
        $this->assign('category',$category);

        return $this->fetch();
    }
    public function get_sub_category_json(){
        $id = input('get.id');
        $data = Category::search('pid',$id);
        if($data){
            $this->result($data,200,'success');
        }else{
            $this->result('',404,'null');
        }

    }
}