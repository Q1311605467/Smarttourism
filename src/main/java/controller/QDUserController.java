package controller;

import com.alibaba.fastjson.JSONArray;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import pojo.*;
import service.*;
import tools.Constants;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/sys/user")
public class QDUserController extends BaseController {
    private Logger logger = Logger.getLogger(QDUserController.class);

    @Resource
    private UserService userService;
    @Resource
    private HotelService hotelService;

    @Resource
    private Hotel_reservationService hotel_reservationService;
    @Resource
    private SceneryService sceneryService;
    @Resource
    private Scenery_reservationService scenery_reservationService;
    @Resource
    private Hotel_roomService hotel_roomService;

    @RequestMapping("/modify.html")
    public String modify() {
        return "modify";
    }

    @RequestMapping("/userDetail.html")
    public String userDetail() {
        return "userDetail";
    }

    @RequestMapping("/userModify.html")
    public String userModify(@RequestParam int user_id, @RequestParam String user_account, @RequestParam String user_password, @RequestParam String user_password2, @RequestParam(value = "head", required = false) MultipartFile filename, @RequestParam String intro, HttpServletRequest request) {
        if (!user_password.equals(user_password2)) {
            request.setAttribute("error", "*两次密码输入不一致！");
            return "modify";
        } else {
            User user = new User();
            String idPath = null;
            if (!filename.isEmpty()) {
                //存放的位置路径
//                String path = "D:" + File.separator + "WorkSpace" + File.separator + "Idea_Projects" + File.separator + "SmartTourism" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "statics" + File.separator + "images";
                String path = request.getServletContext().getRealPath("/") + "statics/images";
                logger.info("上传地址 uploadfile Path-------->" + path);
                String oldFileName = filename.getOriginalFilename();//原文件名
                logger.info("原文件名 uploadfile oldFileName-------->" + oldFileName);

                String prefix = FilenameUtils.getExtension(oldFileName);//原文件后缀名
                logger.info("原文件后缀名 uploadfile prefix-------->" + prefix);
                int size = 500000;//上传文件大小上限
                if (filename.getSize() > size) {
                    request.setAttribute("error", "上传文件大小不得超过500KB");
//                    result = "falses";
//                    request.setAttribute("result", result);
                    return "modify";
                } else {
                    String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + "_SSM.jpg";
                    File targetFile = new File(path, fileName);
                    if (!targetFile.exists()) {
                        targetFile.mkdirs();
                    }
                    try {
                        filename.transferTo(targetFile);
                    } catch (Exception e) {
                        e.printStackTrace();
                        request.setAttribute("error", "上传文件失败");
//                        result = "falsess";
//                        request.setAttribute("result", result);
                        return "modify";
                    }
                    idPath = fileName;
                    logger.info("最终文件地址-------->" + idPath);
                }
                user.setHead(idPath);
            }

            user.setUser_id(user_id);
            user.setUser_account(user_account);
            user.setUser_password(user_password);
            user.setIntro(intro);

            userService.updateUser(user);
            return "redirect:/QDlogin.html";
        }
    }

    @RequestMapping(value = "/destory/{userID}")
    public String destoryUser(@PathVariable("userID") int userID, HttpSession session) {
        userService.destoryUser(userID);
        session.removeAttribute(Constants.USER_SESSION);
        return "redirect:/";
    }

    @RequestMapping(value = "/writeStrategy.html")
    public String writeStrategy() {
        return "writeStrategy";
    }

