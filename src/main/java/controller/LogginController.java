package controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Admin;
import service.AdminService;
import service.UserService;
import tools.Constants;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class LogginController {
    private Logger logger = Logger.getLogger(String.valueOf(LogginController.class));
    @Resource
    private AdminService adminService;
    @RequestMapping(value="/login.html")
    public String login() {
        logger.debug("Maser welcome Business==================");
        return "login";
    }
    @RequestMapping(value="/dologin.html",method= RequestMethod.POST)
    public String doLogin(@RequestParam String admin_account,
                          @RequestParam String admin_password,
                          HttpServletRequest request,
                          HttpSession session) throws Exception{
        logger.debug("doLogin====================================");
        //调用service方法，进行用户匹配
        Admin Admin = adminService.login(admin_account,admin_password);
        if(null != Admin){//登录成功
            //放入session
            session.setAttribute(Constants.ADMIN_SESSION, Admin);
            //页面跳转（frame.jsp）
            return "redirect:/sys/main.html";
            //response.sendRedirect("jsp/frame.jsp");
        }else{

            //页面跳转（userLogin.jsp）带出提示信息--转发
            request.setAttribute("error", "用户名或密码不正确");
            return "login";
        }

    }
    @RequestMapping(value="/sys/logout.html")
    public String logout(HttpSession session){
        //清除session
        session.removeAttribute(Constants.ADMIN_SESSION);
        return "redirect:/login.html";
    }
    @RequestMapping(value="/sys/main.html")
    public String main(HttpSession session){
        return "redirect:/sys/userList.html";
    }

}
