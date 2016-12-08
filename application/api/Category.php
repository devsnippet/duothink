<?php
/**
 * Created by PhpStorm.
 * User: imdante
 * Date: 2016/11/15
 * Time: 11:27
 */

namespace app\api;


use think\Model;

class Category extends Model
{
    public static function datalist(){
        $category = cache('category');
        if(!$category){
            $category = db('category')->where(['status'=>1])->order('order','asc')->select();
            cache('category',$category,0);
        }
        return unlimitedForLevel($category);
    }
    public static function search($k,$v){
        $data = self::datalist();
        $result= [];
        foreach ($data as $item=>$value){
            if($value[$k] == $v && $value['pid'] !=0){
                $result[] = $value;
            }
        }
        return $result;
    }
    public static function category($typeid){
        $data = self::datalist();
        $cate = [];
        foreach ($data as $item=>$value){
            if($value['type'] == $typeid && $value['pid'] ==0){
                $cate = $value;
            }
        }

        $result= [];
        foreach ($data as $item=>$value){
            if($value['pid'] == $cate['id']){
                $result[] = $value;
            }
        }
        return $result;
    }
}