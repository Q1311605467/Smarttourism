package service;

import dao.RestMapper;
import org.springframework.stereotype.Service;
import pojo.Guide;
import pojo.Rest;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RestServiceImpl implements RestService {
    @Resource
    private RestMapper restMapper;

    @Override
    public List<Rest> getRestList(int currentPageNo, int pageSize) {
        List<Rest>restsList = null;
        currentPageNo = (currentPageNo-1)*pageSize;
        restsList =restMapper.getRestList(currentPageNo,pageSize);
        return  restsList;
    }

    @Override
    public List<Rest> getRestListByName(String rest_name) {
        List<Rest>restList = null;
        restList = restMapper.getRestListByName(rest_name);
        return restList;

    }

    @Override
    public int insertRest(Rest rest) {
        int flag = restMapper.insert(rest);
        return flag;
    }

    @Override
    public int getCount() {
        int count = 0;
        count = restMapper.getCount();
        return count;
    }

    @Override
    public Rest restDetail(int rest_id) {
        Rest rest = null;
        rest = restMapper.selectByPrimaryKey(rest_id);
        return rest;
    }

    @Override
    public int updateByPrimaryKeySelective(Rest rest) {
        int flag = restMapper.updateByPrimaryKeySelective(rest);
        return flag;
    }

    @Override
    public int restDel(int rest_id) {
        int flag = restMapper.deleteByPrimaryKey(rest_id);
        return flag;
    }

    @Override
    public int htaddRest(Rest rest) {

        int a = restMapper.htselectByName(rest.getRest_name());
        int res = 0;
        if(a==0){
            res = restMapper.htaddRest(rest);
        }else {
            System.out.println("数据库已有该数据");
        }
        return res;
    }
}
