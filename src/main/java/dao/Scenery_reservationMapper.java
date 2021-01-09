package dao;

import org.apache.ibatis.annotations.Param;
import pojo.Scenery_Reservation;
import pojo.User;

import java.util.List;

public interface Scenery_reservationMapper {
    /**增加景区预约表**/
    int AddSR(Scenery_Reservation scenery_reservation);
    /**取消景区预约**/
    int cancelSR(@Param("scen_reserv_id") int scen_reserv_id);
    /**获取个人景区预约信息列表**/
    public List<Scenery_Reservation> getMySceneryReserve(@Param("user_id") int user_id);
    int getCount();
    List<Scenery_Reservation> getReservationList(@Param("currentPageNo") Integer currentPageNo, @Param("pageSize") Integer pageSize);

}
