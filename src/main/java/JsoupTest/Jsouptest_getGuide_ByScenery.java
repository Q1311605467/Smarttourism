package JsoupTest;

import org.apache.commons.lang.math.RandomUtils;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import pojo.Guide;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.logging.Level;

public class Jsouptest_getGuide_ByScenery {

    public static void main(String[] args) {
//        String url = "https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10186.html";//丽江
//        String url = "https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10035.html";//成都
//        String url = "https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10156.html";//杭州
        String url = "http://www.g855.com/guide/list-0-0-2.html";//

        getGuide_message(url);
    }

    private static void getGuide_message(String url) {
        //屏蔽HtmlUnit等系统 log
        LogFactory.getFactory().setAttribute("org.apache.commons.logging.Log","org.apache.commons.logging.impl.NoOpLog");
        java.util.logging.Logger.getLogger("com.gargoylesoftware").setLevel(Level.OFF);
        java.util.logging.Logger.getLogger("org.apache.http.client").setLevel(Level.OFF);

        try{
            Document doc = Jsoup.connect(url)
                    .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36")
                    .timeout(30000)
                    .get();
            Elements select = doc.select("div.lists div.content dl");
            for (Element element : select) {
                try{

                    //获得链接
                    String href = element.select("dt a").attr("href");

                    Document docs = Jsoup.connect(href)
                            .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36")
                            .timeout(30000)
                            .get();

                    //获取个人简介
                    String guide_intro = docs.select("div.profile div.desc div.texts p").text();
                    System.out.println(guide_intro);

                    //获取导游名字
                    String guide_name = docs.select("div.container div.right div.guideInfo dl.clearfix dd").first().text();
                    guide_name = guide_name.substring(guide_name.lastIndexOf("：")+1,guide_name.length());
                    System.out.println(guide_name);

                    //获得评价
                    String guide_comment = docs.select("div.container div.right div.guideInfo dl.clearfix dd.intro p").first().text();
                    guide_comment = guide_comment.substring(guide_comment.lastIndexOf("：")+1,guide_comment.length());
                    System.out.println(guide_comment);

                    //导游服务
                    String guide_service = "实地口语导游:讲解服务、市内交通服务、生活服务等";

                    //导游费用

                    int a=(int) Math.round(Math.random()*200)+200;

                    Float guide_cost =(float)a;
                    System.out.println(guide_cost);

                    //获得头像
                    String src ="http://www.g855.com/"+ element.select("dt a img").attr("src");
                    String guide_head= Jsouptest_getGuide_ByScenery.downImages("d:"+ File.separator+"img",src);//图片文件存放地址
                    System.out.println(guide_head);

                    Guide guide = new Guide();
                    guide.setGuide_name(guide_name);
                    guide.setGuide_comment(guide_comment);
                    guide.setGuide_cost(guide_cost);
                    guide.setGuide_head(guide_head);
                    guide.setGuide_intro(guide_intro);
                    guide.setGuide_service(guide_service);

                    Guide_AddFromUrl.addGuide(guide);

                    Thread.sleep(2000);
                    break;

                }catch (Exception e){
                    e.printStackTrace();
                    System.out.println("出错啦");
                }
            }

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("发生错误了！");
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
