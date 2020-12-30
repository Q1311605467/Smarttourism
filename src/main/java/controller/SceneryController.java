package controller;

import com.alibaba.fastjson.JSONArray;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pojo.Scenery;
import service.SceneryService;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;


@Controller
public class SceneryController {
    Logger logger = Logger.getLogger(SceneryController.class);
    
    @Resource
    private SceneryService sceneryService;

    @RequestMapping(value = "/sys/sceneryList",method = RequestMethod.GET)
    public String getSceneryList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Scenery> sceneryList = null;
        logger.info("sceneryList ---- > pageIndex: " + pageIndex); //跳转页码
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
        int totalCount	= sceneryService.getCount();
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

        sceneryList = sceneryService.getSceneryList(currentPageNo,pageSize);
        model.addAttribute("sceneryList",sceneryList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);
        return "sceneryList";
    }
    @RequestMapping(value = "/sys/addScenery",method = RequestMethod.POST)
    public String addGuide(HttpSession session, HttpServletRequest request,
                           @RequestParam(value ="scenery_name", required = false) String scenery_name,
                           @RequestParam(value ="scenery_address", required = false) String scenery_address,
                           @RequestParam(value ="scenery_route", required = false) String scenery_route,
                           @RequestParam(value ="scenery_intro", required = false) String scenery_intro,
                           @RequestParam(value ="browse_num", required = false) String browse_num,
                           @RequestParam(value ="comment", required = false) String comment,
                           @RequestParam(value ="area_id", required = false) String area_id,
                           @RequestParam(value ="files", required = false) MultipartFile[] files){
        Scenery scenery = new Scenery();

        int count = 0;
        for(MultipartFile filename:files){
            if (!filename.isEmpty()) {
                String idPath = null;
                //存放的位置路径
//                String path = "E:" + File.separator + "IdeaProjects"  + File.separator + "SmartTourism" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "statics" + File.separator + "images";
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
                    if(count==0){
                        scenery.setScenery_picture(idPath);
                        count ++;
                    }else{
                        scenery.setScenery_cover(idPath);
                    }
                }

            }
        }
        scenery.setScenery_name(scenery_name);
        scenery.setScenery_address(scenery_address);
        scenery.setNavigation_route(scenery_route);
        scenery.setScenery_intro(scenery_intro);
        scenery.setBrowse_num(Integer.valueOf(browse_num));
        scenery.setComment(comment);
        scenery.setArea_id(Integer.valueOf(area_id));
        sceneryService.insertScenery(scenery);
        return "redirect:/sys/sceneryList";
    }

    @RequestMapping(value="/sys/sceneryDetail/{scenery_id}",method=RequestMethod.GET)
    public String modifyScenery(@PathVariable(value="scenery_id") String scenery_id, Model model, HttpServletRequest request) {
        Scenery scenery =null;
        scenery = sceneryService.sceneryDetail(Integer.valueOf(scenery_id));
//        if(guide.getGuide_head()!=null && !"".equals(guide.getGuide_head())){
//            String[] paths = guide.getGuide_head().split("\\"+File.separator);
//            logger.info("view picPath paths[paths.length-1]============ " + paths[paths.length-1]);
//            guide.setGuide_head(request.getContextPath()+"/statics/upload/"+paths[paths.length-1]);
//        }
        model.addAttribute("scenery", scenery);
        return "sceneryUpdate";
    }
    @RequestMapping(value = "/sys/sceneryUpdate",method = RequestMethod.POST)
    public String sceneryUpdate(HttpSession session, HttpServletRequest request,
                                @RequestParam(value ="scenery_id", required = false) String scenery_id,
                                @RequestParam(value ="scenery_name", required = false) String scenery_name,
                                @RequestParam(value ="scenery_address", required = false) String scenery_address,
                                @RequestParam(value ="scenery_route", required = false) String scenery_route,
                                @RequestParam(value ="scenery_intro", required = false) String scenery_intro,
                                @RequestParam(value ="browse_num", required = false) String browse_num,
                                @RequestParam(value ="comment", required = false) String comment,
                                @RequestParam(value ="area_id", required = false) String area_id,
                                @RequestParam(value ="files", required = false) MultipartFile[] files){
        Scenery scenery = new Scenery();
        int count = 0;
        for(MultipartFile filename:files){
            if (!filename.isEmpty()) {
                String idPath = null;
                //存放的位置路径
//                String path = "E:" + File.separator + "IdeaProjects"  + File.separator + "SmartTourism" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "statics" + File.separator + "images";
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
                    if(count==0){
                        scenery.setScenery_picture(idPath);
                        count ++;
                    }else{
                        scenery.setScenery_cover(idPath);
                    }
                }

            }
        }
        scenery.setScenery_id(Integer.valueOf(scenery_id));
        scenery.setScenery_name(scenery_name);
        scenery.setScenery_address(scenery_address);
        scenery.setNavigation_route(scenery_route);
        scenery.setScenery_intro(scenery_intro);
        scenery.setBrowse_num(Integer.valueOf(browse_num));
        scenery.setComment(comment);
        scenery.setArea_id(Integer.valueOf(area_id));
        sceneryService.updateByPrimaryKeySelective(scenery);
        return "redirect:/sys/sceneryList";
    }
    @RequestMapping(value="/sys/sceneryDel",method=RequestMethod.GET)
    @ResponseBody
    public Object guideDel(@RequestParam(value="scenery_id" ,required=false) String scenery_id)
    {
        boolean flag = false;
        if(sceneryService.sceneryDel(Integer.valueOf(scenery_id))>0){
            flag = true;
        }
        return JSONArray.toJSONString(flag);
    }
    @RequestMapping(value = "/sys/scenerySearch",method = RequestMethod.GET)
    public String guideSearch(Model model, @RequestParam(value = "scenery_name1" ,required = false)String scenery_name1) throws Exception{
        List<Scenery> sceneryList = null;
        sceneryList = sceneryService.getSceneryListByName(scenery_name1);
        model.addAttribute("sceneryList",sceneryList);
        return "scenerySearch";
    }
}
