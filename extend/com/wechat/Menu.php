<?php
namespace com\wechat;
class Menu{

    /**
     * 创建自定义菜单
     * @param array $meusArray 微信自定义菜单数组样式，传递之后转为json
     * @return bool
     */
    public static function createMenus($meusArray)
    {
        $wechat = new Wechat();
        $access_token = $wechat::get_access_token();
        if ($access_token) {
            $api = $wechat::$api . '/menu/create?access_token=' . $access_token;
            $meusArray = json_encode($meusArray, JSON_UNESCAPED_UNICODE);
            $callback = Func::Post($meusArray, $api);
            if (isset($callback->errcode)) {
                return false;
            } else {
                return true;
            }
        }
        return false;
    }

    /**
     * 删除全部菜单
     * @return bool
     */
    public static function deleteMenus()
    {
        $wechat = new Wechat();
        $access_token = $wechat::get_access_token();
        if ($access_token) {
            $api = $wechat::$api . '/menu/delete?access_token=' . $access_token;
            $callback = Func::Get($api);
            if (isset($callback->errcode)) {
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }
}