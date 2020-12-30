package dao;

import org.apache.ibatis.annotations.Param;
import pojo.Scenery;

import java.util.List;

public interface SceneryMapper {
    public List<Scenery> getTop3Scenery();

    public Scenery getSceneryBID(@Param("scenery_id") int scenery_id);

    public int addBrowse_num(@Param("scenery_id") int scenery_id);

    public List<Scenery> getSceneryByAreaID(@Param("area_id") int area_id);

    public List<Scenery> getSceneryByAreaIDTop3(@Param("area_id") int area_id);

    /***************************后台********************************************************/
    int deleteByPrimaryKey(Integer scenery_id);

    int insert(Scenery record);

    int insertSelective(Scenery record);

    Scenery selectByPrimaryKey(Integer scenery_id);

    int updateByPrimaryKeySelective(Scenery record);

    int updateByPrimaryKeyWithBLOBs(Scenery record);

    int updateByPrimaryKey(Scenery record);


    int getCount();

    List<Scenery> getSceneryList(@Param("currentPageNo") Integer currentPageNo, @Param("pageSize") Integer pageSize);

    List<Scenery> getSceneryListByName(@Param("scenery_name") String scenery_name);


    //以下两条用于爬虫
    public int htaddScenery(@Param("scenery") Scenery scenery);

    public int htselectByName(@Param("scenery_name") String scenery_name);
}
