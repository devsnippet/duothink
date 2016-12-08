<?php
namespace com\wechat;
class Func {
    /**
     * post请求 curl
     * @param $curlPost
     * @param $url
     * @return mixed
     */
    public static function Post($curlPost,$url){
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_NOBODY, true);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $curlPost);
        $return_str = curl_exec($curl);
        curl_close($curl);
        return json_decode($return_str);
    }

    /**
     * get请求数据
     * @param $url
     * @return mixed
     */
    public static function Get($url){
        $callback = file_get_contents($url);
        return json_decode($callback);
    }
}