package controller;

import com.alibaba.fastjson.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pojo.CheckTextResult;
import pojo.Strategy;
import service.StrategyService;
import service.UserService;
import tools.CheckTextAPI;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class StrategyController {
    Logger logger = Logger.getLogger(String.valueOf(StrategyController.class));
    @Resource
    private StrategyService strategyService;
    @Resource
    private UserService userService;

    @RequestMapping(value = "/sys/strategyReviewedList",method = RequestMethod.GET)
    public String getReviewedList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Strategy> strategyList = null;

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
        int totalCount	= strategyService.getCount();
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

        strategyList = strategyService.getReviewedList(currentPageNo,pageSize);
        model.addAttribute("strategyList",strategyList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);
        return "strategyReviewedList";
    }

    @RequestMapping(value = "/sys/strategyUnreviewedList",method = RequestMethod.GET)
    public String getUnreviewedList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Strategy> strategyList = null;

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
        int totalCount	= strategyService.getUncheckedCount();
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

        strategyList = strategyService.getUnreviewedList(currentPageNo,pageSize);
        model.addAttribute("strategyList",strategyList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);
        return "strategyUnreviewedList";
    }

    @RequestMapping(value = "/sys/strategyUnPassedList",method = RequestMethod.GET)
    public String strategyUnPass(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Strategy> strategyList = null;

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
        int totalCount	= strategyService.getUnPassedCount();
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

        strategyList = strategyService.getUnPassedList(currentPageNo,pageSize);
        model.addAttribute("strategyList",strategyList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);
        return "strategyUnPassedList";
    }
//    审核推文
    @RequestMapping(value = "/sys/passStrategy",method = RequestMethod.GET)
    @ResponseBody
    public Object passStrategy(Model model, @RequestParam(value = "strategy_id",required = true)String strategy_id) throws Exception{
        logger.info("passStrategy id:"+strategy_id);
        boolean flag = false;
        try{
            if(strategyService.passStrategy(Integer.valueOf(strategy_id))>0){
                flag = true;
            }
        }
        catch (Exception e){
            flag = false;
        }
        return JSONArray.toJSONString(flag);
    }

    @RequestMapping(value = "/sys/unPassStrategy",method = RequestMethod.GET)
    @ResponseBody
    public Object unPassStrategy(Model model, @RequestParam(value = "strategy_id",required = true)String strategy_id) throws Exception{
        logger.info("passStrategy id:"+strategy_id);
        boolean flag = false;
        try{
            if(strategyService.unPassStrategy(Integer.valueOf(strategy_id))>0){
                flag = true;
            }
        }
        catch (Exception e){
            flag = false;
        }
        return JSONArray.toJSONString(flag);
    }

    @RequestMapping("/sys/StrategyDetail2/{strategy_id}")
    public String getStrategy(@PathVariable("strategy_id") int strategy_id, Model model) {
        logger.info("stag_id:================================================="+strategy_id);
        Strategy strategy = new Strategy();
        strategy = userService.getStrategyBSid(strategy_id);
        model.addAttribute("Strategy", strategy);

        CheckTextAPI checkTextAPI = new CheckTextAPI();
        //审核内容
        CheckTextResult checkTextResult = checkTextAPI.check(strategy.getContent());
        logger.info("________________________result="+checkTextResult);

        model.addAttribute("checkTextResult", checkTextResult);

        return "StrategyDetail2";
    }


}
