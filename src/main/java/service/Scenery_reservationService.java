package service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import pojo.Scenery_Reservation;

import java.util.List;

@Service
public interface Scenery_reservationService {

    public List<Scenery_Reservation> getMySceneryReserve(int user_id);

    public int cancelReserve(int scen_reserv_id);
    public int getCount();
    public List<Scenery_Reservation> getReservationList(int currentPageNo,int pageSize);
}
