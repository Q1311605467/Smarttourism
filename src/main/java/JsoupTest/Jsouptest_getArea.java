package JsoupTest;


import org.apache.commons.lang.math.RandomUtils;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import pojo.Area;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Jsouptest_getArea {

    //爬取地区数据
    public static void main(String[] args) throws IOException, InterruptedException {

        String url="https://www.mafengwo.cn/mdd/";

        //获取地区对应网站的a标签属性的href
        List<String> urls = getUrlsFromIndex1(url);

        //根据上一个url地址解析获取到的地区url集合（href集合），逐一建立连接并且继续获取网页信息
        List<Area> areaList= getAreaListFromUrls(urls);
    }

    //从众多的urls里进入获取地区二级界面信息，地区Area所有的4个属性已经可以全部从网页上下载（爬虫爬下来）
    private static List<Area> getAreaListFromUrls(List<String> urls) throws InterruptedException {
        if(urls!=null){
            int number=0;
            for (String url : urls) {
                try {
                    Document doc = Jsoup.connect(url)
                            .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36")
                            .timeout(30000)
                            .get();
                    //地区名
                    String name = doc.select("div.title h1").text();//获取地区名
                    System.out.println(name);

                    //地区（景点）简介获取
                    Elements jingdian = doc.select("div.navbar-con li.navbar-scenic a.navbar-btn");

                    String url1s ="https://www.mafengwo.cn"+ jingdian.attr("href");//解析文档对象，获取url
                    System.out.println(url1s);

                    Thread.sleep(3000);
                    Document doc1s = Jsoup.connect(url1s)
                            .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36")
                            .timeout(30000)
                            .get();
                    String intro = doc1s.select("div.row-summary div.wrapper span").text();//地区的文本介绍

                    //旅游航线获取
                    Elements hangxian = doc.select("div.navbar-con li.navbar-line a.navbar-btn");

                    String url2s ="https://www.mafengwo.cn"+ hangxian.attr("href");//分析出需要的url
                    System.out.println(url2s);

                    Thread.sleep(3000);
                    Document doc2s = Jsoup.connect(url2s)
                            .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36")
                            .timeout(30000)
                            .get();
                    Element firstmodol = doc2s.select("div.row-line").first();//逐步解析我要的路线，也就是马蜂窝里的路线的第一条
                    Element firstP = firstmodol.select("dl.lp-detail dd p").first();
                    Elements spans = firstP.select("span");
                    StringBuilder stringBuilder = new StringBuilder();
                    for (Element span : spans) {
                        String text = span.text();
                        stringBuilder.append(text);
                    }
                    String luxian=stringBuilder.toString();//地区的旅游路线

                    //图片的获取

                    Element firstTuPian = firstmodol.select("dl.lp-lightspot div.ls-imgbox li img[src]").first();//获取第一张图片
                    String src = firstTuPian.attr("data-original");//获取img标签URL的图片路径

                    String fileload= Jsouptest_getArea.downImages("d:"+ File.separator+"img",src);//图片文件存放地址

                    Area area=new Area();
                    area.setArea_name(name);
                    area.setArea_intro(intro);
                    area.setTourist_route(luxian);
                    area.setArea_picture(fileload);

                    System.out.println(number+1);
                    System.out.println(area);

//                    Area_AddFromUrl.addArea(area);
                    System.out.println("第"+number+"次成功");

                    number++;

                }catch (Exception e){
                    e.printStackTrace();

                }finally {
                    Thread.sleep(10000);
                    Random random=new Random();
                    Thread.sleep(random.nextInt(10000)*2);

                    //这个break是为了控制下载循环url的数量，去掉的话就会一直下载到下完为止，不去掉的话就只会进行number次遍历

                    if(number>=50){
                        break;
                    }
                }

            }

        }
        return null;
    }

    //获取对应网站的a标签的href属性
    private static List<String> getUrlsFromIndex1(String url) throws IOException, InterruptedException {
        //创建List放置所有获取的href
        List<String> urls=new ArrayList<>();

        //1、使用Jsoup建立连接
        Connection connect = Jsoup.connect(url);

        //2、设置请求参数，伪装自己，防止被反爬虫
        //把自己的请求伪装成浏览器，以下是个简单的参数，真实参数很多
        connect.userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36");
        connect.timeout(5000);

        //3、发送请求，爬取数据
        Document doc = connect.get();

        //4.解析数据
        Elements elements = doc.select("div.hot-list dd a");

        for (Element element : elements) {
            urls.add("https://www.mafengwo.cn"+element.attr("href"));
        }

        Thread.sleep(5000);
        return urls;
    }


    public void test2() throws IOException {
        //1、使用Jsoup建立连接
        Connection connect = Jsoup.connect("https://blog.csdn.net/baidu_27222643/article/details/75020104");

        //2、设置请求参数，伪装自己，防止被反爬虫
        //把自己的请求伪装成浏览器，以下是个简单的参数，真实参数很多
        connect.userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36");
        connect.timeout(5000);

        //3、发送请求
        Document document = connect.get();
//        String title = document.title();
//        System.out.println("title = " + title);
        //4、通过选择器来解析页面数据
        //4.1、选中含有href属性的a标签
//        Elements elements=document.select("a[href]");
//        for (Element element : elements) {
//            System.out.println(element);
//        }
        //4.2、选中图片标签
        Elements elements = document.select("img[src]");
        for (Element element : elements) {
            System.out.println(element);
        }

    }

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
            return filePath + File.separator + fileName;
        }

    }
}
