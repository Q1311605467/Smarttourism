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
import pojo.Rest;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

public class Jsouptest_getRest_ByArea {
    static int area_id;

    public static void main(String[] args) {
//        String url = "https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10186.html";//丽江
//        String url = "https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10035.html";//成都
//        String url = "https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10156.html";//杭州
        String url = "https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10030.html";//三亚

        getRest_message(url);
    }

    private static void getRest_message(String url) {
        //屏蔽HtmlUnit等系统 log
        LogFactory.getFactory().setAttribute("org.apache.commons.logging.Log","org.apache.commons.logging.impl.NoOpLog");
        java.util.logging.Logger.getLogger("com.gargoylesoftware").setLevel(Level.OFF);
        java.util.logging.Logger.getLogger("org.apache.http.client").setLevel(Level.OFF);

        int number=0;
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

            Thread.sleep(3000);

            //获取餐厅总页面
            Element select = doc.select("div.navbar-con li.navbar-food div.navbar-dropmenu li").first();
            String href ="https://www.mafengwo.cn"+ select.select("a").attr("href");


            Document docs = Jsoup.connect(href)
                    .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36")
                    .timeout(30000)
                    .get();
            Elements select1 = docs.select("div.content div.m-recList div.bd ul li div.title h3 a");
            for (Element element : select1) {
                try{
                    //获取餐厅名称
                    String rest_name = element.text();
                    System.out.println(rest_name);

                    Thread.sleep(3000);
                    //获取餐厅实际url
                    String rest_href ="https://www.mafengwo.cn"+ element.attr("href");
                    System.out.println(rest_href);

                    WebClient webClient = new WebClient(BrowserVersion.CHROME);
                    webClient.getOptions().setJavaScriptEnabled(true);              // 启用JS解释器，默认为true
                    webClient.getOptions().setCssEnabled(true);                    // 是否开启css支持
                    webClient.getOptions().setThrowExceptionOnScriptError(false);   // js运行错误时，是否抛出异常
                    webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
                    webClient.getOptions().setTimeout(30 * 1000);                   // 设置连接超时时间
                    webClient.getPage("https://www.mafengwo.cn/");
                    webClient.waitForBackgroundJavaScript(10000);               // 等待js后台执行30秒
                    HtmlPage page = webClient.getPage(rest_href);
                    webClient.waitForBackgroundJavaScript(5 * 1000);               // 等待js后台执行30秒
                    String pageSources = page.asXml();

                    Document doc1 = Jsoup.parse(pageSources);//获取餐厅实体页面

                    Elements select2 = doc1.select("div.m-content div.poi-info");//我需要的绝大部分属性

                    //获取大部分数据
                    Elements messages = select2.select("p");
                    Elements h3s = select2.select("h3");
                    List<String> messagess = new ArrayList<>();

                    for (Element h3 : h3s) {
                        messagess.add(h3.text());
                    }
                    for (Element message : messages) {
                        messagess.add(message.text());
                    }
                    String rest_intro="";
                    String rest_address = "";
                    String rest_tel = "";
                    String consumption = "";
                    for (int i=0;i<messagess.size();i++) {

                        if(messagess.get(i).equals("简介")){
                            rest_intro = messagess.get(i+messagess.size()/2);
                        }else if(messagess.get(i).equals("地址")){
                            rest_address = messagess.get(i+messagess.size()/2);
                        }else if(messagess.get(i).equals("电话")){
                            rest_tel = messagess.get(i+messagess.size()/2);
                        }else if(messagess.get(i).equals("人均消费")){
                            consumption = messagess.get(i+messagess.size()/2);
                        }

                    }
                    //获取餐厅介绍
                    System.out.println(rest_intro);
                    //获取餐厅地址
                    System.out.println(rest_address);
                    //获取餐厅联系电话
                    System.out.println(rest_tel);
                    //获取餐厅人均消费
                    System.out.println(consumption);

                    for(int i=0;i<consumption.length();i++){
                        if(consumption.charAt(i)<'0' || consumption.charAt(i)>'9'){
                            consumption=consumption.substring(0,i);
                            break;
                        }
                    }
                    float rest_consumption = Float.parseFloat(consumption);
                    System.out.println(rest_consumption);

                    //获取封面图
                    String src = doc1.select("div.pic-r a img").attr("src");
                    String rest_cover= Jsouptest_getRest_ByArea.downImages("d:"+ File.separator+"img",src);//图片文件存放地址
                    System.out.println(rest_cover);

                    Rest rest = new Rest();
                    rest.setRest_name(rest_name);
                    rest.setRest_address(rest_address);
                    rest.setRest_tel(rest_tel);
                    rest.setRest_cover(rest_cover);
                    rest.setRest_intro(rest_intro);
                    rest.setConsumption(rest_consumption);
                    rest.setRest_href(rest_href);
                    rest.setArea_id(area_id);

                    Rest_AddFromUrl.addRest(rest);
                    number++;
                    System.out.println("网页第"+number+"次结束!");
                    Thread.sleep(10000);
                }catch (Exception e){
                    e.printStackTrace();
                    System.out.println("循环发生错误了！!!");
                }

            }

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("发生错误了！!!");
        }finally {
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
