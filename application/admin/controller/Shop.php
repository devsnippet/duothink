<?php
namespace app\admin\controller;

use app\common\model\Category;

class Shop extends Common
{
    /**
     * 商城首页 订单列表
     * @return mixed
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 商家列表
     * @return mixed
     */
    public function home(){
        $slider = db('shop_slider')->where('status',1)->select();
        $this->assign('slider',$slider);

        $category = db('shop_navigation')->where(['status'=>1])->order('order','desc')->select();
        $this->assign('category',$category);

        return $this->fetch();
    }

    /**
     * 幻灯片 ==============
     * @return mixed
     */
    public function add_slider(){
        if(request()->isPost()){
            $data = input('post.');
            $data['dateline'] = time();
            $status = db('shop_slider')->insert($data);
            if($status){
                $this->result('success',200,'添加成功，正在刷新');
            }else{
                $this->result('error',500,'添加失败，请重试或是联系管理员');
            }
        }
        return $this->fetch();
    }

    /**
     * 删除幻灯片 同时删除幻灯片文件
     */
    public function del_slider(){
        $id = input('get.id');
        $slider = db('shop_slider')->where('id',$id)->find();
        if($slider){
            $status = db('shop_slider')->where('id',$id)->delete();
            if($status){
                @unlink('.'.$slider['thumb']);
                cache('mshop_index_slider',null);
                $this->result('success',200,'删除成功');
            }else{
                $this->result('error',500,'删除失败');
            }
        }
        $this->result('false is param',500,'参数错误，请刷新重试');
    }

    /**
     * 编辑幻灯片
     * @return bool|mixed
     */
    public function ed_slider(){
        if(request()->isGet()){
            $id = input('get.id');
            $slider = db('shop_slider')->where('id',$id)->find();
            $this->assign('slider',$slider);
            return $this->fetch();
        }else{
            $data = input('post.');
            $status =db('shop_slider')->update($data);
            if($status){
                cache('mshop_index_slider',null);
                $this->result('success',200,'更新成功，正在刷新页面');
            }else{
                $this->result('error',500,'更新失败，请重试或是联系管理员反馈');
            }
        }
        return false;
    }

    //================

    //categ
    public function add_btn_category(){
        if(request()->isPost()){
            $data =input('post.');
            $data['dateline'] = time();
            $status = db('shop_navigation')->insert($data);
            if($status){
                cache('goods_category',null);
                $this->result('ok',200,'添加成功，正在刷新页面');
            }else{
                $this->result('error',500,'添加失败，请重试或是反馈管理员');
            }
        }
        $category = Category::search('type','goods');
        $this->assign('category',$category);
        return $this->fetch();
    }

    //===================
    /**
     * 商品上架
     * @return mixed
     */
    public function add_goods(){
        $category = cache('goods_category');
        if(!$category){
            $category = db('category')->where(['status'=>1,'type'=>'goods'])->order('order','asc')->select();
            cache('goods_category',$category,0);
        }
        $this->assign('category',unlimitedForLevel($category));
        return $this->fetch();
    }

    public function add_goods_go(){
        $data = input('post.');
        $user = mp(); //获取登录用户信息

        //组合商品信息数组
        $goods = [
            'subject'   => $data['subject'],
            'price'     => $data['price'],
            'stock'     => empty($data['isstock']) ? -1 : $data['stock'], //如果勾选库存则显示库存不勾选直接-1失效
            'isstock'   => $data['stock'],
            'thumb'     => implode(',',$data['thumb']),
            'message'   => htmlentities($data['message']),
            'uid'       => $user['uid'],
            'dateline'  => time(),
            'openid'    => $data['openid'],
            'catid'     => $data['catid'],
        ];

        //组合遍历规格数组
        $spec = $data['spec'];
        foreach ($spec as $item=>$value){
            $spec[$item]['openid'] = $data['openid'];
        }

        //插入商品数据到数据库
        $status = db('shop')->insert($goods);
        if($status){
            $specStatus = db('shop_goods_spec')->insertAll($spec);
            if($specStatus){
                $this->result('success',200,'商品添加成功，正在为您刷新页面');
            }else{
                $this->result('error',500,'规格数据写入失败，请重试或是反馈管理员');
            }
        }else{
            $this->result('error',500,'商品数据写入失败，请重试或是反馈管理员');
        }
    }
    /**
     * 商品列表
     * @return mixed
     */
    public function goods(){
        $goods = db('shop')->paginate(20);
        $this->assign('list',$goods);
        return $this->fetch();
    }


    /**
     * 商品分类
     * @return mixed
     */
    public function category(){
        $category = cache('goods_category');
        if(!$category){
            $category = db('category')->where(['status'=>1,'type'=>'goods'])->order('order','asc')->select();
            cache('goods_category',$category,0);
        }
        $this->assign('category',unlimitedForLevel($category));
        return $this->fetch();
    }
}