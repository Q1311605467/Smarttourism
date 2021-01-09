package dao;
import org.apache.ibatis.annotations.Param;
import pojo.Hotel_reservation;

import java.util.List;

public interface Hotel_reservationMapper {

    /**增加酒店预约表**/
    int AddHR(Hotel_reservation reserve);
    /**取消酒店预约**/
    int cancelReserve( @Param("reserv_id") int reserv_id);
    /**获取酒店预约信息列表**/
    public List<Hotel_reservation> getHotle_ReserveList(@Param("currentPageNo") Integer currentPageNo, @Param("pageSize") Integer pageSize);
    /**获取个人酒店预约信息列表**/
    public List<Hotel_reservation> getMyHotle_Reserve( @Param("user_id") int user_id);
    /**获取个人酒店预约信息总条数**/
    int getMyHotle_ReserveCount(@Param("user_id") int user_id);
    /**获取酒店预约信息总条数**/
    int getHotle_ReserveCount();

}
