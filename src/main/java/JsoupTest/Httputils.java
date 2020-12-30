package JsoupTest;

import com.eclipsesource.v8.V8;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

@Component
public class Httputils {
    private PoolingHttpClientConnectionManager cm;

    public Httputils() {
        this.cm = new PoolingHttpClientConnectionManager();
        //设置最大连接数
        this.cm.setMaxTotal(100);
        //设置每个主机的最大连接数
        this.cm.setDefaultMaxPerRoute(10);
    }

    //根据url下载页面数据
    public String doGetHtml(String url) {

        //获取HttpClient对象
        CloseableHttpClient httpClient= HttpClients.custom().setConnectionManager(this.cm).build();

        //创建HTTPGet请求对象
        HttpGet httpGet = new HttpGet(url);

        //设置请求信息
        httpGet.setConfig(this.getConfig());
        httpGet.addHeader("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36");
        httpGet.addHeader("accept","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3");
        httpGet.addHeader("accept-encoding","gzip, deflate, br");
        httpGet.addHeader("accept-language","zh-CN,zh;q=0.9");
        httpGet.addHeader("cache-control","no-cache");
        httpGet.addHeader("pragma","no-cache");
        httpGet.addHeader("pgrade-insecure-requests","1");

        //使用HttpClient发起请求，获取响应
        CloseableHttpResponse response=null;
        try {
             response = httpClient.execute(httpGet);
             //解析响应，返回结果
            if(response.getStatusLine().getStatusCode()==200){
                //判断响应体Entity是否不为空，如果不为空j就可以使用EntityUtils
                if(response.getEntity() !=null){
                    String content = EntityUtils.toString(response.getEntity(), "utf8");
                    return content;
                }
            }else if(response.getStatusLine().getStatusCode()==521){
                HttpEntity entity = response.getEntity();
                String html=EntityUtils.toString(entity,"utf-8");
                System.out.println(html);
                //处理从服务器返回的JS，并执行
                String js=html.trim().replace("<script>", "").replace("</script>", "").replace("eval(y.replace(/\\b\\w+\\b/g, function(y){return x[f(y,z)-1]||(\"_\"+y)}))","y.replace(/\\b\\w+\\b/g, function(y){return x[f(y,z)-1]||(\"_\"+y)})");
                V8 runtime = V8.createV8Runtime();
                String result=runtime.executeStringScript(js);
                System.out.println("1111111111111111111111111111111111111111111");
                System.out.println(result);
                System.out.println("1111111111111111111111111111111111111111111");
                //第二次处理JS并执行
                result=result.substring(result.indexOf("__jsl_clearance"),result.indexOf("return _12.join('')})()")+23);
                System.out.println(result);
                String __jsl_clearance=runtime.executeStringScript(result);
                System.out.println(__jsl_clearance);
                runtime.release();
                httpGet.setHeader("Cookie",__jsl_clearance);
                response=httpClient.execute(httpGet);
                if(response.getEntity() !=null){
                    String content = EntityUtils.toString(response.getEntity(), "utf8");
                    return content;
                }
            }else {
                System.out.println("-------------------------------------------");
                System.out.println(EntityUtils.toString(response.getEntity()));
                System.out.println("===========================================");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            //关闭response
            if(response !=null){
                try {
                    response.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return "";

    }


    //下载图片
    public String doGetImage(String url){

        //获取HttpClient对象
        CloseableHttpClient httpClient= HttpClients.custom().setConnectionManager(this.cm).build();

        //创建HTTPGet请求对象
        HttpGet httpGet = new HttpGet(url);

        //设置请求信息
        httpGet.setConfig(this.getConfig());
        httpGet.addHeader("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36");
        httpGet.addHeader("accept","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3");
        httpGet.addHeader("accept-encoding","gzip, deflate, br");
        httpGet.addHeader("accept-language","zh-CN,zh;q=0.9");
        httpGet.addHeader("cache-control","no-cache");
        httpGet.addHeader("pragma","no-cache");
        httpGet.addHeader("pgrade-insecure-requests","1");

        //使用HttpClient发起请求，获取响应
        CloseableHttpResponse response=null;
        try {
            response = httpClient.execute(httpGet);
            //解析响应，返回结果
            if(response.getStatusLine().getStatusCode()==200){
                //判断响应体Entity是否不为空，如果不为空j就可以使用EntityUtils
                if(response.getEntity() !=null){
                    //下载图片
                    //获取文件后缀
                    String extName = url.substring(url.lastIndexOf("."));
                    //创建图片名，重命名图片
                    String picName = UUID.randomUUID().toString() +extName;

                    //下载图片
                    //声明OupPutStream
                    OutputStream outputStream = new FileOutputStream(new File("C:\\Users\\ASUS\\Desktop\\images\\")+ picName);

                    response.getEntity().writeTo(outputStream);

                    //返回图片的名称
                    return picName;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            //关闭response
            if(response !=null){
                try {
                    response.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return "";

    }

    //设置请求的信息
    private RequestConfig getConfig() {
        RequestConfig config = RequestConfig.custom()
                .setConnectTimeout(10000)  //创建连接的最长时间
                .setConnectionRequestTimeout(10000)  //获取连接的最长时间
                .setSocketTimeout(10000)  //数据传输的最长时间
                .build();

        return config;
    }
}
