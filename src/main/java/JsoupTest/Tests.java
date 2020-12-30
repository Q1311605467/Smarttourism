package JsoupTest;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import pojo.Strategy;

import java.io.File;
import java.util.logging.Level;


public class Tests {

    public static void main(String[] args) throws Exception {
        ssss();
    }

    public static void ssss() throws Exception {
        LogFactory.getFactory().setAttribute("org.apache.commons.logging.Log","org.apache.commons.logging.impl.NoOpLog");
        java.util.logging.Logger.getLogger("com.gargoylesoftware").setLevel(Level.OFF);
        java.util.logging.Logger.getLogger("org.apache.http.client").setLevel(Level.OFF);

        String url ="https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10030.html";//城市名

        //方法一------------------------------------------------------------------------------------
//        Httputils httputils = new Httputils();
//        String html = httputils.doGetHtml(url);
//
//        //解析页面，获取所需信息
//        parse(html);

        //方法二------------------------------------------------------------------------------------
//        Document doc1s = null;
//        try {
//            doc1s = Jsoup.connect(url)
//                    .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36")
//                    .timeout(30000)
//                    .get();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        System.out.println(doc1s);

        //方法三-------------------解决了js解密访问问题----------------------------------------------
//        HtmlUnitDriver driver = new HtmlUnitDriver();
//        //必须设置为true,才能执行js代码
//        driver.setJavascriptEnabled(true);
//        driver.get("https://www.mafengwo.cn/");
//        /*Set<Cookie> cookies = driver.manage().getCookies();
//        for (Cookie cookie:cookies){
//            System.out.println(cookie);
//        }*/
//        driver.setJavascriptEnabled(false);
//        driver.get("https://www.mafengwo.cn/poi/1494.html");
//        String pageSource = driver.getPageSource();

        //方法四--------------------解决了js解密访问 与 部分js动态加载数据问题------------------------------------------

        WebClient webClient = new WebClient(BrowserVersion.CHROME);
        webClient.getOptions().setJavaScriptEnabled(true);              // 启用JS解释器，默认为true
        webClient.getOptions().setCssEnabled(true);                    // 是否开启css支持
        webClient.getOptions().setThrowExceptionOnScriptError(false);   // js运行错误时，是否抛出异常
        webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
        webClient.getOptions().setTimeout(30 * 1000);                   // 设置连接超时时间
        webClient.getPage("https://www.mafengwo.cn/");
        webClient.waitForBackgroundJavaScript(10000);               // 等待js后台执行30秒
        HtmlPage page = webClient.getPage(url);
        webClient.waitForBackgroundJavaScript(10 * 1000);               // 等待js后台执行30秒
        String pageSource = page.asXml();

        Document doc = Jsoup.parse(pageSource);

        Elements elements = doc.select("div.row-travels div.yj div._notelist div.tn-list div.tn-item");
        System.out.println("建立连接获取链接成功！准备开始遍历资源");
        Thread.sleep(3000);
        int number=0;
        for (Element element : elements) {
            String href ="https://www.mafengwo.cn"+ element.select("div.tn-image a").attr("href");
            try{
                WebClient webClients = new WebClient(BrowserVersion.CHROME);
                webClients.getOptions().setJavaScriptEnabled(true);              // 启用JS解释器，默认为true
                webClients.getOptions().setCssEnabled(true);                    // 是否开启css支持
                webClients.getOptions().setThrowExceptionOnScriptError(false);   // js运行错误时，是否抛出异常
                webClients.getOptions().setThrowExceptionOnFailingStatusCode(false);
                webClients.getOptions().setTimeout(30 * 1000);
                webClients.getPage("https://www.mafengwo.cn/");
                webClients.waitForBackgroundJavaScript(10000);               // 等待js后台执行10秒
                HtmlPage pages = webClients.getPage(href);
                webClients.waitForBackgroundJavaScript(20 * 1000);               // 等待js后台执行30秒
                String pageSources = pages.asXml();

                Document docs = Jsoup.parse(pageSources);

                //Elements select = doc.select("div.wrapper div.container div.n-content div.hotel-list");
                System.out.println("===============================================================");

                //System.out.println(doc);
                //获取推文攻略题目
                String title = docs.select("div.set_index div._j_titlebg div.vi_con h1").text();
                System.out.println(title);
                if(title=="")
                    continue;

                System.out.println("===============================================================");
                //获取内容
                String strategy_content = docs.select("div.view_con div.vc_article div._j_content_box p").text();
                System.out.println(strategy_content);

                if(strategy_content=="")
                    continue;

                //获取推荐景点
                String recommend = docs.select("div.slide-right-container div.its_others div.mdd_info a img").attr("alt");
                System.out.println(recommend);

                if(recommend=="")
                    continue;
//
                //获取封面图
                String src = docs.select("div.article_index dt a img").attr("src");
                System.out.println(src);
                if(src=="")
                    continue;
//                String strategy_cover= Jsouptest_getScenery_ByArea.downImages("d:"+ File.separator+"img",src);//图片文件存放地址
//                System.out.println(strategy_cover);

                int user_id =(int) Math.round(Math.random()*5)+1;

                Strategy strategy =new Strategy();
                strategy.setTitle(title);
                strategy.setRecommend(recommend);
//                strategy.setStrategy_cover(strategy_cover);
                strategy.setContent(strategy_content);
                strategy.setUser_id(user_id);

//                Strategy_AddFromUrl.addS(strategy);

                number++;
                System.out.println("第"+number+"次成功");
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                Thread.sleep(5000);
            }
        }



        System.out.println("页面解析完成");

    }

