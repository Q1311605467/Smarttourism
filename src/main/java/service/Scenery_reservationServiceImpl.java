package service;

import dao.Scenery_reservationMapper;
import org.springframework.stereotype.Service;
import pojo.Scenery_Reservation;
import pojo.User;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Scenery_reservationServiceImpl implements Scenery_reservationService {
    @Resource
    private Scenery_reservationMapper scenery_reservationMapper;

    @Override
    public List<Scenery_Reservation> getMySceneryReserve(int user_id) {
        List<Scenery_Reservation> SRList=null;
        SRList=scenery_reservationMapper.getMySceneryReserve(user_id);
        return SRList;
    }

    @Override
    public int cancelReserve(int scen_reserv_id) {
        int count=scenery_reservationMapper.cancelSR(scen_reserv_id);
        return count;
    }

    @Override
    public int getCount() {
        return scenery_reservationMapper.getCount();
    }

    @Override
    public List<Scenery_Reservation> getReservationList(int currentPageNo, int pageSize) {
        List<Scenery_Reservation> reservationList = null;
        currentPageNo = (currentPageNo - 1) * pageSize;
        reservationList = scenery_reservationMapper.getReservationList(currentPageNo, pageSize);
        return reservationList;
    }
}
