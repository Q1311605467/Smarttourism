package JsoupTest;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Rest;
import service.RestService;

public class Rest_AddFromUrl {

    public static void addRest(Rest rest){

        /*
         在非Web应用中，手工加载Spring IoC容器，不能用ApplicationContext，要用AbstractApplicationContext。
         用完以后要记得调用ctx.close()关闭容器。如果不记得关闭容器，最典型的问题就是数据库连接不能释放
         * */
        AbstractApplicationContext context = new ClassPathXmlApplicationContext(
                "applicationContext-mybatis.xml");
        RestService restService=(RestService)context.getBean("restServiceImpl");

        int res=0;
        res=restService.htaddRest(rest);

        context.close();
    }
}
