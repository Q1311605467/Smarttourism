package controller;

import com.alibaba.fastjson.JSONArray;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pojo.Rest;
import pojo.Statistic;
import service.RestService;
import service.StatisticService;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
@Controller
public class StatisticController {
    Logger logger = Logger.getLogger(String.valueOf(StatisticController.class));

    @Resource
    private StatisticService statisticService;

    @RequestMapping(value = "/sys/statistic.html",method = RequestMethod.GET)
    public String getStatistic(Model model) throws Exception{
        List<Map>  countAreaNum =  statisticService.countAreaNum();
        model.addAttribute("countAreaNum",countAreaNum);
        return "statistic";
    }

    @RequestMapping(value = "/sys/getAreaInfo")
    public @ResponseBody List getInfo(Model model) throws Exception{
        List<Map>  countAreaNum =  statisticService.countAreaNum();
        return countAreaNum;
    }

    @RequestMapping(value = "/sys/getSceneryInfo")
    public @ResponseBody List getSceneryInfo(Model model) throws Exception{
        List<Map>  countSceneryNum =  statisticService.countSceneryNum();
        return countSceneryNum;
    }

}
