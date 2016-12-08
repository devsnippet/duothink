<?php
// 应用公共文件
/**
 * spm参数
 * @return string
 */
function spm(){
    $requst =mb_substr( str_replace('.html','',str_replace('/','.',request()->baseUrl())),1);
    $timestmap = time();
    $random = rand(1000,9999);
    return strtolower($requst.'.'.$random.'.'.$timestmap);
}

/**
 * 版本号缓存
 * @return string
 */
function vcs($model=false){
    $vcs = cache('vcs');
    if(!$vcs){
        $vcs = mb_substr(sha1(spm()),0,12);
        cache('vcs',$vcs,600);
    }
    if($model){
        return $vcs;
    }
    return '?v='.$vcs;
}
/**
 * 面包屑导航定位
 * @param $arr /数组
 * @param $id /当前id
 * @return array
 */
function breadcrumb($arr, $id)
{
    static $list = array();
    foreach ($arr as $v) {
        if ($v['id'] == $id) {
            breadcrumb($arr, $v['pid']);
            $list[] = $v;
        }
    }
    return $list;
}

/**
 * 获取子分类id
 * @param $data
 * @param $id
 * @return array
 */
function getChildId($data, $id)
{
    static $result = [];
    $result[] = $id;
    foreach ($data as $item => $value) {
        if ($value['pid'] == $id) {
            getChildId($data, $value['id']);
            $result[] = $value['id'];
        }
    }
    return $result;
}
/**
 * 无限极分类
 * @param $category
 * @param int $pid
 * @return array
 */
function unlimitedForChild($category, $pid = 0)
{
    $arr = array();
    foreach ($category as $v) {
        if ($v['pid'] == $pid) {
            $v['child'] = unlimitedForChild($category, $v['id']);
            $arr[] = $v;
        }
    }
    return $arr;
}
/**
 * 无限极分类
 * @param $list
 * @param int $pid
 * @param int $level
 * @return array
 */
function unlimitedForLevel($list, $pid = 0, $level = 0)
{
    $arr = array();
    foreach ($list as $k => $v) {
        if ($v['pid'] == $pid) {
            $v['level'] = $level + 1;
            $arr[] = $v;
            $arr = array_merge($arr, unlimitedForLevel($list, $v['id'], $level + 1));
        }
    }
    return $arr;
}

function guid(){
    if (function_exists('com_create_guid')){
        return com_create_guid();
    }else{
        mt_srand((double)microtime()*10000);//optional for php 4.2.0 and up.
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $uuid = substr($charid, 0, 8) .substr($charid, 8, 4) .substr($charid,12, 4) .substr($charid,16, 4) .substr($charid,20,12);
        return strtolower( $uuid );
    }
}

function mbs($string,$length='40'){
    return mb_substr($string,0,$length,'UTF-8');
}
/**
 * php版本
 * @return string
 */
function phpv()
{
    return 'php' . phpversion();
}

/**
 * 检测mysql版本
 * @return mixed
 */
function sqlv()
{
    $system_info_mysql = \think\Db::query("select version() as v;");
    return $system_info_mysql['0']['v'];
}

function reurl($param,$model,$spm=false)
{
    if ($spm)
        $path = '?spm=' . spm();
    else
        $path = '';
    $model =='ca' ? $ext ='' :$ext = '.html';
    return 'http://' . request()->host() . '/' . $model . '/' . $param . $ext . $path;
}

function get_friendly_time($time)
{
    $now = time();
    $timec = $now - intval($time);
    //
    if ($timec > 86400) {
        $days = intval($timec / (24 * 60 * 60));
        if ($days == 1) {
            return '昨天' . date('H:i', $time);
        } else if ($days < 30) {
            return $days . '天前' . date('H:i', $time);
        } else if ($days < 365) {
            $moths = intval($days / 30);
            return $moths . '个月前';
        } else {
            $years = intval($days / 365);
            return $years . '年前';
        }
    } else if ($timec > 3600) {
        $hours = intval($timec / (60 * 60));
        return $hours . '小时前';
    } else if ($timec > 60) {
        $mins = intval($timec / 60);
        return $mins . '分钟前';
    } else if ($timec > 5) {
        return $timec . "秒前";
    } else {
        return '刚刚';
    }
}

function tags($str = '')
{
    if (empty($str)) {
        return null;
    }
    $str = explode(',', $str);
    $html = '';
    foreach ($str as $v) {
        $tag = base64_encode($v);
        $html .= '<a href="' . reurl($tag, 'tags') . '" class="am-tag"> ' . $v . '</a>';
    }
    return $html;
}

function get_useinfo($model='admin'){

}
function baseurl(){
    return "http://".request()->host().request()->baseUrl();
}