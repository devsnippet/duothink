<?php
namespace app\admin\controller;

class Document extends Common
{
    public function index()
    {
        $list = \app\api\Document::datalist();
        $this->assign('list', $list);
        return $this->fetch();
    }

    /**
     * 编辑文档模型
     */
    public function add()
    {
        $data = input('post.');
        $checkDocumentIsTrue = db('document')->where('title', $data['title'])->whereOr('alias', $data['alias'])->find();
        if ($checkDocumentIsTrue) {
            $this->result('error', 403, '文档模型名称或是别名重复');
        }
        $status = db('document')->insert($data);
        if ($status) {
            cache('document', null);
            $this->result('', 200, '文档模型成功，正在刷新...');
        } else {
            $this->result('error', 500, '文档模型添加失败');
        }
    }

    /**
     * 删除文档模型
     */
    public function del()
    {
        $id = input('get.id');
        if (isset($id) && !empty($id) && $id >= 5) {
            $status = db('document')->where('id', $id)->delete();
            if ($status) {
                cache('document', null);
                $this->result('', 200, '文档模型删除成功，正在为您刷新页面');
            }
            $this->result('error', 500, '文档模型删除失败');
        }
        $this->result('error', 500, '禁止删除系统默认模型');
    }
}