package tools;


import net.sf.json.JSONObject;
import pojo.CheckTextResult;
import pojo.Hits;
import pojo.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * @作者: tjx
 * @描述: 文本审核API
 * @创建时间: 创建于17:19 2018/9/7
 **/
public class CheckTextAPI {

    private static final String URL = "https://aip.baidubce.com/rest/2.0/solution/v1/text_censor/v2/user_defined?";

    /**
     * @param content 需要审核的文本
     *
     * @return true 通过 false 失败
     */
    public CheckTextResult check(String content){

        //获取access_token
        String access_token = AuthService.getAuth();
        Map<String,String> parameters = new HashMap<>();
        //添加调用参数
        parameters.put("access_token",access_token);
        parameters.put("Content-Type","application/x-www-form-urlencoded");
        parameters.put("text",content);
        //调用文本审核接口
        String result = HttpUtil.doPost(URL, parameters);


        // JSON转换
        JSONObject jsonObj = JSONObject.fromObject(result);
        Map<String, Class> classMap = new HashMap<String, Class>();
        classMap.put("data", Data.class);
        classMap.put("hits", Hits.class);
        classMap.put("checkTextResult",CheckTextResult.class);
        CheckTextResult bean = (CheckTextResult)JSONObject.toBean(jsonObj, CheckTextResult.class, classMap);

        return bean;
    }

//    public static void main(String[] args) {
//        System.out.println( new CheckTextAPI().check("你好"));
//    }
}
