<?php
/**
 * Created by PhpStorm.
 * User: imdante
 * Date: 2016/10/9
 * Time: 13:51
 */

namespace com\wechat;
use com\wechat\Message;
class Wechat
{
    protected static $appid;
    protected static $appsecret;
    protected static $token;
    protected static $encodingaeskey;
    public static $api = "https://api.weixin.qq.com/cgi-bin";
    /**
     * 构建函数
     * Wechat constructor.
     * @param $type
     */
    public function __construct()
    {
        $config = cache('weixin_config');
        if(!$config){
            $config = db('weixin_config')->find();
            cache('weixin_config',$config,0);
        }
        self::$appid =  $config['appid'];
        self::$appsecret =  $config['appsecret'];
        self::$encodingaeskey = $config['encodingaeskey'];
        self::$token =  $config['token'];
    }

    /**
     * 授权接口
     */
    public static function vaild()
    {
        if(request()->isGet()){
            $echoStr = input('get.echostr');
            if (self::checkSignature()) {
                echo $echoStr;
                exit;
            }
        }
        if(request()->isPost()){
            $returnXml = $GLOBALS["HTTP_RAW_POST_DATA"];
             Message::receiveMsg($returnXml);
        }

    }


    private static function checkSignature()
    {
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];

        $token = self::$token;
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode($tmpArr);
        $tmpStr = sha1($tmpStr);

        if ($tmpStr == $signature) {
            return true;
        } else {
            return false;
        }
    }
    /**
     * 获取access_token
     * 返回0 则获取成功
     * 获取失败，返回错误代码
     * @return int|mixed
     */
    public static function get_access_token(){
        $access_token = cache('access_token');//缓存access_token
        if(!$access_token){
            $api = self:: $api . '/token?grant_type=client_credential&appid=' . self::$appid . '&secret=' . self::$appsecret;
            $callback = Func::Get($api);
            if(isset($callback->access_token)){
                cache('access_token', $callback->access_token, 7200);//缓存access_token
            }else{
                return false;
            }
        }
        return $access_token;
    }
}
