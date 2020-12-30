package pojo;

import java.util.Date;

public class Strategy_comment {
    private int comment_id;//评论的id
    private int user_id;//发出评论的用户id
    private String user_name;//发出评论的用户名字
    private String user_head;//发出评论的用户的头像
    private int strategy_id;//被评论的推文的id
    private int uncomments_id;//在他人的评论的id 下发出的评论
    private int uncomment_id;//被评论的评论id
    private int unUser_id;//被评论的用户id
    private String unUser_name;//被评论的用户名
    private String unUser_head;//被评论的用户的头像
    private String text;//评论的内容
    private Date comment_time;//发布评论的时间
    private int un_number;//旗下所有的评论数目

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getStrategy_id() {
        return strategy_id;
    }

    public void setStrategy_id(int strategy_id) {
        this.strategy_id = strategy_id;
    }

    public int getUncomments_id() {
        return uncomments_id;
    }

    public void setUncomments_id(int uncomments_id) {
        this.uncomments_id = uncomments_id;
    }

    public int getUncomment_id() {
        return uncomment_id;
    }

    public void setUncomment_id(int uncomment_id) {
        this.uncomment_id = uncomment_id;
    }

    public int getUnUser_id() {
        return unUser_id;
    }

    public void setUnUser_id(int unUser_id) {
        this.unUser_id = unUser_id;
    }

    public String getUnUser_name() {
        return unUser_name;
    }

    public void setUnUser_name(String unUser_name) {
        this.unUser_name = unUser_name;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getComment_time() {
        return comment_time;
    }

    public void setComment_time(Date comment_time) {
        this.comment_time = comment_time;
    }

    public String getUser_head() {
        return user_head;
    }

    public void setUser_head(String user_head) {
        this.user_head = user_head;
    }

    public String getUnUser_head() {
        return unUser_head;
    }

    public void setUnUser_head(String unUser_head) {
        this.unUser_head = unUser_head;
    }

    public int getUn_number() {
        return un_number;
    }

    public void setUn_number(int un_number) {
        this.un_number = un_number;
    }
}