    private static void parse(String html) throws Exception {
        //解析html获取Document
        Document doc = Jsoup.parse(html);

        //Elements select = doc.select("div.wrapper div.container div.n-content div.hotel-list");
        System.out.println("===============================================================");

        //System.out.println(doc);
        //获取推文攻略题目
        String title = doc.select("div.set_index div._j_titlebg div.vi_con h1").text();
        System.out.println(title);

        System.out.println("===============================================================");
        //获取内容
        String strategy_content = doc.select("div.view_con div.vc_article div._j_content_box p").text();
        System.out.println(strategy_content);

        //获取推荐景点
        String recommend = doc.select("div.slide-right-container div.its_others div.mdd_info a img").attr("alt");
        System.out.println(recommend);
//
        //获取封面图
        String src = doc.select("div.article_index dt a img").attr("src");
        System.out.println(src);
        String strategy_cover= Jsouptest_getScenery_ByArea.downImages("d:"+ File.separator+"img",src);//图片文件存放地址
        System.out.println(strategy_cover);

        int user_id =(int) Math.round(Math.random()*5)+1;

        Strategy strategy =new Strategy();
        strategy.setTitle(title);
        strategy.setRecommend(recommend);
        strategy.setStrategy_cover(strategy_cover);
        strategy.setContent(strategy_content);
        strategy.setUser_id(user_id);

        Strategy_AddFromUrl.addS(strategy);
//
//        //获取图片
//        String photo_href ="https://www.mafengwo.cn/" + doc.select("div.row-picture a.photo").attr("href");
//
//        try {
//            WebClient webClient = new WebClient(BrowserVersion.CHROME);
//            webClient.getOptions().setJavaScriptEnabled(true);              // 启用JS解释器，默认为true
//            webClient.getOptions().setCssEnabled(true);                    // 是否开启css支持
//            webClient.getOptions().setThrowExceptionOnScriptError(false);   // js运行错误时，是否抛出异常
//            webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
//            webClient.getOptions().setTimeout(30 * 1000);                   // 设置连接超时时间
//            webClient.getPage("https://www.mafengwo.cn/");
//            webClient.waitForBackgroundJavaScript(10000);               // 等待js后台执行30秒
//            HtmlPage page = webClient.getPage(photo_href);
//            webClient.waitForBackgroundJavaScript(5 * 1000);               // 等待js后台执行30秒
//            String pageSource = page.asXml();
//
//            //解析页面
//            Document doc1s = Jsoup.parse(pageSource);
//
//            Elements elements = doc1s.select("div.album-total ul li");
//            int i=0;
//            StringBuilder stringBuilder = new StringBuilder();
//            for (Element element : elements) {
//                String scenery_pic_src = element.select("img").attr("src");
//                i++;
//                String scenery_pic= Jsouptest_getScenery_ByArea.downImages("d:"+ File.separator+"img",scenery_pic_src);//图片文件存放地址
//                stringBuilder.append(scenery_pic);
//                stringBuilder.append(";");
//                if(i==10)
//                    break;
//            }
//            String scenery_picture = stringBuilder.toString();//景点的图片名集合
//            System.out.println(scenery_picture);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("出现错误了！！！");
//        }
//
//        //获取景点文字介绍
//        String scenery_intro = doc.select("div.mod-detail div.summary").text();
//        System.out.println(scenery_intro);
//
//        //获取景点导航路线问题
//
//        Elements loads_li = doc.select("div.mod-innerScenic div.mbd ul.clearfix li");
//        StringBuilder scenery_li = new StringBuilder();
//        scenery_li.append("可供游玩的内置景点有：");
//        for (Element li : loads_li) {
//            String attr = li.select("a").attr("title");
//            scenery_li.append(attr);
//            scenery_li.append("、");
//        }
//        String scenery_route = scenery_li.toString();//景点的游玩路线
//        try {
//            scenery_route = scenery_route.substring(0, scenery_route.lastIndexOf("、"))+"等等";
//            System.out.println(scenery_route);
//        }catch (Exception e){
//            e.printStackTrace();
//        }


    }


}
