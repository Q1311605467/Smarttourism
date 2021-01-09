package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.*;
import service.SceneryService;
import service.Scenery_reservationService;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class Scenery_reservationController {
    Logger logger = Logger.getLogger(String.valueOf(StrategyController.class));
    @Resource
    private Scenery_reservationService scenery_reservationService;
    @Resource
    private SceneryService sceneryService;

    @RequestMapping(value = "/sys/SRMyList",method = RequestMethod.GET)
    public String getMyScenery_ReserveList(Model model,  @RequestParam int user_id) throws Exception{
        logger.info("passStrategy id:"+user_id);
        List<Scenery_Reservation> SRList=null;

        SRList = scenery_reservationService.getMySceneryReserve(user_id);
        model.addAttribute("SRList",SRList);
        return "SRMyList";
    }

    @RequestMapping(value = "/sys/sceneryReservationList.html",method = RequestMethod.GET)
    public String getUserList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Scenery_Reservation> scenery_reservations;
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
        int totalCount	= scenery_reservationService.getCount();
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

        scenery_reservations = scenery_reservationService.getReservationList(currentPageNo,pageSize);
        model.addAttribute("scenery_reservations",scenery_reservations);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);

        return "sceneryReservation";
    }



}
