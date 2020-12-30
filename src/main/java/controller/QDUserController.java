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
import pojo.Strategy;
import pojo.User;
import service.UserService;
import tools.Constants;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;

@Controller
@RequestMapping("/sys/user")
public class QDUserController extends BaseController {
    private Logger logger = Logger.getLogger(QDUserController.class);

    @Resource
    private UserService userService;


    @RequestMapping("/modify.html")
    public String modify() {
        return "modify";
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
    public String addStrategy(@RequestParam int user_id, @RequestParam String title, @RequestParam String recommend, @RequestParam(value = "strategy_cover") MultipartFile filename, @RequestParam String content, HttpServletRequest request) {
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
