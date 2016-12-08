<?php
/**
 * Created by PhpStorm.
 * User: imdante
 * Date: 2016/10/13
 * Time: 8:52
 */

namespace app\api;
use think\Model;

class Document extends Model
{
    /**
     * 栏目数据数组
     * @return false|mixed|\PDOStatement|string|\think\Collection
     */
    public static function datalist(){
        $document = cache('document');
        if(!$document){
            $document = db('document')->where('status',1)->select();
            cache('document',$document,0);
        }
        return $document;
    }
}