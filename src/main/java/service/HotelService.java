package service;

import org.springframework.stereotype.Service;
import pojo.Hotel;
import pojo.Rest;

import java.util.List;

@Service
public interface HotelService {
    public List<Hotel> getHotelList(int currentPageNo, int pageSize);
    public List<Hotel>getHotelListByName(String hotel_name);
    public int insertHotel(Hotel hotel);
    public  int getCount();
    public  Hotel hotelDetail(int hotel_id);
    public  int updateByPrimaryKeySelective(Hotel hotel);
    public  int hotelDel(int hotel_id);

    public int htaddHotel(Hotel hotel);
}
