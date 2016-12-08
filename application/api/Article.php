<?php
/**
 * Created by PhpStorm.
 * User: imdante
 * Date: 2016/11/15
 * Time: 11:27
 */

namespace app\api;


use think\Model;

class Article extends Model
{
    /**
     * 关联栏目
     * @return \think\model\Relation
     */
    public function channel(){
        return $this->hasOne('channel','id','cid');
    }

    /**
     * 关联分类
     * @return \think\model\Relation
     */
    public function category(){
        return $this->hasOne('category','id','catid');
    }

    /**
     * 关联作者
     * @return \think\model\Relation
     */
    public function user(){
        return $this->hasOne('user','uid','uid');
    }

    /**
     * 用户头像关联
     * @return \think\model\relation\HasOne
     */
    public function avatar(){
        return $this->hasOne('user_avatar','uid','uid');
    }

    /**
     * 获取文章内容数据列表
     * @param string $catid
     * @param string $cid
     * @param string $getorder
     * @return \think\paginator\Collection
     */
    public static function datalist($catid='',$cid='',$getorder='default',$pageNum='20'){
        switch ($getorder){
            case 'remend':
                $order = ['remend'=>'desc','id'=>'desc'];
                break;
            case 'hot':
                $order = ['reples'=>'desc','views'=>'desc'];
                break;
            default:
                $order = ['id'=>'desc'];
        }
        $map['status'] = 1;
        if($catid){
            $map['catid'] = $catid;
        }
        if($cid){
            $map['cid'] = $cid;
        }

        $list = Article::where($map)->order($order)->cache(true,120)->paginate($pageNum);
        return $list;
    }
}