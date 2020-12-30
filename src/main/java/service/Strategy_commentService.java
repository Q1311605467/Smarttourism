package service;

import pojo.Strategy_comment;

import java.util.List;

public interface Strategy_commentService {

    public int addStrategy_comment(Strategy_comment strategy_comment);//添加评论

    public List<Strategy_comment> getS_COne(int strategy_id);//用来得到推文下对推文的评论

    public List<Strategy_comment> getS_CTwo(Strategy_comment strategy_comment);//用来得到推文下对评论的评论

    public int update(int comment_id);//添加评论
}
