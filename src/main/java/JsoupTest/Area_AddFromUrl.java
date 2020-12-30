package JsoupTest;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Area;
import service.AreaService;

public class Area_AddFromUrl {

   public static void addArea(Area area){

         /*
         在非Web应用中，手工加载Spring IoC容器，不能用ApplicationContext，要用AbstractApplicationContext。
         用完以后要记得调用ctx.close()关闭容器。如果不记得关闭容器，最典型的问题就是数据库连接不能释放
         * */
         AbstractApplicationContext context = new ClassPathXmlApplicationContext(
                 "applicationContext-mybatis.xml");
         AreaService areaService=(AreaService)context.getBean("areaServiceImpl");

         int res=0;
         res=areaService.htaddArea(area);

         context.close();

   }

   public static int htgetArea_idByName(String area_name){

       int area_id=1;

       AbstractApplicationContext context = new ClassPathXmlApplicationContext(
               "applicationContext-mybatis.xml");
       AreaService areaService=(AreaService)context.getBean("areaServiceImpl");


       area_id=areaService.htgetArea_idByArea_name(area_name);

       context.close();

       return area_id;
   }

}
