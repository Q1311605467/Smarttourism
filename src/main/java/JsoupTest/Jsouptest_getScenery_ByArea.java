package JsoupTest;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import pojo.Scenery;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;

public class Jsouptest_getScenery_ByArea {
    static int area_id;

    public static void main(String[] args) {
//        String url = "https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10186.html";//丽江
//        String url = "https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10035.html";//成都
//        String url = "https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10156.html";//杭州
        String url = "https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10030.html";//三亚

        //获取地区对应景点网站的a标签属性的href
        List<String> urls = getScenery_href(url);

        System.out.println("---------------------------");

        //根据上一个url地址解析获取到的地区url集合（href集合），逐一建立连接并且继续获取网页信息
        getScenery_message(urls);
    }


    private static List<String> getScenery_href(String url) {

        //屏蔽HtmlUnit等系统 log
        LogFactory.getFactory().setAttribute("org.apache.commons.logging.Log","org.apache.commons.logging.impl.NoOpLog");
        java.util.logging.Logger.getLogger("com.gargoylesoftware").setLevel(Level.OFF);
        java.util.logging.Logger.getLogger("org.apache.http.client").setLevel(Level.OFF);


        List<String> urls=new ArrayList<>();
        try{
            Document doc = Jsoup.connect(url)
                    .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36")
                    .timeout(30000)
                    .get();
            //地区名
            String name = doc.select("div.title h1").text();//获取地区名
            System.out.println(name);

            //获取该地区在数据库中的id
            area_id= Area_AddFromUrl.htgetArea_idByName(name);
            System.out.println(area_id);

            //获取相关酒店的url,并建立连接，获取页面对象(ps:这个页面不仅有酒店信息，还有相关地区的天气信息)
            Elements jingdian = doc.select("div.navbar-con li.navbar-scenic a.navbar-btn");

            String url1s ="https://www.mafengwo.cn"+ jingdian.attr("href");//解析文档对象，获取url
            System.out.println(url1s);

            Thread.sleep(3000);

            // HtmlUnit 模拟浏览器
            WebClient webClient = new WebClient(BrowserVersion.CHROME);
            webClient.getOptions().setJavaScriptEnabled(true);              // 启用JS解释器，默认为true
            webClient.getOptions().setCssEnabled(true);                    // 是否开启css支持
            webClient.getOptions().setThrowExceptionOnScriptError(false);   // js运行错误时，是否抛出异常
            webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
            webClient.getOptions().setTimeout(10 * 1000);                   // 设置连接超时时间
            HtmlPage page = webClient.getPage(url1s);
            webClient.waitForBackgroundJavaScript(10 * 1000);               // 等待js后台执行30秒
            String pageAsXml = page.asXml();

            Document doc1s = Jsoup.parse(pageAsXml,url1s);
            Elements elements = doc1s.select("div.row-allScenic div.bd a");
            for (Element a : elements) {
                urls.add("https://www.mafengwo.cn"+a.attr("href"));
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                Thread.sleep(10000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            Random random=new Random();
            try {
                Thread.sleep(random.nextInt(10000)*2);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            return urls;
        }

    }

    private static void getScenery_message(List<String> urls) {
        if(urls !=null){
            //屏蔽HtmlUnit等系统 log
            LogFactory.getFactory().setAttribute("org.apache.commons.logging.Log","org.apache.commons.logging.impl.NoOpLog");
            java.util.logging.Logger.getLogger("com.gargoylesoftware").setLevel(Level.OFF);
            java.util.logging.Logger.getLogger("org.apache.http.client").setLevel(Level.OFF);
            int number=0;
            for (String url : urls) {
                try{
                    number++;
                    WebClient web = new WebClient(BrowserVersion.CHROME);
                    web.getOptions().setJavaScriptEnabled(true);              // 启用JS解释器，默认为true
                    web.getOptions().setCssEnabled(true);                    // 是否开启css支持
                    web.getOptions().setThrowExceptionOnScriptError(false);   // js运行错误时，是否抛出异常
                    web.getOptions().setThrowExceptionOnFailingStatusCode(false);
                    web.getOptions().setTimeout(30 * 1000);                   // 设置连接超时时间
                    web.getPage("https://www.mafengwo.cn/");
                    web.waitForBackgroundJavaScript(10000);               // 等待js后台执行30秒
                    HtmlPage pages = web.getPage(url);
                    web.waitForBackgroundJavaScript(5 * 1000);               // 等待js后台执行30秒
                    String pageSource = pages.asXml();

                    Document doc = Jsoup.parse(pageSource);

                    //获取景点名称
                    String scenery_name = doc.select("div.row-top div.title h1").text();
                    System.out.println(scenery_name);

                    //获取景点地址
                    String scenery_address = doc.select("div.mod-location div.mhd p").text();
                    System.out.println(scenery_address);

                    //获取封面图
                    String src = doc.select("div.row-picture div.pic-big img").attr("src");

                    String scenery_cover= Jsouptest_getScenery_ByArea.downImages("d:"+ File.separator+"img",src);//图片文件存放地址
                    System.out.println(scenery_cover);

                    Thread.sleep(3000);
                    //获取图片
                    String photo_href ="https://www.mafengwo.cn/" + doc.select("div.row-picture a.photo").attr("href");

                    WebClient webClient = new WebClient(BrowserVersion.CHROME);
                    webClient.getOptions().setJavaScriptEnabled(true);              // 启用JS解释器，默认为true
                    webClient.getOptions().setCssEnabled(true);                    // 是否开启css支持
                    webClient.getOptions().setThrowExceptionOnScriptError(false);   // js运行错误时，是否抛出异常
                    webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
                    webClient.getOptions().setTimeout(30 * 1000);                   // 设置连接超时时间
                    webClient.getPage("https://www.mafengwo.cn/");
                    webClient.waitForBackgroundJavaScript(10000);               // 等待js后台执行30秒
                    HtmlPage page = webClient.getPage(photo_href);
                    webClient.waitForBackgroundJavaScript(5 * 1000);               // 等待js后台执行30秒
                    String pageSources = page.asXml();

                    //解析页面
                    Document doc1s = Jsoup.parse(pageSources);

                    Elements elements = doc1s.select("div.album-total ul li");
                    int i=0;
                    StringBuilder stringBuilder = new StringBuilder();
                    for (Element element : elements) {
                        String scenery_pic_src = element.select("img").attr("src");
                        i++;
                        String scenery_pic= Jsouptest_getScenery_ByArea.downImages("d:"+ File.separator+"img",scenery_pic_src);//图片文件存放地址
                        stringBuilder.append(scenery_pic);
                        stringBuilder.append(";");
                        if(i==10)
                            break;
                    }
                    String scenery_picture = stringBuilder.toString();//景点的图片名集合
                    System.out.println(scenery_picture);



                    //获取景点文字介绍
                    String scenery_intro = doc.select("div.mod-detail div.summary").text();
                    System.out.println(scenery_intro);

                    //获取景点导航路线问题

                    Elements loads_li = doc.select("div.mod-innerScenic div.mbd ul.clearfix li");
                    StringBuilder scenery_li = new StringBuilder();
                    scenery_li.append("可供游玩的内置景点有：");
                    for (Element li : loads_li) {
                        String attr = li.select("a").attr("title");
                        scenery_li.append(attr);
                        scenery_li.append("、");
                    }
                    String scenery_route = scenery_li.toString();//景点的游玩路线
                    try {
                        scenery_route = scenery_route.substring(0, scenery_route.lastIndexOf("、"))+"等等";
                        System.out.println(scenery_route);
                    }catch (Exception e){
                        e.printStackTrace();
                    }

                    Scenery scenery=new Scenery();
                    scenery.setScenery_name(scenery_name);
                    scenery.setScenery_address(scenery_address);
                    scenery.setNavigation_route(scenery_route);
                    scenery.setScenery_picture(scenery_picture);
                    scenery.setScenery_intro(scenery_intro);
                    scenery.setScenery_cover(scenery_cover);
                    scenery.setBrowse_num(0);
                    scenery.setComment("五星好评！！！");
                    scenery.setArea_id(area_id);

                    Scenery_AddFromUrl.addScenery(scenery);


                }catch (Exception e){
                    e.printStackTrace();
                    System.out.println("出现错误了2！！！！");
                }finally {
                    System.out.println("第"+number+"次运行成功！");
                    try {
                        Thread.sleep(10000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    Random random=new Random();
                    try {
                        Thread.sleep(random.nextInt(10000)*2);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                    if(number>=15)
                        break;
                }

            }
        }
    }

    //根据url下载图片
    public static String downImages(String filePath, String imgUrl) {
        // 若指定文件夹没有，则先创建
        File dir = new File(filePath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        // 截取图片文件名
        String fileName = System.currentTimeMillis()+ RandomUtils.nextInt(1000000)+"_SSM.jpg";

//        try {
//            // 文件名里面可能有中文或者空格，所以这里要进行处理。但空格又会被URLEncoder转义为加号
//            String urlTail = URLEncoder.encode(fileName, "UTF-8");
//            // 因此要将加号转化为UTF-8格式的%20
//            imgUrl = imgUrl.substring(0, imgUrl.lastIndexOf('/') + 1) + urlTail.replaceAll("\\+", "\\%20");
//
//            System.out.println("=======================");
//            System.out.println(imgUrl);
//
//            System.out.println("=======================");
//
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        // 写出的路径
        File file = new File(filePath + File.separator + fileName);

        try {
            // 获取图片URL
            URL url = new URL(imgUrl);
            // 获得连接
            URLConnection connection = url.openConnection();
            // 设置10秒的相应时间
            connection.setConnectTimeout(10 * 1000);
            // 获得输入流
            InputStream in = connection.getInputStream();
            // 获得输出流
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(file));
            // 构建缓冲区
            byte[] buf = new byte[1024];
            int size;
            // 写入到文件
            while (-1 != (size = in.read(buf))) {
                out.write(buf, 0, size);
            }
            out.close();
            in.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            return fileName;
        }

    }
}
