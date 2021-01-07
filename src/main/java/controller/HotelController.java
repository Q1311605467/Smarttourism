package controller;

import com.alibaba.fastjson.JSONArray;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pojo.Hotel;
import service.HotelService;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class HotelController {
    Logger logger = Logger.getLogger(String.valueOf(HotelController.class));
    @Resource
    private HotelService hotelService;

    @RequestMapping(value = "/sys/hotelList",method = RequestMethod.GET)
    public String getHotelList(Model model, @RequestParam(value = "pageIndex",required = false)String pageIndex) throws Exception{
        List<Hotel> hotelList = null;
        logger.info("hotelList ---- > pageIndex: " + pageIndex); //跳转页码
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
        int totalCount	= hotelService.getCount();
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

        hotelList = hotelService.getHotelList(currentPageNo,pageSize);
        model.addAttribute("hotelList",hotelList);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);
        logger.info("currenpage:"+currentPageNo);
        logger.info("pageSize:"+pageSize);
        return "hotelList";
    }
    @RequestMapping(value = "/sys/addHotel",method = RequestMethod.POST)
    public String addGuide(HttpSession session, HttpServletRequest request,
                           @RequestParam(value ="hotel_name", required = false) String hotel_name,
                           @RequestParam(value ="hotel_address", required = false) String hotel_address,
                           @RequestParam(value ="hotel_tel", required = false) String hotel_tel,
                           @RequestParam(value ="accommodation", required = false) String accommodation,
                           @RequestParam(value ="hotel_href", required = false) String hotel_href,
                           @RequestParam(value ="hotel_price", required = false) String hotel_price,
                           @RequestParam(value ="area_id", required = false) String area_id,
                           @RequestParam(value ="hotel_cover", required = false) MultipartFile filename){
        Hotel hotel = new Hotel();
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
            hotel.setArea_id(Integer.valueOf(area_id));
            hotel.setHotel_price(Float.valueOf(hotel_price));
            hotel.setHotel_address(hotel_address);
            hotel.setHotel_cover(idPath);
            hotel.setHotel_href(hotel_href);
            hotel.setAccommodation(accommodation);
            hotel.setHotel_tel(hotel_tel);
            hotel.setHotel_name(hotel_name);
            hotelService.insertHotel(hotel);
        }
        return "redirect:/sys/hotelList";
}

    @RequestMapping(value="/sys/hotelDetail/{hotel_id}",method=RequestMethod.GET)
    public String modifyHotel(@PathVariable(value="hotel_id") String hotel_id, Model model, HttpServletRequest request) {
        Hotel hotel =null;
        hotel = hotelService.hotelDetail(Integer.valueOf(hotel_id));
//        if(guide.getGuide_head()!=null && !"".equals(guide.getGuide_head())){
//            String[] paths = guide.getGuide_head().split("\\"+File.separator);
//            logger.info("view picPath paths[paths.length-1]============ " + paths[paths.length-1]);
//            guide.setGuide_head(request.getContextPath()+"/statics/upload/"+paths[paths.length-1]);
//        }
        model.addAttribute("hotel", hotel);
        return "hotelUpdate";
    }
    @RequestMapping(value = "/sys/hotelUpdate",method = RequestMethod.POST)
    public String hotelUpdate(HttpSession session, HttpServletRequest request,
                              @RequestParam(value ="hotel_id", required = false) String hotel_id,
                              @RequestParam(value ="hotel_name", required = false) String hotel_name,
                              @RequestParam(value ="hotel_address", required = false) String hotel_address,
                              @RequestParam(value ="hotel_tel", required = false) String hotel_tel,
                              @RequestParam(value ="accommodation", required = false) String accommodation,
                              @RequestParam(value ="hotel_href", required = false) String hotel_href,
                              @RequestParam(value ="hotel_price", required = false) String hotel_price,
                              @RequestParam(value ="area_id", required = false) String area_id,
                              @RequestParam(value ="hotel_cover", required = false) MultipartFile filename){
        Hotel hotel = new Hotel();
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
            hotel.setHotel_id(Integer.valueOf(hotel_id));
            hotel.setArea_id(Integer.valueOf(area_id));
            hotel.setHotel_price(Float.valueOf(hotel_price));
            hotel.setHotel_address(hotel_address);
            hotel.setHotel_cover(idPath);
            hotel.setHotel_href(hotel_href);
            hotel.setAccommodation(accommodation);
            hotel.setHotel_tel(hotel_tel);
            hotel.setHotel_name(hotel_name);
            hotelService.updateByPrimaryKeySelective(hotel);
        }
        return "redirect:/sys/hotelList";
    }
    @RequestMapping(value="/sys/hotelDel",method=RequestMethod.GET)
    @ResponseBody
    public Object guideDel(@RequestParam(value="hotel_id" ,required=false) String hotel_id)
    {
        boolean flag = false;
        if(hotelService.hotelDel(Integer.valueOf(hotel_id))>0){
            flag = true;
        }
        return JSONArray.toJSONString(flag);
    }

    @RequestMapping(value = "/sys/hotelSearch",method = RequestMethod.GET)
    public String guideSearch(Model model, @RequestParam(value = "hotel_name1" ,required = false)String hotel_name1) throws Exception{
        List<Hotel> hotelList = null;
        hotelList = hotelService.getHotelListByName(hotel_name1);
        model.addAttribute("hotelList",hotelList);
        return "hotelSearch";
    }
}
