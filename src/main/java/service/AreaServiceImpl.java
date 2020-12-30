package service;

import dao.AreaMapper;
import org.springframework.stereotype.Service;
import pojo.Area;
import pojo.Rest;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {

    @Resource
    private AreaMapper areaMapper;

    @Override
    public int htaddArea(Area area) {
        int a=areaMapper.htselByName(area.getArea_name());
        int res=0;
        if(a==0) {
            res = areaMapper.htaddArea(area);
        }else {
            System.out.println("数据库已有该数据");
        }
        return res;
    }

    @Override
    public int htgetArea_idByArea_name(String area_name) {

        int res=areaMapper.htgetArea_idByName(area_name);
        return res;
    }

    @Override
    public int htgetCount() {
        int count = 0;
        count = areaMapper.htgetCount();
        return count;
    }

    @Override
    public List<Area> htgetAreaList(int currentPageNo, int pageSize) {
        List<Area> areaList = null;
        currentPageNo = (currentPageNo-1)*pageSize;
        areaList =areaMapper.htgetAreaList(currentPageNo,pageSize);
        return  areaList;
    }

    @Override
    public int htareaDel(int area_id) {
        int flag = areaMapper.htdeleteByPrimaryKey(area_id);
        return flag;
    }

    @Override
    public Area htareaDetail(int area_id) {
        Area area = null;
        area = areaMapper.htselectByPrimaryKey(area_id);
        return area;
    }

    @Override
    public int htupdateByPrimaryKeySelective(Area area) {
        int flag = areaMapper.htupdateByPrimaryKeySelective(area);
        return flag;
    }

    @Override
    public List<Area> htgetAreaListByName(String area_name) {
        List<Area>  areaList = null;
        areaList = areaMapper.htgetAreaListByName(area_name);
        return areaList;

    }

}
