package controller;

import com.alibaba.fastjson.JSONArray;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pojo.Guide;
import pojo.Rest;
import service.RestService;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class RestController {
    Logger logger = Logger.getLogger(String.valueOf(RestController.class));

    @Resource
    private RestService restService;

    @RequestMapping(value = "/sys/restList",method = RequestMethod.GET)
    public String getRestList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Rest> restList = null;
        logger.info("restList ---- > pageIndex: " + pageIndex); //跳转页码
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
        int totalCount	= restService.getCount();
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

        restList = restService.getRestList(currentPageNo,pageSize);
        model.addAttribute("restList",restList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);
        return "restList";
    }
    @RequestMapping(value = "/sys/addRest",method = RequestMethod.POST)
    public String addGuide(HttpSession session, HttpServletRequest request,
                           @RequestParam(value ="rest_name", required = false) String rest_name,
                           @RequestParam(value ="rest_address", required = false) String rest_address,
                           @RequestParam(value ="rest_tel", required = false) String rest_tel,
                           @RequestParam(value ="rest_intro", required = false) String rest_intro,
                           @RequestParam(value ="consumption", required = false) String consumption,
                           @RequestParam(value ="rest_href", required = false) String rest_href,
                           @RequestParam(value ="area_id", required = false) String area_id,
                           @RequestParam(value ="rest_cover", required = false) MultipartFile filename){
        Rest rest = new Rest();
        String idPath = null;
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
            rest.setArea_id(Integer.valueOf(area_id));
            rest.setConsumption(Float.valueOf(consumption));
            rest.setRest_address(rest_address);
            rest.setRest_cover(idPath);
            rest.setRest_href(rest_href);

            rest.setRest_intro(rest_intro);
            rest.setRest_tel(rest_tel);
            rest.setRest_name(rest_name);
            restService.insertRest(rest);
        }
        return "redirect:/sys/restList";
    }

    @RequestMapping(value="/sys/restDetail/{rest_id}",method=RequestMethod.GET)
    public String modifyRest(@PathVariable(value="rest_id") String rest_id, Model model, HttpServletRequest request) {
        Rest rest =null;
        rest = restService.restDetail(Integer.valueOf(rest_id));
//        if(guide.getGuide_head()!=null && !"".equals(guide.getGuide_head())){
//            String[] paths = guide.getGuide_head().split("\\"+File.separator);
//            logger.info("view picPath paths[paths.length-1]============ " + paths[paths.length-1]);
//            guide.setGuide_head(request.getContextPath()+"/statics/upload/"+paths[paths.length-1]);
//        }
        model.addAttribute("rest", rest);
        return "restUpdate";
    }

    @RequestMapping(value = "/sys/restUpdate",method = RequestMethod.POST)
    public String restUpdate(HttpSession session, HttpServletRequest request,
                           @RequestParam(value ="rest_id", required = false) String rest_id,
                           @RequestParam(value ="rest_name", required = false) String rest_name,
                           @RequestParam(value ="rest_address", required = false) String rest_address,
                           @RequestParam(value ="rest_tel", required = false) String rest_tel,
                           @RequestParam(value ="rest_intro", required = false) String rest_intro,
                           @RequestParam(value ="consumption", required = false) String consumption,
                           @RequestParam(value ="rest_href", required = false) String rest_href,
                           @RequestParam(value ="area_id", required = false) String area_id,
                           @RequestParam(value ="rest_cover", required = false) MultipartFile filename){
        Rest rest = new Rest();
        String idPath = null;
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
            rest.setRest_id(Integer.valueOf(rest_id));
            rest.setArea_id(Integer.valueOf(area_id));
            rest.setConsumption(Float.valueOf(consumption));
            rest.setRest_address(rest_address);
            rest.setRest_cover(idPath);
            rest.setRest_href(rest_href);
            rest.setRest_intro(rest_intro);
            rest.setRest_tel(rest_tel);
            rest.setRest_name(rest_name);
            restService.updateByPrimaryKeySelective(rest);
        }
        return "redirect:/sys/restList";
    }
    @RequestMapping(value="/sys/restDel",method=RequestMethod.GET)
    @ResponseBody
    public Object guideDel(@RequestParam(value="rest_id" ,required=false) String rest_id)
    {
        boolean flag = false;
        if(restService.restDel(Integer.valueOf(rest_id))>0){
            flag = true;
        }
        return JSONArray.toJSONString(flag);
    }

    @RequestMapping(value = "/sys/restSearch",method = RequestMethod.GET)
    public String guideSearch(Model model, @RequestParam(value = "rest_name1" ,required = false)String rest_name1) throws Exception{
        List<Rest> restList = null;
        restList = restService.getRestListByName(rest_name1);
        model.addAttribute("restList",restList);
        return "restSearch";
    }

}
