package service;

import dao.SceneryMapper;
import org.springframework.stereotype.Service;
import pojo.Scenery;
import pojo.Scenery;


import javax.annotation.Resource;
import java.util.List;

@Service
public class SceneryServiceImpl implements SceneryService {
    @Resource
    private SceneryMapper sceneryMapper;


    @Override
    public List<Scenery> getSceneryList(int currentPageNo, int pageSize) {
        List<Scenery>scenerysList = null;
        currentPageNo = (currentPageNo-1)*pageSize;
        scenerysList =sceneryMapper.getSceneryList(currentPageNo,pageSize);
        return  scenerysList;
    }

    @Override
    public List<Scenery> getSceneryListByName(String scenery_name) {
        List<Scenery>sceneryList = null;
        sceneryList = sceneryMapper.getSceneryListByName(scenery_name);
        return sceneryList;

    }

    @Override
    public int insertScenery(Scenery scenery) {
        int flag = sceneryMapper.insert(scenery);
        return flag;
    }

    @Override
    public int getCount() {
        int count = 0;
        count = sceneryMapper.getCount();
        return count;
    }

    @Override
    public Scenery sceneryDetail(int scenery_id) {
        Scenery scenery = null;
        scenery = sceneryMapper.selectByPrimaryKey(scenery_id);
        return scenery;
    }

    @Override
    public int updateByPrimaryKeySelective(Scenery scenery) {
        int flag = sceneryMapper.updateByPrimaryKeySelective(scenery);
        return flag;
    }

    @Override
    public int sceneryDel(int scenery_id) {
        int flag = sceneryMapper.deleteByPrimaryKey(scenery_id);
        return flag;
    }

    @Override
    public int htaddScenery(Scenery scenery) {

        int a = sceneryMapper.htselectByName(scenery.getScenery_name());
        int res =0;
        if(a==0){
            res = sceneryMapper.htaddScenery(scenery);
        }else {
            System.out.println("数据库已有该数据");
        }

        return res;
    }
}
