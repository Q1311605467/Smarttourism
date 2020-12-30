package service;

import dao.HotelMapper;
import org.springframework.stereotype.Service;
import pojo.Hotel;


import javax.annotation.Resource;
import java.util.List;

@Service
public class HotelServiceImpl implements  HotelService {
    @Resource
    private HotelMapper hotelMapper;

    @Override
    public List<Hotel> getHotelList(int currentPageNo, int pageSize) {
        List<Hotel>hotelsList = null;
        currentPageNo = (currentPageNo-1)*pageSize;
        hotelsList =hotelMapper.getHotelList(currentPageNo,pageSize);
        return  hotelsList;
    }

    @Override
    public List<Hotel> getHotelListByName(String hotel_name) {
        List<Hotel>hotelList = null;
        hotelList = hotelMapper.getHotelListByName(hotel_name);
        return hotelList;
    }

    @Override
    public int insertHotel(Hotel hotel) {
        int flag = hotelMapper.insert(hotel);
        return flag;
    }

    @Override
    public int getCount() {
        int count = 0;
        count = hotelMapper.getCount();
        return count;
    }

    @Override
    public Hotel hotelDetail(int hotel_id) {
        Hotel hotel = null;
        hotel = hotelMapper.selectByPrimaryKey(hotel_id);
        return hotel;
    }

    @Override
    public int updateByPrimaryKeySelective(Hotel hotel) {
        int flag = hotelMapper.updateByPrimaryKeySelective(hotel);
        return flag;
    }

    @Override
    public int hotelDel(int hotel_id) {
        int flag = hotelMapper.deleteByPrimaryKey(hotel_id);
        return flag;
    }

    @Override
    public int htaddHotel(Hotel hotel) {

        int a = hotelMapper.htselectByName(hotel.getHotel_name());
        int res = 0;
        if(a==0){
            res = hotelMapper.htaddHotel(hotel);
        }else {
            System.out.println("数据库已有该数据");
        }


        return res;
    }
}
