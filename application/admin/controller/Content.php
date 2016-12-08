<?php
namespace app\admin\controller;
use app\api\Posts;
use app\api\Channel;

class Content extends Common
{
    public function index(){
        $channel = Channel::data_formcat(1);
        $this->assign('channel',$channel);

        $catid = input('get.catid');
        $subject = input('get.subject');

        if(isset($catid) && !empty($catid) && $catid != 0){
            $map['a.catid'] = $catid;
        }
        if(isset($subject) && !empty($subject)){
            $map['a.subject'] = ['like',"%$subject%"];
        }

        $map['a.status'] = 1;
        $list = db('article')
            ->alias('a')
            ->join('__CHANNEL__ c','a.catid = c.id')
            ->field('a.id,a.openid,a.subject,c.title,a.views,a.reples')
            ->where($map)
            ->order('a.id','desc')
            ->paginate(20);
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function products()
    {
        return $this->fetch();
    }

    public function goods()
    {
        return $this->fetch();
    }
    public function ed_article(){
        return $this->fetch();
    }
}