package service;

import org.springframework.stereotype.Service;
import pojo.Hotel_room;

import java.util.List;
@Service
public interface Hotel_roomService {
    public List<Hotel_room> getHotelRoomList(int hotel_id);
    public int insertRoom(Hotel_room hotel_room);
    public boolean deleteByPrimaryKey(Integer room_id);
    public Hotel_room selectByPrimaryKey(Integer room_id);
    public int updateByPrimaryKey(Hotel_room record);
}
