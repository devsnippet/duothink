<?php
/**
 * Created by PhpStorm.
 * User: imdante
 * Date: 2016/10/13
 * Time: 8:52
 */

namespace app\api;
use think\Model;

class Channel extends Model
{
    /**
     * 栏目数据数组
     * @return false|mixed|\PDOStatement|string|\think\Collection
     */
    public static function datalist(){
        $channel = cache('channel');
        if(!$channel){
            $channel = db('channel')->where('status',1)->order('sort')->select();
            cache('channel',$channel,0);
        }
        return $channel;
    }

    /**
     * 返回数据格式
     * @param $type
     * @return array|false|mixed|\PDOStatement|string|\think\Collection
     */
    public static function data_formcat($type)
    {
        $data = self::datalist();
        switch ($type){
            case 1:
                return unlimitedForLevel($data);
            case 2:
                return unlimitedForChild($data);
            default:
                return $data;
        }
    }

    public static function search_channel($key,$var){
        $data = self::datalist();
        $channel = [];
        foreach ($data as $item=>$value){
            if($value[$key] == $var){
                $channel = $value;
            }
        }
        return $channel;
    }

    public static function type_channel_list($key,$var){
        $data = self::datalist();
        $channel = [];
        foreach ($data as $item=>$value){
            if($value[$key] == $var){
                $channel[] = $value;
            }
        }
        return $channel;
    }
}