package service;

import dao.Hotel_roomMapper;
import org.springframework.stereotype.Service;
import pojo.Hotel_room;

import javax.annotation.Resource;
import java.util.List;
@Service
public class Hotel_roomServiceImpl implements Hotel_roomService {
    @Resource
    private Hotel_roomMapper hotel_roomMapper;
    @Override
    public List<Hotel_room> getHotelRoomList(int hotel_id) {
        return hotel_roomMapper.getHotelRoomList(hotel_id);
    }

    @Override
    public int insertRoom(Hotel_room hotel_room) {
        int flag = 0;
        flag = hotel_roomMapper.insert(hotel_room);
        return flag;
    }

    @Override
    public boolean deleteByPrimaryKey(Integer room_id) {
        int flag = hotel_roomMapper.deleteByPrimaryKey(room_id);
        if(flag>0){
            return true;
        }else{
            return false;
        }

    }

    @Override
    public Hotel_room selectByPrimaryKey(Integer room_id) {
        return hotel_roomMapper.selectByPrimaryKey(room_id);
    }

    @Override
    public int updateByPrimaryKey(Hotel_room record) {
        return hotel_roomMapper.updateByPrimaryKey(record);
    }
}
