package tools;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import pojo.Weather;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.zip.GZIPInputStream;

public class WeatherUtils {

    private static String weatherUrl = "http://wthrcdn.etouch.cn/weather_mini?city=";
    /**
     * 通过城市名称获取该城市的天气信息
     */
    public static String GetWeatherData(String cityname) {
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = null;
        try {
            URL url = new URL(weatherUrl + cityname);
            URLConnection conn = url.openConnection();
            InputStream is = conn.getInputStream();
            GZIPInputStream gzin = new GZIPInputStream(is);
            // 设置读取流的编码格式，自定义编码
            InputStreamReader isr = new InputStreamReader(gzin, "utf-8");
            reader = new BufferedReader(isr);
            String line = null;
            while((line = reader.readLine()) != null){
                sb.append(line + " ");
            }
            reader.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sb);
        return sb.toString();
    }


/**
     * 将JSON格式数据进行解析 ，返回一个weather对象
     */
/*

    public static Weather GetWeather(String weatherInfobyJson){
        JSONObject dataOfJson = JSONObject.parseObject(weatherInfobyJson);   // json天气数据
        if(dataOfJson.getInteger("status") != 1000){
            return null;
        }
        // 创建WeatherInfo对象，提取所需的天气信息
        Weather weatherInfo = new Weather();

        // 获取当前日期：日期、星期
        Calendar cal = Calendar.getInstance();    							     // Calendar类的实例化
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日");  // 时间的格式化
        weatherInfo.setTime(cal.getTime());                // 时间

        // 从json数据中提取数据：城市、温度、小提醒
        dataOfJson = JSONObject.parseObject(dataOfJson.getString("data"));
        weatherInfo.setWeather_location(dataOfJson.getString("city"));            // 城市
        weatherInfo.getTemperature(dataOfJson.getString("wendu"));               // 温度
        weatherInfo.setTips(dataOfJson.getString("ganmao"));              // 小提示

        // 获取今天的天气预报信息：最高温度、最低温度、天气
        JSONArray forecast = dataOfJson.getJSONArray("forecast");
        JSONObject result = forecast.getJSONObject(0);
        weatherInfo.setHighTemp(result.getString("high").substring(2));   // 最高气温
        weatherInfo.setLowTemp(result.getString("low").substring(2));     // 最低气温
        weatherInfo.setWeather(result.getString("type"));                 // 天气

        return weatherInfo;
    }
*/
}
