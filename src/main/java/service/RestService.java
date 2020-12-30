package service;

import org.springframework.stereotype.Service;
import pojo.Guide;
import pojo.Rest;

import java.util.List;

@Service
public interface RestService {
    public List<Rest> getRestList(int currentPageNo, int pageSize);
    public List<Rest>getRestListByName(String rest_name);
    public int insertRest(Rest rest);
    public  int getCount();
    public  Rest restDetail(int rest_id);
    public  int updateByPrimaryKeySelective(Rest rest);
    public  int restDel(int rest_id);

    public int htaddRest(Rest rest);
}
