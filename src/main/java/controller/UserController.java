package controller;

import com.alibaba.fastjson.JSONArray;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.User;
import service.UserService;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class UserController {
    private Logger logger = Logger.getLogger(String.valueOf(UserController.class));
    @Resource
    private UserService userService;
    @RequestMapping(value = "/sys/userList.html",method = RequestMethod.GET)
    public String getUserList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<User>userList = null;
        logger.info("userList ---- > pageIndex: " + pageIndex); //跳转页码
//        每一页有多少
        int pageSize = Constants.pageSize;
//        目前的页数
        int currentPageNo = 1;

        if(pageIndex != null){
            try{
                currentPageNo = Integer.valueOf(pageIndex);
            }catch(NumberFormatException e){
                return "redirect:/error.jsp";
            }
        }
        //記錄总数量（表）
        int totalCount	= userService.getCount();
        PageSupport pages=new PageSupport();
//        目前的页数
        pages.setCurrentPageNo(currentPageNo);
//        每页有多少行
        pages.setPageSize(pageSize);
//        记录总的頁碼数量
        pages.setTotalCount(totalCount);
        int totalPageCount = pages.getTotalPageCount();
        //控制首页和尾页
        if(currentPageNo < 1){
            currentPageNo = 1;
        }else if(currentPageNo > totalPageCount){
            currentPageNo = totalPageCount;
        }

        userList = userService.getUserList(currentPageNo,pageSize);
        model.addAttribute("userList",userList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
            logger.info("currenpage:"+currentPageNo);
            logger.info("pageSize:"+pageSize);

        return "userList";
    }
    @RequestMapping(value = "/sys/userSearchByName",method = RequestMethod.GET)
    public String getUserListByName(Model model, @RequestParam(value = "user_account",required = false)String user_account) throws Exception{
        List<User>userList = null;
        logger.info("======================="+user_account);
        userList = userService.getUserListByName(user_account);
        model.addAttribute("userList",userList);
        return "userSearch";
    }
    @RequestMapping(value = "/sys/LogoutUser",method = RequestMethod.GET)
    @ResponseBody
    public Object LogoutUser(Model model, @RequestParam(value = "user_id",required = true)String user_id) throws Exception{
        logger.info("LogoutUser_userid:"+user_id);
        boolean flag = false;
        try{
            if(userService.LogoutUser(user_id)>0){
                flag = true;
            }
        }
        catch (Exception e){
           flag = false;
        }
        return JSONArray.toJSONString(flag);
    }
    @RequestMapping(value = "/sys/Activating",method = RequestMethod.GET)
    @ResponseBody
    public Object Activating(Model model, @RequestParam(value = "user_id",required = true)String user_id) throws Exception{
        logger.info("Activating_userid:"+user_id);
        boolean flag = false;
        try{
            if(userService.Activating(user_id)>0){
                flag = true;
            }
        }
        catch (Exception e){
            flag = false;
        }
        return JSONArray.toJSONString(flag);
    }
    @RequestMapping(value = "/sys/userSearch",method = RequestMethod.GET)
    public String userSearch(){
        return "userSearch";
    }

}
