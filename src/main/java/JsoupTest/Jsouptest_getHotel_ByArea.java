package JsoupTest;


import org.apache.commons.lang.math.RandomUtils;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import pojo.Hotel;

import java.io.*;
import java.net.MalformedURLException;
import java.util.Random;
import java.util.logging.Level;

public class Jsouptest_getHotel_ByArea {


    public static void main(String[] args) throws Exception {

//        String url="http://www.mafengwo.cn/travel-scenic-spot/mafengwo/10186.html";//丽江
//        String url ="http://www.mafengwo.cn/travel-scenic-spot/mafengwo/10035.html";//成都
//        String url ="http://www.mafengwo.cn/travel-scenic-spot/mafengwo/10156.html";//杭州
        String url ="http://www.mafengwo.cn/travel-scenic-spot/mafengwo/10030.html";//三亚

        //通过地区（Area）的url来进行想要的信息搜索
        getHotel_message(url);

    }

    private static void getHotel_message(String url) throws InterruptedException, Exception {

        //屏蔽HtmlUnit等系统 log
        LogFactory.getFactory().setAttribute("org.apache.commons.logging.Log","org.apache.commons.logging.impl.NoOpLog");
        java.util.logging.Logger.getLogger("com.gargoylesoftware").setLevel(Level.OFF);
        java.util.logging.Logger.getLogger("org.apache.http.client").setLevel(Level.OFF);

        int number=0;
        int area_id;


        try {
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
            String elss = doc.select("li.navbar-hotels >a").attr("href");
            elss=elss.substring(0,elss.lastIndexOf('/')+1);

            Thread.sleep(3000);
            String hotel_url = "https://www.mafengwo.cn" + elss;
            System.out.println(hotel_url);

            // HtmlUnit 模拟浏览器
//            WebClient webClient = new WebClient(BrowserVersion.CHROME);
//            webClient.getOptions().setJavaScriptEnabled(true);              // 启用JS解释器，默认为true
//            webClient.getOptions().setCssEnabled(true);                    // 是否开启css支持
//            webClient.getOptions().setThrowExceptionOnScriptError(false);   // js运行错误时，是否抛出异常
//            webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
//            webClient.getOptions().setTimeout(30 * 1000);                   // 设置连接超时时间
//            HtmlPage page = webClient.getPage(hotel_url);
//            webClient.waitForBackgroundJavaScript(30 * 1000);               // 等待js后台执行30秒
//            String pageAsXml = page.asXml();

//            System.out.println("222222222222222222");
//            File input = new File("E:\\我\\大三下\\软件技术应用设计专周\\数据库文件\\丽江酒店攻略网页\\lijiang.html");//丽江
//            File input = new File("E:\\我\\大三下\\软件技术应用设计专周\\数据库文件\\丽江酒店攻略网页\\成都.html");//成都
//            File input = new File("E:\\我\\大三下\\软件技术应用设计专周\\数据库文件\\丽江酒店攻略网页\\杭州.html");//杭州
            File input = new File("E:\\我\\大三下\\软件技术应用设计专周\\数据库文件\\丽江酒店攻略网页\\三亚.html");//三亚
            Document docs = Jsoup.parse(input,"UTF-8", hotel_url);

//            Document hotel_doc = Jsoup.parse(page.asXml());
            Elements elements = docs.select("div.wrapper div.container div.n-content div.hotel-list div.clearfix");
//            System.out.println(elements);
            for (Element element : elements) {
                //获取酒店名称
                String hotel_name = element.select("div.hotel-title a").text();
                System.out.println(hotel_name);

                //获取酒店住宿条件（介绍？）
                String hotel_accommodation = element.select("div.hotel-info p").attr("title");
                System.out.println(hotel_accommodation);

                //获取酒店地址
                String hotel_address = element.select("div.hotel-info div.location span").attr("title");
                System.out.println(hotel_address);

                //获取酒店价格
                Element first = element.select("div.hotel-btns a").first();
                Elements strongs = first.select("div.price strong");
                int i=1;
                String strong_text="1";
                for (Element strong : strongs) {
                    i++;
                    if(i==3){
                        strong_text= strong.text();
                        break;
                    }
                }
                float hotel_price= Float.parseFloat(strong_text);//酒店的价格
                System.out.println(hotel_price);

                //获取酒店封面
                String src = element.select("div.hotel-pic >a >img").attr("src");
                src=src.replaceFirst(".","E:/我/大三下/软件技术应用设计专周/数据库文件/丽江酒店攻略网页");
                System.out.println(src);
                //"http://p1-q.mafengwo.net/s12/M00/E0/17/wKgED1vJqd6AOdOaAD1zNAFLoLE43.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90"
                String hotel_cover= Jsouptest_getHotel_ByArea.downImages("d:"+ File.separator+"img",src);//图片文件存放地址

                //获取酒店链接
                String hotel_href = element.select("div.hotel-pic >a").attr("href");
                System.out.println(hotel_href);

                //获取联系电话

                String hotel_tel = get_tel();
                System.out.println(hotel_tel);

                Hotel hotel =new Hotel();
                hotel.setHotel_name(hotel_name);
                hotel.setHotel_address(hotel_address);
                hotel.setHotel_tel(hotel_tel);
                hotel.setHotel_cover(hotel_cover);
                hotel.setAccommodation(hotel_accommodation);
                hotel.setHotel_price(hotel_price);
                hotel.setHotel_href(hotel_href);
                hotel.setArea_id(area_id);

//                Hotel_AddFromUrl.addHotel(hotel);
            }

            System.out.println("--------------------");


        }catch (Exception e){
            e.printStackTrace();

        }finally {
            Thread.sleep(10000);
            Random random=new Random();
            Thread.sleep(random.nextInt(10000)*2);

            //这个break是为了控制下载循环url的数量，去掉的话就会一直下载到下完为止，不去掉的话就只会进行number次遍历

        }

    }


    private static String get_tel() {

        StringBuilder str=new StringBuilder();//定义变长字符串
        Random random=new Random();

        for(int i=0;i<8;i++){
            str.append(random.nextInt(10));
        }

        return str.toString();
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
//            URL url = new URL(imgUrl);//原始程序
            // 获得连接
//            URLConnection connection = url.openConnection();//原始程序
            // 设置10秒的相应时间
//            connection.setConnectTimeout(10 * 1000);//原始程序
            // 获得输入流
//            InputStream in = connection.getInputStream();//原程序
            InputStream in =new FileInputStream(imgUrl);
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
