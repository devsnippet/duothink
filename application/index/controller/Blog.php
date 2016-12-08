<?php
namespace app\index\controller;
use app\api\Category;
use app\api\Article;

/**
 * Created by PhpStorm.
 * User: imdante
 * Date: 2016/11/30
 * Time: 12:20
 */
class blog extends Common {

    public function datalists($catid=''){
        $getorder = input('get.order','default');
        switch ($getorder){
            case 'remend':
                $order = ['remend'=>'desc','id'=>'desc'];
                break;
            case 'hot':
                $order = ['reples'=>'desc','views'=>'desc'];
                break;
            default:
                $order = ['id'=>'desc'];
        }
        $list = Article::where(['catid'=>$catid,'status'=>1])->order($order)->cache(true,600)->paginate(20);
        $this->assign('order',$getorder);
        $this->assign('list',$list);
    }

    /**
     * 博客首页
     * @return mixed
     */
    public function index(){
        $getorder = input('get.order','default');
        $list = Article::datalist('',18,$getorder);
        $this->assign('list',$list);
        $this->category();
        $this->hot_blog();
        $this->assign('order',$getorder);
        return $this->fetch();
    }

    /**
     * 博客分类列表
     * @return mixed
     */
    public function lists(){
        $catid = input('param.value','');
        $getorder = input('get.order','default');

        $cate = Category::search('id',$catid); //查询分类
        if(!$catid || !$cate){
            abort(404,'你访问的分类不存在或已经被删除');
        }
        $list = Article::datalist($catid,'',$getorder);
        $this->assign('list',$list);

        $this->assign('cate',$cate);
        $this->assign('order',$getorder);

        $this->category();
        $this->hot_category_blog($catid);

        return $this->fetch();
    }

    /**
     * 内容博文列
     * @return mixed
     */
    public function article(){
        $id =input('param.id','','intval');

        $article = Article::where('id',$id)->find();
        if(!$article){
            abort(404,'内容不存在，已经删除或是禁用！');
        }
        $this->assign('article',$article);
        $this->category();
        $this->user_dynamic($article['uid']);
        $this->top_comments($article['catid']);
        self::article_plus($id);
        return $this->fetch();
    }

    /**
     * 分类列表
     */
    public function category(){
        $category = Category::category('18');
        $this->assign('category',$category);
    }

    /**
     * 热门博客 缓存1个小时
     */
    public function hot_blog(){
        $data = cache('blog_index_hot');
        if(!$data){
            $data = Article::where('status',1)->order(['id'=>'desc','views'=>'desc'])->limit(10)->select();
            cache('blog_index_hot',$data,3600); //热门缓存一个小时
        }
        $this->assign('hot_blog',$data);
    }

    /**
     * 分类列表缓存1天
     * @param $catid
     */
    public function hot_category_blog($catid){
        $data = cache('blog_category_hot_'.$catid);
        if(!$data){
            $data = Article::where(['status'=>1,'catid'=>$catid])->order(['id'=>'desc','views'=>'desc'])->limit(10)->select();
            cache('blog_category_hot_'.$catid,$data,3600); //热门缓存一个小时
        }
        $this->assign('hot_blog',$data);
    }

    /**
     * 用户最新动态 10分钟查询缓存
     * @param $uid
     */
    public function user_dynamic($uid){
        $dynamic = Article::where('uid',$uid)->order('id','desc')->limit(2)->cache(true,600)->select();
        $this->assign('dynamic',$dynamic);
    }

    public function top_comments($catid){
        $comments = Article::where('catid',$catid)->order('reples','desc')->limit(8)->cache(true,600)->select();
        $this->assign('comments',$comments);
    }

    /**
     * 文章访问添加
     * @param $id
     */
    public static function article_plus($id){
        $views = rand(1,9); //随机访问数增加
        Article::where('id',$id)->setInc('views',$views,60); //60s延迟更新
    }
}