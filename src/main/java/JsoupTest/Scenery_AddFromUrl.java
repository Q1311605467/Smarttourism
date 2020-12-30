package JsoupTest;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Scenery;
import service.SceneryService;

public class Scenery_AddFromUrl {


    public static void addScenery(Scenery scenery){

        /*
         在非Web应用中，手工加载Spring IoC容器，不能用ApplicationContext，要用AbstractApplicationContext。
         用完以后要记得调用ctx.close()关闭容器。如果不记得关闭容器，最典型的问题就是数据库连接不能释放
         * */
        AbstractApplicationContext context = new ClassPathXmlApplicationContext(
                "applicationContext-mybatis.xml");
        SceneryService sceneryService=(SceneryService)context.getBean("sceneryServiceImpl");

        int res=0;
        res=sceneryService.htaddScenery(scenery);

        context.close();
    }
}
