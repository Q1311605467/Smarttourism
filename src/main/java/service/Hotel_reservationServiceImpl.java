package service;

import dao.Hotel_reservationMapper;
import org.springframework.stereotype.Service;
import pojo.Hotel_reservation;

import javax.annotation.Resource;
import java.util.List;

import static tools.Constants.pageSize;

@Service
public class Hotel_reservationServiceImpl implements Hotel_reservationService{
    @Resource
    private Hotel_reservationMapper hotel_reservationMapper;

    @Override
    public List<Hotel_reservation> getHotle_ReserveList(int currentPageNo, int pageSize) {
        List<Hotel_reservation> HRList=null;
        currentPageNo = (currentPageNo-1)*pageSize;
        HRList = hotel_reservationMapper.getHotle_ReserveList(currentPageNo,pageSize);
        return HRList;
    }

    @Override
    public List<Hotel_reservation> getMyHotle_Reserve( int user_id) {
        List<Hotel_reservation> HRList=null;
        HRList = hotel_reservationMapper.getMyHotle_Reserve(user_id);
        return HRList;
    }

    @Override
    public int getMyHotle_ReserveCount(int user_id) {
        int count = hotel_reservationMapper.getMyHotle_ReserveCount(user_id);
        return count;
    }

    @Override
    public int getHotle_ReserveCount() {
        int count = hotel_reservationMapper.getHotle_ReserveCount();
        return count;
    }

    @Override
    public int cancelReserve(int reserv_id) {
       int count=hotel_reservationMapper.cancelReserve(reserv_id);
       return count;
    }
}
