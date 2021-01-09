package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Hotel_reservation;
import service.Hotel_reservationService;
import service.UserService;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class Hotel_reservationController {
    Logger logger = Logger.getLogger(String.valueOf(StrategyController.class));

    @Resource
    private Hotel_reservationService hotel_reservationService;

    @RequestMapping(value = "/sys/HRList",method = RequestMethod.GET)
    public String getHotle_ReserveList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Hotel_reservation> HRList=null;

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
        int totalCount	= hotel_reservationService.getHotle_ReserveCount();
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

        HRList = hotel_reservationService.getHotle_ReserveList(currentPageNo,pageSize);
        model.addAttribute("HRList",HRList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);
        return "HRList";
    }

    @RequestMapping(value = "/sys/HRMyList",method = RequestMethod.GET)
    public String getMyHotle_ReserveList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex,@RequestParam int user_id) throws Exception{
        logger.info("passStrategy id:"+user_id);
        List<Hotel_reservation> HRList=null;

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
        int totalCount	= hotel_reservationService.getMyHotle_ReserveCount(user_id);
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

        HRList = hotel_reservationService.getMyHotle_Reserve(user_id);
        model.addAttribute("HRList",HRList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);
        return "HRMyList";
    }
    @RequestMapping(value = "/sys/hotelReservation",method = RequestMethod.GET)
    public String getHotelReservation(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Hotel_reservation> HRList=null;

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
        int totalCount	= hotel_reservationService.getHotle_ReserveCount();
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

        HRList = hotel_reservationService.getHotle_ReserveList(currentPageNo,pageSize);
        model.addAttribute("HRList",HRList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);
        return "hotelReservation";
    }
}
