package service;

import org.springframework.stereotype.Service;
import pojo.Scenery;

import java.util.List;

@Service
public interface SceneryService {
    public List<Scenery> getSceneryList(int currentPageNo, int pageSize);
    public List<Scenery>getSceneryListByName(String scenery_name);
    public int insertScenery(Scenery scenery);
    public  int getCount();
    public  Scenery sceneryDetail(int scenery_id);
    public  int updateByPrimaryKeySelective(Scenery scenery);
    public  int sceneryDel(int scenery_id);


    public int htaddScenery(Scenery scenery);
}
