<?php
/**
 * Created by PhpStorm.
 * User: imdante
 * Date: 2016/11/4
 * Time: 11:19
 */

namespace app\api;


use think\Model;

class Posts extends Model
{
    /**
     * 发布文章
     * @return mixed
     */
    public static function article($data)
    {
        if (empty($data['subject']) || empty($data['catid']) || empty($data['message'])) {
            return self::result('403', 403, '标题，内容，栏目不能为空');
        }
        if (isset($data['thumb']) && !empty($data['thumb'])) {
            $data['thumb'] = self::get_thumb($data['thumb']);
        } else {
            $data['thumb'] = self::get_first_img_thumb($data['message']);
        }
        $data['dateline'] = !empty($data['dateline']) ? strtotime($data['dateline'] . ' 00:00:00') : time();
        $data['openid'] = guid();
        $userinfo = get_useinfo();
        $data['uid'] = $userinfo['uid'];
        $data['keywords'] = self::get_keywords($data['subject'], $data['message']);
        $data['description'] = self::get_description($data['message'], $data['subject']);
        $data['message'] = htmlentities($data['message']);
        $status = db('article')->insert($data);
        if ($status) {
            return self::result('ok', 200, '文章发布成功，正在刷新页面，请稍等...');
        } else {
            return self::result('insert is error', 500, '文章发布失败，请尝试刷新页面或是缓存，或者联系管理员');
        }
    }

    public static function get_thumb($file, $w = '900', $h = '500', $destroy = false)
    {
        $image = \think\Image::open('.' . $file);
        $save = './attach/thumb/' . sha1('thumb_' . $file) . '.jpg';
        $image->thumb($w, $h, 1)->save($save);
        if($destroy){
            @unlink('.'.$file);
        }
        return $save;
    }

    private static function get_first_img_thumb($message)
    {
        $message = htmlspecialchars_decode($message);
        preg_match("/(src)=([\"|']?)([^ \"'>]+\.(gif|jpg|jpeg|bmp|png))\\2/i", $message, $match);
        if (!$match) return null; //如果没有找到图片信息，返回null字符串
        if (preg_match("/^(http:\/\/|https:\/\/).*$/", $match['3'])) {
            return null;
        }
        $thumb = self::get_thumb($match['3']);
        return $thumb;
    }

    /**
     * 提取文章关键字
     * @param string $subject
     * @param string $message
     * @return string
     */
    private static function get_keywords($title = '', $content = '', $encode = 'utf-8')
    {
        if ($title == '' || $content == '') {
            return $title;
        }
        $title = rawurlencode(strip_tags($title));
        $content = strip_tags($content);
        if (strlen($content) > 2400) { //在线分词服务有长度限制
            $content = mb_substr($content, 0, 800, $encode);
        }
        $content = rawurlencode($content);
        $url = 'http://keyword.discuz.com/related_kw.html?title=' . $title . '&content=' . $content . '&ics=' . $encode . '&ocs=' . $encode;
        $xml_array = simplexml_load_file($url);                        //将XML中的数据,读取到数组对象中
        $result = $xml_array->keyword->result;
        $data = array();
        foreach ($result->item as $key => $value) {
            array_push($data, (string)$value->kw);
        }
        if (count($data) > 0) {
            return implode(',', $data);
        } else {
            return false;
        }
    }

    /**
     * 获取主题描述
     * @param string $message
     * @param string $subject
     * @param int $num
     * @return string
     */
    private static function get_description($message = '', $subject = '', $num = 80)
    {
        $message = strip_tags(htmlspecialchars_decode($message));
        $str_message = array(" ", "　", "\t", "\n", "\r", "&nbsp;");//出去空格和换行
        $nbsp_message = array("", "", "", "", "");//替换为出去空格
        $reg_message = str_replace($str_message, $nbsp_message, $message);//替换
        $description = mb_substr($reg_message, 0, $num, 'utf-8');
        if ($description) {
            return $description;
        } else {
            return $subject;
        }
    }

    public static function result($data, $code, $msg, $type = 'array')
    {
        return ['data' => $data, 'code' => $code, 'msg' => $msg];
    }
}