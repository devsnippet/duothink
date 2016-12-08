<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

return [
    //博客
    'blog/tag/:value' => 'index/blog/lists',
    'blog/:id' => 'index/blog/article',
    'blog' => 'index/blog/index',

    //模板
    'template/tag/:value' => 'index/template/lists',
    'template/:id' => 'index/template/article',
    'template' => 'index/template/index',

    //jquery
    'jquery/tag/:value' => 'index/jquery/lists',
    'jquery/:id' => 'index/jquery/article',
    'jquery' => 'index/jquery/index',

    //thinkphp
    'thinkphp/tag/:value' => 'index/thinkphp/lists',
    'thinkphp/:id' => 'index/thinkphp/article',
    'thinkphp' => 'index/thinkphp/index',

    //问答
    'wenda/tag/:value' => 'index/wenda/lists',
    'wenda/:id' => 'index/wenda/article',
    'wenda' => 'index/wenda/index',

    //工具箱
    'tools/tag/:value' => 'index/tools/lists',
    'tools/:id' => 'index/tools/article',
    'tools' => 'index/tools/index',

    'page/:id'   => ['page/index', ['method' => 'get'], ['id' => '\w+']],

    //用户信息
    'api_user_user_login' => 'user/account/user_login',
    'api_user_user_register' => 'user/account/user_register',
    'api_user_user_login_do' => 'user/account/user_login_do',
    'api_user_user_register_do' => 'user/account/user_register_do',
];
