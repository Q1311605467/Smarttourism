package service;

import pojo.*;

import java.util.List;

public interface UserService {
    public User login(String user_account, String user_password);

    public int reg(String user_account, String user_password, String gender);

//    public User getUserByID(int user_id);

    public User getUserByAccount(String user_account);

    public int updateUser(User user);

    public int destoryUser(int user_id);

    public int AddHR(Hotel_reservation reserve);

    public int AddSR(Scenery_Reservation reserve);

    public int addStrategy(Strategy strategy);

    public List<Strategy> queryAllStrategy();

    public List<Strategy> queryOnesStrategy(int user_id);

    public List<Strategy> getOnesRealease0Strategy(int user_id);

    public List<Strategy> getOnesRealease2Strategy(int user_id);

    public Strategy getStrategyBSid(int strategy_id);

    public List<Scenery> getTop3Scenery();

    public List<Strategy> getTop5Strategy();

    public Scenery getSceneryBID(int scenery_id);

    public List<Strategy> getStrategyBDiDianTop5(String recommend);

    public List<Strategy> getStrategyBDiDian(String recommend);

    public List<Scenery> getSceneryByAreaID(int area_id);

    public List<Scenery> getSceneryByAreaIDTop3(int area_id);

    public int getIDBArea_name(String area_name);

    public Area getAreaBArea_id(int area_id);

    public List<Guide> allGuideBScenery_id(int scenery_id);

    public List<Hotel> getHotelAreaTop3(int area_id);

    public List<Hotel> getHotelBArea_id(int area_id);

    public List<Hotel> searchHotel(String sn);

    public List<Rest> getRestAreaTop3(int area_id);

    public List<Rest> getRestBArea_id(int area_id);

    public int deleteStrategyBID(int strategy_id);

    public int updateStrategyBID(Strategy strategy);



    /**********************************************************/
    //后台
    public List<User> getUserList(int currentPageNo, int pageSize);

    public List<User> getUserListByName(String user_account);

    public boolean delUser(String user_id);

    public int getCount();

    public int LogoutUser(String user_id);

    public int Activating(String user_id);


}
