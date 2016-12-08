<?php
namespace app\admin\controller;
use app\api\Channel as ChannelModel;
use app\api\Document;
class Channel extends Common
{
    public function index()
    {
        $list = ChannelModel::data_formcat(1);
        $this->assign('list',$list);
        return $this->fetch();
    }

    /*
     * 添加栏目
     */
    public function add_channel()
    {
        if(request()->isAjax()){
            $data = input('post.');
            $data['openid'] = guid();
            $status = db('channel')->insert($data);
            if($status){
                cache('channel', null);
                $this->result(url('index'),200,'栏目添加成功，正在刷新页面');
            }else{
                $this->result('insert channel data is false',500,'栏目添加失败，请重试或反馈给管理员');
            }
        }else{
            $pid = input('param.id','0');
            if(isset($pid)){
                $this->assign('pid',$pid);
            }
            $this->assign('document',Document::datalist()); //文档模型
            $this->assign('channelList',ChannelModel::data_formcat(1)); //栏目列表
            return $this->fetch();
        }
    }

    /**
     * 编辑栏目
     * @return mixed
     */
    public function ed_channel(){
        if(request()->isAjax()){
            $data =input('post.');
            $status = db('channel')->update($data);
            if($status){
                cache('channel',null);
                $this->result(url('index'),200,'更新成功，正在刷新页面，请稍等...');
            }else{
                $this->result('update is error',500,'更新失败，请重试或是联系管理员！');
            }
        }else{
            $id = input('id');
            $channel  = ChannelModel::search_channel('id',$id);
            if($channel){
                $this->assign('document',Document::datalist()); //文档模型
                $this->assign('channelList',ChannelModel::data_formcat(1)); //栏目列表
                $this->assign('channel',$channel); //输出栏目信息
                return $this->fetch();
            }else{
                $this->error('栏目不存在，或是已经删除，请检查');
            }
        }
    }

    /**
     * 删除栏目
     */
    public function del_channel()
    {
        $id = input('get.id');
        if (isset($id)) {
            $status = db('channel')->where('id', $id)->delete();
            if ($status) {
                cache('channel', null); //清除缓存
                $this->result(url('index'), 200, '删除成功，正在为您新页面，请稍等...');
            } else {
                $this->result('delete channel is false', 500, '删除失败，请联系管理员或是重试操作');
            }
        }
        $this->result('param is error', 403, '参数错误，请反馈管理员');
    }
}