package dao;

import org.apache.ibatis.annotations.Param;
import pojo.Hotel;

import java.util.List;

public interface HotelMapper {
    public List<Hotel> getHotelAreaTop3(@Param("area_id") int area_id);

    public List<Hotel> getHotelBArea_id(@Param("area_id") int area_id);

    public List<Hotel> searchHotel(@Param("sn") String sn);

    /***********************后台**********************************************/
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hotel
     *
     * @mbggenerated Wed Mar 25 15:44:30 CST 2020
     */
    int deleteByPrimaryKey(Integer hotel_id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hotel
     *
     * @mbggenerated Wed Mar 25 15:44:30 CST 2020
     */
    int insert(Hotel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hotel
     *
     * @mbggenerated Wed Mar 25 15:44:30 CST 2020
     */
    int insertSelective(Hotel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hotel
     *
     * @mbggenerated Wed Mar 25 15:44:30 CST 2020
     */
    Hotel selectByPrimaryKey(Integer hotel_id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hotel
     *
     * @mbggenerated Wed Mar 25 15:44:30 CST 2020
     */
    int updateByPrimaryKeySelective(Hotel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hotel
     *
     * @mbggenerated Wed Mar 25 15:44:30 CST 2020
     */
    int updateByPrimaryKeyWithBLOBs(Hotel record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hotel
     *
     * @mbggenerated Wed Mar 25 15:44:30 CST 2020
     */
    int updateByPrimaryKey(Hotel record);

    int getCount();
    List<Hotel> getHotelList(@Param("currentPageNo") Integer currentPageNo, @Param("pageSize") Integer pageSize);
    List<Hotel> getHotelListByName(@Param("hotel_name")String hotel_name);

    //以下两条用于爬虫
    public int htaddHotel(@Param("hotel") Hotel hotel);

    public int htselectByName(@Param("hotel_name") String hotel_name);

}
