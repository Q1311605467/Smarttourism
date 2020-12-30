package controller;

import com.alibaba.fastjson.JSONArray;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pojo.Area;


import service.AreaService;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class htAreaController {
    Logger logger = Logger.getLogger(String.valueOf(htAreaController.class));


    @Resource
    private AreaService areaService;

    @RequestMapping(value = "/sys/htAreaList",method = RequestMethod.GET)
    public String getRestList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Area> areaList = null;
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
        int totalCount	= areaService.htgetCount();
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

        areaList = areaService.htgetAreaList(currentPageNo,pageSize);
        model.addAttribute("areaList",areaList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);

        return "htAreaList";
    }
    @RequestMapping(value = "/sys/addArea",method = RequestMethod.POST)
    public String addGuide(HttpSession session, HttpServletRequest request,
                           @RequestParam(value ="area_name", required = false) String area_name,
                           @RequestParam(value ="tourist_route", required = false) String tourist_route,
                           @RequestParam(value ="area_intro", required = false) String area_intro,
                           @RequestParam(value ="area_picture", required = false) MultipartFile filename){
        Area area = new Area();
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

            area.setArea_picture(idPath);
            area.setArea_intro(area_intro);
            area.setTourist_route(tourist_route);
            area.setArea_name(area_name);
            areaService.htaddArea(area);
        }
        return "redirect:/sys/htAreaList";
    }

    @RequestMapping(value="/sys/areaDetail/{area_id}",method=RequestMethod.GET)
    public String modifyRest(@PathVariable(value="area_id") String area_id, Model model, HttpServletRequest request) {
        Area area =null;
        area = areaService.htareaDetail(Integer.parseInt(area_id));
//        if(guide.getGuide_head()!=null && !"".equals(guide.getGuide_head())){
//            String[] paths = guide.getGuide_head().split("\\"+File.separator);
//            logger.info("view picPath paths[paths.length-1]============ " + paths[paths.length-1]);
//            guide.setGuide_head(request.getContextPath()+"/statics/upload/"+paths[paths.length-1]);
//        }
        model.addAttribute("area", area);
        return "htareaUpdate";//返回页面
    }

    @RequestMapping(value = "/sys/areaUpdate",method = RequestMethod.POST)
    public String restUpdate(HttpSession session, HttpServletRequest request,
                             @RequestParam(value ="area_pic", required = false) String area_pic,
                             @RequestParam(value ="area_id", required = false) String area_id,
                             @RequestParam(value ="area_name", required = false) String area_name,
                             @RequestParam(value ="tourist_route", required = false) String tourist_route,
                             @RequestParam(value ="area_intro", required = false) String area_intro,
                             @RequestParam(value ="area_picture", required = false) MultipartFile filename){
        Area area = new Area();
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

            area.setArea_id(Integer.parseInt(area_id));
            area.setTourist_route(tourist_route);
            area.setArea_picture(idPath);
            area.setArea_intro(area_intro);
            area.setArea_name(area_name);
            areaService.htupdateByPrimaryKeySelective(area);

            //----------------删除原文件--------------------------
            String URL = "E:" + File.separator + "IdeaProjects"  + File.separator + "SmartTourism" + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "statics" + File.separator + "images";

            File file=new File(URL);
            if (file.isDirectory()){//判断file是否是文件目录 若是返回TRUE
                String name=area_pic;//name存储file文件夹中的文件名
                File f=new File(URL, name);//此时就可得到文件夹中的文件
                f.delete();//删除文件
            }
        }
        return "redirect:/sys/htAreaList";
    }
    @RequestMapping(value="/sys/areaDel",method= RequestMethod.GET)
    @ResponseBody
    public Object guideDel(@RequestParam(value="area_id" ,required=false) String area_id)
    {
        boolean flag = false;
        if(areaService.htareaDel(Integer.valueOf(area_id))>0){
            flag = true;
        }
        return JSONArray.toJSONString(flag);
    }

    @RequestMapping(value = "/sys/htAreaSearch",method = RequestMethod.GET)
    public String guideSearch(Model model, @RequestParam(value = "area_name1" ,required = false)String area_name1) throws Exception{
        List<Area> areaList = null;
        areaList = areaService.htgetAreaListByName(area_name1);
        model.addAttribute("areaList",areaList);
        return "htAreaSearch";
    }
}
