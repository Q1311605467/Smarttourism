package controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.mysql.jdbc.StringUtils;

import pojo.Scenery;
import pojo.User;
import service.Strategy_commentService;
import service.UserService;
import tools.Constants;
import tools.WeatherUtils;

@Controller
public class LoginController {
    private Logger logger = Logger.getLogger(LoginController.class);

    @Resource
    private UserService userService;

    @Resource
    private Strategy_commentService strategycommentService;

    @RequestMapping(value = "/")
    public String indexxt(Model model) {
        model.addAttribute("top3Scenery", userService.getTop3Scenery());
        model.addAttribute("top5Strategy", userService.getTop5Strategy());
        return "index";
    }

    @RequestMapping(value = "/index.html")
    public String index(Model model) {
        model.addAttribute("top3Scenery", userService.getTop3Scenery());
        model.addAttribute("top5Strategy", userService.getTop5Strategy());
        return "index";
    }

    @RequestMapping(value = "/QDlogin.html")
    public String login() {
        logger.debug("LoginController welcome to SmartTourism==================");
        return "userLogin";
    }

    @RequestMapping(value = "/QDdologin.html")
    public String doLogin(@RequestParam String user_account, @RequestParam String user_password, HttpServletRequest request,
                          HttpSession session) throws Exception {
        logger.debug("doLogin====================================");
        // 调用service方法，进行用户匹配
        User user = userService.login(user_account, user_password);
        if (null != user) {// 登录成功
            // 放入session
            session.setAttribute(Constants.USER_SESSION, user);
            return "redirect:/index.html";
        } else {
            request.setAttribute("error", "*用户名或密码不正确");
            return "userLogin";
        }
    }

    @RequestMapping(value = "/logout.html")
    public String logout(HttpSession session) {
        // 清除session
        session.removeAttribute(Constants.USER_SESSION);
        return "redirect:/";
    }

    @RequestMapping(value = "/reg.html")
    public String reg() {
        return "reg";
    }

    @RequestMapping(value = "/reg/{user_account}/{user_password1}/{user_password2}/{ugender}")
    public String regUser(@PathVariable String user_account, @PathVariable String user_password1, @PathVariable String user_password2, @PathVariable int ugender,
                          HttpServletRequest request) {

        if (!user_password1.equals(user_password2)) {
            request.setAttribute("error", "*两次输入的密码不匹配");
            return "reg";
        } else {
            String gender;
            if (ugender == 1) {
                gender = "man";
            } else gender = "woman";
            userService.reg(user_account, user_password1, gender);
            return "redirect:/QDlogin.html";
        }
    }

    @RequestMapping(value = "/user_account_exist.json")
    @ResponseBody
    public Object user_account_exist(@RequestParam String user_account) {
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if (StringUtils.isNullOrEmpty(user_account)) {
            resultMap.put("user_account", "exist");
        } else {
            User user = null;
            try {
                user = userService.getUserByAccount(user_account);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            if (null != user)
                resultMap.put("user_account", "exist");
            else
                resultMap.put("user_account", "noexist");
        }
        return JSONArray.toJSONString(resultMap);
    }

    @RequestMapping("/Scenery/{scenery_id}")
    public String getSceneryBID(@PathVariable("scenery_id") int scenery_id, Model model) {
        Scenery scenery = userService.getSceneryBID(scenery_id);
        model.addAttribute("Scenery", scenery);
        model.addAttribute("Guides", userService.allGuideBScenery_id(scenery.getScenery_id()));
        String[] pic = scenery.getScenery_picture().split(";");
        List<String> covers = Arrays.asList(pic);
        model.addAttribute("pictures", pic);
        return "SceneryDetail";
    }

    @RequestMapping("/StrategyDetail/{strategy_id}")
    public String getStrategy(@PathVariable("strategy_id") int strategy_id, Model model) {
        model.addAttribute("Strategy", userService.getStrategyBSid(strategy_id));

        model.addAttribute("msge",strategycommentService.getS_COne(strategy_id));
        return "StrategyDetail";
    }

    @RequestMapping("/query.html")
    public String query(@RequestParam(value = "s", defaultValue = "丽江") String s, @RequestParam("sort") int sort, Model model) {
        model.addAttribute("s", s);
//        model.addAttribute("weather",JSONObject.parseObject(WeatherUtils.GetWeatherData(s)));
        if (sort == 1) {
            model.addAttribute("Strategys", userService.getStrategyBDiDianTop5(s));
            int area_id = userService.getIDBArea_name(s);
            if (area_id > 0) {
                model.addAttribute("Area", userService.getAreaBArea_id(area_id));
                model.addAttribute("Scenerys", userService.getSceneryByAreaIDTop3(area_id));
                model.addAttribute("Hotels", userService.getHotelAreaTop3(area_id));
                model.addAttribute("Rests", userService.getRestAreaTop3(area_id));
            }
            return "queryArea";
        } else if (sort == 2) {
            int area_id = userService.getIDBArea_name(s);
            if (area_id > 0) {
                model.addAttribute("Scenerys", userService.getSceneryByAreaID(area_id));
            }
            return "queryScenery";
        } else if (sort == 3) {
            if (s.equals("*"))
                model.addAttribute("Strategys", userService.queryAllStrategy());
            else
                model.addAttribute("Strategys", userService.getStrategyBDiDian(s));
            return "queryStrategy";
        }
        return null;
    }
    @RequestMapping("/reserves.html")
    public String reserves(@RequestParam(value = "s", defaultValue = "丽江") String s, @RequestParam("sort") int sort, Model model) {
        model.addAttribute("s", s);
//        model.addAttribute("weather",JSONObject.parseObject(WeatherUtils.GetWeatherData(s)));
        if (sort == 1) {
            model.addAttribute("Strategys", userService.getStrategyBDiDianTop5(s));
            int area_id = userService.getIDBArea_name(s);
            if (area_id > 0) {
                model.addAttribute("Area", userService.getAreaBArea_id(area_id));
                model.addAttribute("Scenerys", userService.getSceneryByAreaIDTop3(area_id));
                model.addAttribute("Hotels", userService.getHotelAreaTop3(area_id));
                model.addAttribute("Rests", userService.getRestAreaTop3(area_id));
            }
            return "queryArea";
        } else if (sort == 2) {
            int area_id = userService.getIDBArea_name(s);
            if (area_id > 0) {
                model.addAttribute("Scenerys", userService.getSceneryByAreaID(area_id));
            }
            return "reserveScenery";
        } else if (sort == 3) {
            if (s.equals("*"))
                model.addAttribute("Strategys", userService.queryAllStrategy());
            else
                model.addAttribute("Strategys", userService.getStrategyBDiDian(s));
            return "queryStrategy";
        }
        return null;
    }

    @RequestMapping("/Hotel.html")
    public String allHotel(@RequestParam(value = "s", defaultValue = "*") String s, Model model) {
        if (s.equals("*"))
            model.addAttribute("Hotels", userService.getHotelBArea_id(5));
        else
            model.addAttribute("Hotels", userService.searchHotel(s));
        return "Hotel";
    }

    @RequestMapping("/Strategy.html")
    public String allStrategy(@RequestParam(value = "s", defaultValue = "*") String s, Model model) {
        if (s.equals("*"))
            model.addAttribute("Strategys", userService.queryAllStrategy());
        else
            model.addAttribute("Strategys", userService.getStrategyBDiDian(s));

        return "queryStrategy";
    }

}