    @RequestMapping("/addStrategy.html")
    public String addStrategy(@RequestParam int user_id, @RequestParam String title,
                              @RequestParam String recommend, @RequestParam(value = "strategy_cover") MultipartFile filename,
                              @RequestParam String content, HttpServletRequest request
            ) {
        Strategy strategy = new Strategy();
        String idPath = null;
        if (!filename.isEmpty()) {
            //存放的位置路径
//            String path = "D:" + File.separator + "WorkSpace" + File.separator + "Idea_Projects" + File.separator + "SmartTourism" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "statics" + File.separator + "images";
            String path = request.getServletContext().getRealPath("/") + "statics/images";
            logger.info("上传地址 uploadfile Path-------->" + path);
            String oldFileName = filename.getOriginalFilename();//原文件名
            logger.info("原文件名 uploadfile oldFileName-------->" + oldFileName);

            String prefix = FilenameUtils.getExtension(oldFileName);//原文件后缀名
            logger.info("原文件后缀名 uploadfile prefix-------->" + prefix);
            int size = 500000;//上传文件大小上限
            if (filename.getSize() > size) {
                request.setAttribute("error", "上传文件大小不得超过500KB");
//                    result = "falses";
//                    request.setAttribute("result", result);
                return "modify";
            } else {
                String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + "_SSM.jpg";
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                try {
                    filename.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "上传文件失败");
//                        result = "falsess";
//                        request.setAttribute("result", result);
                    return "modify";
                }
                idPath = fileName;
                logger.info("最终文件地址-------->" + idPath);
            }
            strategy.setStrategy_cover(idPath);
            strategy.setUser_id(user_id);
            strategy.setTitle(title);
            strategy.setRecommend(recommend);
            strategy.setContent(content);
            userService.addStrategy(strategy);
        }
        return "redirect:/sys/user/userStrategy/" + user_id;
    }

    @RequestMapping(value = "/userAddHR.html")
    public String userAddHR(@RequestParam int hotel_id, HttpServletRequest request, Model model,
                            HttpSession session) {
        Hotel hotel=hotelService.hotelDetail(hotel_id);
        if(hotel!=null){
            session.setAttribute(Constants.HOTEL_SESSION, hotel);
            model.addAttribute("room", hotel_roomService.getHotelRoomList(hotel_id));
        }
        return "userAddHR";
    }

    @RequestMapping("/addHR.html")
    public String addHR(@RequestParam int hotel_id, @RequestParam int area_id, @RequestParam int user_id, @RequestParam String hotel_name, @RequestParam Date in_time,@RequestParam Date out_time,@RequestParam int reserv_num,@RequestParam String tel,@RequestParam String room_type,@RequestParam int total_cost){

        Hotel_reservation hotel_reservation=new Hotel_reservation();
        hotel_reservation.setHotel_id(hotel_id);
        hotel_reservation.setArea_id(area_id);
        hotel_reservation.setUser_id(user_id);
        hotel_reservation.setHotel_name(hotel_name);

        hotel_reservation.setIn_time(in_time);
        hotel_reservation.setOut_time(out_time);
        hotel_reservation.setRoom_type(room_type);
        hotel_reservation.setIs_breakfast(0);
        hotel_reservation.setReserv_num(reserv_num);
        hotel_reservation.setTotal_cost(total_cost);
        hotel_reservation.setTel(tel);
        userService.AddHR(hotel_reservation);
        return "redirect:/sys/user/HRMylist/" + user_id;
    }

    @RequestMapping(value = "/userAddSR.html")
    public String userAddSR(@RequestParam int scenery_id, HttpServletRequest request,
                            HttpSession session) {
        Scenery scenery=sceneryService.sceneryDetail(scenery_id);
        if(scenery!=null){
            session.setAttribute(Constants.SCENERY_SESSION, scenery);
        }
        return "userAddSR";
    }

    @RequestMapping("/addSR.html")
    public String addSR(@RequestParam int scenery_id, @RequestParam int user_id, @RequestParam String scenery_name, @RequestParam Date Sdate, @RequestParam int reserv_num, @RequestParam String tel,@RequestParam int total_cost_s){

        Scenery_Reservation scenery_reservation=new Scenery_Reservation();
        scenery_reservation.setScenery_id(scenery_id);
        scenery_reservation.setUser_id(user_id);
        scenery_reservation.setScenery_name(scenery_name);
        scenery_reservation.setDate(Sdate);
        scenery_reservation.setReserv_num(reserv_num);
        scenery_reservation.setTel(tel);
        scenery_reservation.setTotal_cost_s(total_cost_s);
        userService.AddSR(scenery_reservation);
        return "redirect:/sys/user/SRMylist/" + user_id;
    }

    @RequestMapping(value = "/usercancelHR.html")
    public String cancelHR(@RequestParam int reserv_id,@RequestParam int user_id){
        hotel_reservationService.cancelReserve(reserv_id);
        return "redirect:/sys/user/HRMylist/" + user_id;
    }

    @RequestMapping(value = "/usercancelSR.html")
    public String cancelSR(@RequestParam int scen_reserv_id,@RequestParam int user_id){
        scenery_reservationService.cancelReserve(scen_reserv_id);
        return "redirect:/sys/user/SRMylist/" + user_id;
    }

    @RequestMapping("/HRMylist/{user_id}")
    public String HR_Mylist(@PathVariable("user_id") int user_id, Model model) {
        model.addAttribute("HRMyList",hotel_reservationService.getMyHotle_Reserve(user_id));
        return "HRMyList";
    }

    @RequestMapping("/SRMylist/{user_id}")
    public String SR_Mylist(@PathVariable("user_id") int user_id, Model model) {
        model.addAttribute("SRMyList",scenery_reservationService.getMySceneryReserve(user_id));
        return "SRMyList";
    }

    @RequestMapping("/userStrategy/{user_id}")
    public String userStrategyR1(@PathVariable("user_id") int user_id, Model model) {
        model.addAttribute("Strategys", userService.queryOnesStrategy(user_id));
        return "userStrategy";
    }

    @RequestMapping("/userStrategyRealease0/{user_id}")
    public String userStrategyR0(@PathVariable("user_id") int user_id, Model model) {
        model.addAttribute("Strategys", userService.getOnesRealease0Strategy(user_id));
        return "userStrategyRealease0";
    }

    @RequestMapping("/userStrategyRealease2/{user_id}")
    public String userStrategyR2(@PathVariable("user_id") int user_id, Model model) {
        model.addAttribute("Strategys", userService.getOnesRealease2Strategy(user_id));
        return "userStrategyRealease2";
    }


    @RequestMapping("/deleteStrategy.json")
    @ResponseBody
    public String deleteStrategyBID(@RequestParam("strategy_id") int strategy_id) {
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if (userService.deleteStrategyBID(strategy_id) != 0)
            resultMap.put("status", "success");
        else
            resultMap.put("status", "fail");
        return JSONArray.toJSONString(resultMap);
    }

    @RequestMapping("/updateStrategy")
    public String updateStrategy(@RequestParam("strategy_id") int strategy_id, Model model) {
        model.addAttribute("Strategy", userService.getStrategyBSid(strategy_id));
        return "updateStrategy";
    }

    @RequestMapping("/updateStrategyBID.html")
    public String updateStrategyBID(@RequestParam int user_id, @RequestParam int strategy_id, @RequestParam String title, @RequestParam String recommend, @RequestParam(value = "strategy_cover") MultipartFile filename, @RequestParam String content, HttpServletRequest request) {
        Strategy strategy = new Strategy();
        String idPath = null;
        if (!filename.isEmpty()) {
            //存放的位置路径
//            String path = "D:" + File.separator + "WorkSpace" + File.separator + "Idea_Projects" + File.separator + "SmartTourism" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "statics" + File.separator + "images";
            String path = request.getServletContext().getRealPath("/") + "statics/images";
            logger.info("上传地址 uploadfile Path-------->" + path);
            String oldFileName = filename.getOriginalFilename();//原文件名
            logger.info("原文件名 uploadfile oldFileName-------->" + oldFileName);

            String prefix = FilenameUtils.getExtension(oldFileName);//原文件后缀名
            logger.info("原文件后缀名 uploadfile prefix-------->" + prefix);
            int size = 500000;//上传文件大小上限
            if (filename.getSize() > size) {
                request.setAttribute("error", "上传文件大小不得超过500KB");
//                    result = "falses";
//                    request.setAttribute("result", result);
                return "modify";
            } else {
                String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + "_SSM.jpg";
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                try {
                    filename.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "上传文件失败");
//                        result = "falsess";
//                        request.setAttribute("result", result);
                    return "modify";
                }
                idPath = fileName;
                logger.info("最终文件地址-------->" + idPath);
            }
            strategy.setStrategy_cover(idPath);
        }
        strategy.setStrategy_id(strategy_id);
        strategy.setTitle(title);
        strategy.setRecommend(recommend);
        strategy.setContent(content);
        userService.updateStrategyBID(strategy);

        return "redirect:/sys/user/userStrategy/" + user_id;
    }

}
