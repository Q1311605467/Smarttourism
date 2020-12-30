package dao;

import org.apache.ibatis.annotations.Param;
import pojo.Area;

import java.util.List;

public interface AreaMapper {
    public Integer getIDBArea_name(@Param("area_name") String area_name);

    public Area getAreaBArea_id(@Param("area_id") int area_id);

    /*********************************************************/
    //后台
    public int htaddArea(@Param("area") Area area);

    public int htgetArea_idByName(@Param("area_name") String area_name);

    public int htselByName(@Param("area_name") String area_name);

    int htgetCount();

    List<Area> htgetAreaList(@Param("currentPageNo") Integer currentPageNo, @Param("pageSize") Integer pageSize);

    int htdeleteByPrimaryKey(@Param("area_id") Integer area_id);

    Area htselectByPrimaryKey(@Param("area_id") int area_id);

    int htupdateByPrimaryKeySelective(@Param("area") Area area);

    List<Area> htgetAreaListByName(@Param("area_name") String area_name);


}
