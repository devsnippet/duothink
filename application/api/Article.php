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

    public function avatar(){
        return $this->hasOne('user_avatar','uid','uid');
    }
}