<?php
namespace app\admin\controller;

use app\common\model\Api;
use com\wechat\Menu;
use com\wechat\User;
class Wechat extends Common
{

    /**
     * 微信管理首页
     * @return mixed
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 微信接口配置
     * @return mixed
     */
    public function api()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $status = db('weixin_config')->update($data);
            if ($status) {
                $this->result('update is success', 200, '配置更新成功，正在刷新页面');
            } else {
                $this->result('update is error', 500, '更新失败，请重试或是反馈管理员');
            }
        }
        $this->assign('api', Api::weixin_config());
        return $this->fetch();
    }

    /**
     * 关键字回复
     * @return mixed
     */
    public function keywords()
    {
        return $this->fetch();
    }

    /**
     * 微信群发消息
     * @return mixed
     */
    public function send()
    {
        return $this->fetch();
    }

    /**
     * 微信自定义菜单
     * @return mixed
     */
    public function weixin_menus()
    {
        $wexin_menus = cache('weixin_menus');
        if (!$wexin_menus) {
            $wexin_menus = db('weixin_menus')->select();
            cache('weixin_menus', $wexin_menus, 0);
        }
        $this->assign('weixin_menus', unlimitedForLevel($wexin_menus));
        return $this->fetch();
    }

    /**
     * 添加菜单
     * @return array
     */
    public function add_menus()
    {
        $data = input('post.');
        //检查菜单是否数量对
        $menus = db('weixin_menus');
        $conut = $menus->where('pid', $data['pid'])->count();
        if ($data['pid'] == 0 && $conut >= 3) {
            return ['status' => 0, 'msg' => '一级菜单最多只能添加三个哦'];
        } else if ($conut >= 5) {
            return ['status' => 0, 'msg' => '二级菜单最多只能添加5个'];
        } else {
            $status = $menus->insert($data);
            if ($status) {
                return ['status' => 1, 'msg' => '菜单添加成功'];
            } else {
                return ['status' => 0, 'msg' => '内部服务器错误么，请重试或是联系技术支持'];
            }
        }
    }

    /**
     * 删除微信本地菜单
     * @return array
     */
    public function del_weixin_menus()
    {
        $id = input('id');
        $menus = db('weixin_menus');
        $ckSub = $menus->where('pid', $id)->find();
        if ($ckSub) {
            return ['status' => 0, 'msg' => '此菜单含有子菜单，无法删除'];
        }
        $status = $menus->where('id', $id)->delete();
        if ($status) {
            return ['status' => 1, 'msg' => '删除成功，正在刷新页面，请等待'];
        } else {
            return ['status' => 0, 'msg' => '内部服务器错误，请重试或是联系技术支持'];
        }
    }

    /**
     * 同步数据到微信服务器
     * @return array
     */
    public function sent_menus_to_wechat()
    {
        $list = db('weixin_menus')->where('status', 1)->order('sort', 'asc')->select();
        $button = [];
        foreach ($list as $item => $value) {
            $button[$item]['id'] = $value['id'];
            $button[$item]['pid'] = $value['pid'];
            $button[$item]['name'] = $value['title'];
            $button[$item]['type'] = $value['type'];
            $button[$item][$value['type']] = $value['value'];
        }
        $mxarray = weixin_menus($button);
        foreach ($mxarray as $item => $value) {
            unset($mxarray[$item]['id'], $mxarray[$item]['pid'], $mxarray[$item]['type'], $mxarray[$item]['url']);
            foreach ($value['sub_button'] as $k => $v) {
                unset($mxarray[$item]['sub_button'][$k]['id'], $mxarray[$item]['sub_button'][$k]['pid'], $mxarray[$item]['sub_button'][$k]['child']);
            }
        }
        $result['button'] = $mxarray;
        $status = Menu::createMenus($result);
        if ($status) {
            $this->result('success', 200, '同步到微信服务器成功，正在刷新页面...');
        } else {
            $this->result('error', 500, '同步失败，请检查重试或是反馈管理员');
        }
    }


    /**
     * 获取微信菜单json数据
     */
    public function get_menus()
    {
        $id = input('id');
        $data = db('weixin_menus')->where('id', $id)->find();
        $this->result($data, 200, 'OK');
    }

    /**
     * 编辑微信菜单
     * @return array
     */
    public function ed_menus()
    {
        $data = input('post.');
        $status = db('weixin_menus')->update($data);
        if ($status) {
            return ['status' => 1, 'msg' => '修改成功'];
        } else {
            return ['status' => 0, 'msg' => '修改失败'];
        }
    }


    /**
     * 素材管理
     * @return mixed
     */
    public function media()
    {
        return $this->fetch();
    }
    public function create_new_media(){
        $type= input('get.type');
        return $this->fetch();
    }

    /**
     * 添加素材模板文件
     * @return mixed
     */
    public function media_form_template(){
        return $this->fetch();
    }

    public function create_new_media_insert(){
        $data = input('post.');
        $status = db('weixin_media')->insert($data);
        if($status){
            $this->result($data,200,'SUCCESS');
        }else{
            $this->result(null,500,'ERROR');
        }
    }
}