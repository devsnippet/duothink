<?php
namespace com\wechat;

class Message{
    public static function receiveMsg($data){
        /* libxml_disable_entity_loader is to prevent XML eXternal Entity Injection,
                  the best way is to check the validity of xml by yourself */
        libxml_disable_entity_loader(true);
        $postObj = simplexml_load_string($data, 'SimpleXMLElement', LIBXML_NOCDATA);
        $fromUsername = $postObj->FromUserName;
        $toUsername = $postObj->ToUserName;
        $keyword = trim($postObj->Content);
        if(!empty( $keyword )) {
            self::responseTextMsg($fromUsername,$toUsername,'你大爷，你再回复一个试试，我揍你！');
        }else{
            echo "Input something...";
        }
    }

    public static function responseTextMsg($fromUserName,$toUserName,$content){
        $time = time();
        $textTpl = "<xml>
                    <ToUserName><![CDATA[%s]]></ToUserName>
                    <FromUserName><![CDATA[%s]]></FromUserName>
                    <CreateTime>%s</CreateTime>
                    <MsgType><![CDATA[%s]]></MsgType>
                    <Content><![CDATA[%s]]></Content>
                    <FuncFlag>0</FuncFlag>
                    </xml>";
        $resultStr = sprintf($textTpl, $fromUserName, $toUserName, $time, 'text', $content);
        echo $resultStr;
    }

    public static function resqonseNewsMsg(){
        $newsTpl = "<xml>
                        <ToUserName><![CDATA[toUser]]></ToUserName>
                        <FromUserName><![CDATA[fromUser]]></FromUserName>
                        <CreateTime>12345678</CreateTime>
                        <MsgType><![CDATA[news]]></MsgType>
                        <ArticleCount>2</ArticleCount>
                        <Articles>
                            <item>
                                <Title><![CDATA[title1]]></Title> 
                                <Description><![CDATA[description1]]></Description>
                                <PicUrl><![CDATA[picurl]]></PicUrl>
                                <Url><![CDATA[url]]></Url>
                            </item>
                            <item>
                                <Title><![CDATA[title]]></Title>
                                <Description><![CDATA[description]]></Description>
                                <PicUrl><![CDATA[picurl]]></PicUrl>
                                <Url><![CDATA[url]]></Url>
                            </item>
                        </Articles>
                    </xml> ";
    }
}