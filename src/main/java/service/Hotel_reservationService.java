package service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import pojo.Hotel_reservation;

import java.util.List;

@Service
public interface Hotel_reservationService {
    /**获取酒店预约信息列表**/
    public List<Hotel_reservation> getHotle_ReserveList(int currentPageNo, int pageSize);
    /**获取个人酒店预约信息列表**/
    public List<Hotel_reservation> getMyHotle_Reserve(int user_id);
    public int getMyHotle_ReserveCount(int user_id);
    public int getHotle_ReserveCount();
    public int cancelReserve(int reserv_id);

}
