<?php
namespace app\api;

use think\Model;

/**
 * 用户积分操作
 * Class User
 * @package app\api
 */
class UserScore extends Model
{
    private $replesScore = '5'; //评论内容
    private $replesGold = '2'; //评论内容
    private $postArticleScore = '30'; //发布文章
    private $postArticleGold = '20'; //发布文章
    private $articleGreenScore = '3'; //文章点赞
    private $articelFirstViewScore = '5'; //文章第一次访问
    private $aRewardArticle; //文章打赏

    public function __construct($type)
    {
        $scoreRule = cache('user_score_rules');
        if ($scoreRule) {
            $scoreRule = db('user_score_rules')->select();
            cache('user_score_rules', $scoreRule, 0);
        }
        foreach ($scoreRule as $item => $value) {
            if ($value['item'] == $type) {
                $this->$type = $value['value'];
            }
        }
    }

    public static function scoreInc($type, $uid, $aid)
    {

    }

    public static function scoreDec()
    {

    }
}