package pojo;

import java.util.Date;

public class Strategy {
    private int strategy_id;
    private int user_id;
    private String title;
    private String strategy_cover;
    private String recommend;
    private String content;
    private Date post_time;
    private int isRelease;
    private int clickNum;

    public int getStrategy_id() {
        return strategy_id;
    }

    public void setStrategy_id(int strategy_id) {
        this.strategy_id = strategy_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStrategy_cover() {
        return strategy_cover;
    }

    public void setStrategy_cover(String strategy_cover) {
        this.strategy_cover = strategy_cover;
    }

    public String getRecommend() {
        return recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPost_time() {
        return post_time;
    }

    public void setPost_time(Date post_time) {
        this.post_time = post_time;
    }

    public int getIsRelease() {
        return isRelease;
    }

    public void setIsRelease(int isRelease) {
        this.isRelease = isRelease;
    }

    public int getClickNum() {
        return clickNum;
    }

    public void setClickNum(int clickNum) {
        this.clickNum = clickNum;
    }
}
