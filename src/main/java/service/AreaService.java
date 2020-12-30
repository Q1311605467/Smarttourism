package service;

import org.springframework.stereotype.Service;
import pojo.Area;

import java.util.List;

@Service
public interface AreaService {

    public int htaddArea(Area area);

    public int htgetArea_idByArea_name(String area_name);

    public  int htgetCount();

    public List<Area> htgetAreaList(int currentPageNo, int pageSize);//分页得到全部数量

    public  int htareaDel(int area_id);//删除

    public Area htareaDetail(int area_id);//通过id获取地区

    public  int htupdateByPrimaryKeySelective(Area area);

    public List<Area> htgetAreaListByName(String area_name);//模糊搜索得到地区集

}
