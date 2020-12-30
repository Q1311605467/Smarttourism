package controller;

import com.alibaba.fastjson.JSONArray;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pojo.Guide;
import service.GuideService;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class GuideController {
    private Logger logger = Logger.getLogger(String.valueOf(GuideController.class));

    @Resource
    private GuideService guideService;

    @RequestMapping(value = "/sys/guideList",method = RequestMethod.GET)
    public String getGuideList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Guide> guideList = null;
        logger.info("guideList ---- > pageIndex: " + pageIndex); //跳转页码
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
        int totalCount	= guideService.getCount();
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

        guideList = guideService.getGuideList(currentPageNo,pageSize);
        model.addAttribute("guideList",guideList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);

        return "guideList";
    }
    @RequestMapping(value = "/sys/addGuide",method = RequestMethod.POST)
    public String addGuide(HttpSession session,HttpServletRequest request,
                              @RequestParam(value ="guide_name", required = false) String guide_name,
                              @RequestParam(value ="guide_intro", required = false) String guide_intro,
                              @RequestParam(value ="guide_service", required = false) String guide_service,
                              @RequestParam(value ="guide_comment", required = false) String guide_comment,
                              @RequestParam(value ="guide_cost", required = false) String guide_cost,
                              @RequestParam(value ="scenery_id", required = false) String scenery_id,
                              @RequestParam(value ="guide_head", required = false) MultipartFile filename){
        String idPath = null;
        String errorInfo = "uploadFileError";//图片上传错误信息
        boolean flag = true;
        if (!filename.isEmpty()) {
            //存放的位置路径
//            String path = "E:" + File.separator + "IdeaProjects"  + File.separator + "SmartTourism" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "statics" + File.separator + "images";
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
        }
        logger.info(idPath);
        Guide guide = new Guide();
        guide.setGuide_name(guide_name);
        guide.setGuide_comment(guide_comment);
        guide.setGuide_cost(Float.valueOf(guide_cost));
        guide.setGuide_head(idPath);
        guide.setGuide_intro(guide_intro);
        guide.setGuide_service(guide_service);
        guide.setScenery_id(Integer.valueOf(scenery_id));
        guideService.insertGuide(guide);
        return "redirect:/sys/guideList";
    }


    @RequestMapping(value="/sys/guideDetail/{guide_id}",method=RequestMethod.GET)
    public String modifyGoods(@PathVariable(value="guide_id") String guide_id, Model model, HttpServletRequest request) {
       Guide guide =null;
       guide = guideService.guideDetail(Integer.valueOf(guide_id));
//        if(guide.getGuide_head()!=null && !"".equals(guide.getGuide_head())){
//            String[] paths = guide.getGuide_head().split("\\"+File.separator);
//            logger.info("view picPath paths[paths.length-1]============ " + paths[paths.length-1]);
//            guide.setGuide_head(request.getContextPath()+"/statics/upload/"+paths[paths.length-1]);
//        }
        model.addAttribute("guide", guide);
        logger.info("guide_id===================================="+guide.getGuide_id());
        return "guideUpdate";
    }

    @RequestMapping(value = "/sys/guideUpdate",method = RequestMethod.POST)
    public String guideUpdate(HttpSession session,HttpServletRequest request,
                           @RequestParam(value ="guide_id", required = true) String guide_id,
                           @RequestParam(value ="guide_name", required = false) String guide_name,
                           @RequestParam(value ="guide_intro", required = false) String guide_intro,
                           @RequestParam(value ="guide_service", required = false) String guide_service,
                           @RequestParam(value ="guide_comment", required = false) String guide_comment,
                           @RequestParam(value ="guide_cost", required = false) String guide_cost,
                           @RequestParam(value ="scenery_id", required = false) String scenery_id,
                           @RequestParam(value ="guide_head", required = false) MultipartFile  filename){
        String idPath = null;
        String errorInfo = "uploadFileError";//图片上传错误信息
        boolean flag = true;
        if (!filename.isEmpty()) {
            //存放的位置路径
//            String path = "E:" + File.separator + "IdeaProjects"  + File.separator + "SmartTourism" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "statics" + File.separator + "images";
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
        }
        logger.info(idPath);
        Guide guide = new Guide();
        guide.setGuide_id(Integer.valueOf(guide_id));
        guide.setGuide_name(guide_name);
        guide.setGuide_comment(guide_comment);
        guide.setGuide_cost(Float.valueOf(guide_cost));
        guide.setGuide_head(idPath);
        guide.setGuide_intro(guide_intro);
        guide.setGuide_service(guide_service);
        guide.setScenery_id(Integer.valueOf(scenery_id));
        guideService.updateByPrimaryKeySelective(guide);
        return "redirect:/sys/guideList";
    }

    @RequestMapping(value = "/sys/guideSearch",method = RequestMethod.GET)
    public String guideSearch(Model model, @RequestParam(value = "guide_name1" ,required = false)String guide_name1) throws Exception{
        List<Guide> guideList = null;
        guideList = guideService.getGuideListByName(guide_name1);
        model.addAttribute("guideList",guideList);
        return "guideSearch";
    }

    @RequestMapping(value="/sys/guideDel",method=RequestMethod.GET)
    @ResponseBody
    public Object guideDel(@RequestParam(value="guide_id" ,required=false) String guide_id)
    {
        boolean flag = false;
        if(guideService.guideDel(Integer.valueOf(guide_id))>0){
            flag = true;
        }
        return JSONArray.toJSONString(flag);
    }

}
