package dao;

import org.apache.ibatis.annotations.Param;
import pojo.Strategy_comment;

import java.util.List;

public interface SCommentMapper {
    public int addStrategy_comment(@Param("SCMapper") Strategy_comment SCMapper);//添加评论

    public List<Strategy_comment> getS_COne(@Param("strategy_id") int strategy_id);//用来得到推文下对推文的评论

    public List<Strategy_comment> getS_CTwo(@Param("SCMapper") Strategy_comment SCMapper);//用来得到推文下对评论的评论

    public int updateSC(@Param("comment_id") int comment_id);//添加评论

}
