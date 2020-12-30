package controller;

import org.apache.log4j.Logger;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Strategy_comment;
import service.Strategy_commentService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SCommentController {

    private Logger logger = Logger.getLogger(UserController.class);

    @Resource
    private Strategy_commentService strategycommentService;



    @RequestMapping(value = "/sys/addSComment",method = RequestMethod.POST)
    public String restUpdate(HttpSession session, HttpServletRequest request,
                             @RequestParam(value ="strategy_id", required = false) String strategy_id,
                             @RequestParam(value ="user_id", required = false) String user_id,
                             @RequestParam(value ="user_name", required = false) String user_name,
                             @RequestParam(value ="user_head", required = false) String user_head,
                             @RequestParam(value ="uncomments_id", required = false) String uncomments_id,
                             @RequestParam(value ="unUser_id", required = false) String unUser_id,
                             @RequestParam(value ="unUser_name", required = false) String unUser_name,
                             @RequestParam(value ="text", required = false) String text,
                             @RequestParam(value ="uncomment_id", required = false) String uncomment_id){

        Strategy_comment strategy_comment =new Strategy_comment();
        strategy_comment.setUser_id(Integer.parseInt(user_id));
        strategy_comment.setUser_name(user_name);
        strategy_comment.setUser_head(user_head);
        strategy_comment.setStrategy_id(Integer.parseInt(strategy_id));
        strategy_comment.setUncomments_id(Integer.parseInt(uncomments_id));
        strategy_comment.setUncomment_id(Integer.parseInt(uncomment_id));
        strategy_comment.setUnUser_id(Integer.parseInt(unUser_id));
        strategy_comment.setUnUser_name(unUser_name);
        strategy_comment.setText(text);

        int res=strategycommentService.addStrategy_comment(strategy_comment);
        if(Integer.parseInt(uncomment_id)!=0){
            int sss= strategycommentService.update(Integer.parseInt(uncomment_id));
        }
        if(res==0)
            System.out.println("添加评论失败1！");

        return "redirect:/StrategyDetail/"+strategy_id;
    }

    public static List<Strategy_comment> getS_CTwo(Strategy_comment strategy_comment){

        List<Strategy_comment> strategy_comments=new ArrayList<>();

        AbstractApplicationContext context = new ClassPathXmlApplicationContext(
                "applicationContext-mybatis.xml");
        Strategy_commentService strategy_commentService=(Strategy_commentService)context.getBean("strategy_commentServiceImpl");


        strategy_comments=strategy_commentService.getS_CTwo(strategy_comment);

        context.close();

        return strategy_comments;
    }
}
