package controller;


import com.alibaba.fastjson.JSONArray;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import pojo.Admin;
import pojo.Hotel;
import pojo.User;
import service.AdminService;
import service.UserService;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class AdminController {
    private Logger logger = Logger.getLogger(String.valueOf(UserController.class));
    @Resource
    private AdminService adminService;
    @RequestMapping(value = "/sys/adminList",method = RequestMethod.GET)
    public String getUserList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Admin>adminList = null;
        logger.info("adminList ---- > pageIndex: " + pageIndex); //跳转页码
//        每一页有多少 default PageSize = 5；
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
        int totalCount	= adminService.getCount();
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

        adminList = adminService.getAdminList(currentPageNo,pageSize);
        model.addAttribute("adminList",adminList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);

        return "adminList";
    }
    @RequestMapping(value = "/sys/addAdmin",method = RequestMethod.POST)
    public String addAdmin(HttpSession session, HttpServletRequest request,
                           @RequestParam(value ="admin_account", required = false) String admin_account,
                           @RequestParam(value ="admin_password", required = false) String admin_password
                           ){

        Admin admin = new Admin();
        admin.setAdmin_account(admin_account);
        admin.setAdmin_password(admin_password);
        admin.setAdmin_isActive(0);
        admin.setAdmin_supreme(0);
        adminService.insertAdmin(admin);
        return "redirect:/sys/adminList";
        //"redirect:/sys/guideList"
    }
    @RequestMapping(value = "/sys/adminSearch",method = RequestMethod.GET)
    public String adminSearch(){
        return "adminSearch";
    }

    @RequestMapping(value = "/sys/adminSearchByName",method = RequestMethod.GET)
    public String getAdminListByName(Model model, @RequestParam(value = "admin_account",required = false)String admin_account) throws Exception{
        List<Admin>adminList = null;
        logger.info("======================="+admin_account);
        adminList = adminService.getAdminListByName(admin_account);
        model.addAttribute("adminList",adminList);
        return "adminSearch";
    }
    @RequestMapping(value = "/sys/LogoutAdmin",method = RequestMethod.GET)
    @ResponseBody
    public Object LogoutAdmin(Model model, @RequestParam(value = "admin_id",required = true)String admin_id) throws Exception{

        boolean flag = false;
        try{
            if(adminService.LogoutAdmin(admin_id)>0){
                flag = true;
            }
        }
        catch (Exception e){
            flag = false;
        }
        return JSONArray.toJSONString(flag);
    }
    @RequestMapping(value = "/sys/ActivatingAdmin",method = RequestMethod.GET)
    @ResponseBody
    public Object ActivatingAdmin(Model model, @RequestParam(value = "admin_id",required = true)String admin_id) throws Exception{

        boolean flag = false;
        try{
            if(adminService.ActivatingAdmin(admin_id)>0){
                flag = true;
            }
        }
        catch (Exception e){
            flag = false;
        }
        return JSONArray.toJSONString(flag);
    }
}
