package service;

import dao.*;
import org.springframework.stereotype.Service;
import pojo.*;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Resource
    private StrategyMapper strategyMapper;
    @Resource
    private SceneryMapper sceneryMapper;
    @Resource
    private AreaMapper areaMapper;
    @Resource
    private GuideMapper guideMapper;
    @Resource
    private HotelMapper hotelMapper;
    @Resource
    private RestMapper restMapper;

    @Override
    public User login(String user_account, String user_password) {
        // TODO Auto-generated method stub
        User user = null;
        user = userMapper.getUser(user_account, user_password);
        return user;
    }

    @Override
    public int reg(String user_account, String user_password, String gender) {
        // TODO Auto-generated method stub
        int k = userMapper.addUser(user_account, user_password, gender);
        return k;
    }

    /*
        @Override
        public User getUserByID(int user_id) {
            // TODO Auto-generated method stub
            User user = userMapper.getUserByID(user_id);
            return user;
        }
    */

    @Override
    public User getUserByAccount(String user_account) {
        User user = userMapper.getUserByAccount(user_account);
        return user;
    }


    @Override
    public int updateUser(User user) {
        // TODO Auto-generated method stub
        int f;
        if (user.getHead() != null) {
            f = userMapper.updateUser(user.getUser_id(), user.getUser_account(), user.getUser_password(), user.getGender(), user.getHead(), user.getIntro());
        } else {
            f = userMapper.updateUserNoHead(user.getUser_id(), user.getUser_account(), user.getUser_password(), user.getGender(), user.getIntro());
        }
        return f;
    }

    @Override
    public int destoryUser(int user_id) {
        int k = userMapper.destoryUser(user_id);
        return k;
    }

    @Override
    public int addStrategy(Strategy strategy) {
        int k = strategyMapper.addStrategy(strategy);
        return k;
    }

    @Override
    public List<Strategy> queryAllStrategy() {
        return strategyMapper.queryAllStrategy();
    }

    @Override
    public List<Strategy> queryOnesStrategy(int user_id) {
        return strategyMapper.queryOnesStrategy(user_id);
    }

    @Override
    public List<Strategy> getOnesRealease0Strategy(int user_id) {
        return strategyMapper.getOnesRealease0Strategy(user_id);
    }

    @Override
    public List<Strategy> getOnesRealease2Strategy(int user_id) {
        return strategyMapper.getOnesRealease2Strategy(user_id);
    }

    @Override
    public Strategy getStrategyBSid(int strategy_id) {
        Strategy strategy = strategyMapper.getStrategyBid(strategy_id);
        strategyMapper.addClickNum(strategy_id);
        return strategy;
    }

    @Override
    public List<Scenery> getTop3Scenery() {
        return sceneryMapper.getTop3Scenery();
    }

    @Override
    public List<Strategy> getTop5Strategy() {
        return strategyMapper.getTop5Strategy();
    }

    @Override
    public Scenery getSceneryBID(int scenery_id) {
        sceneryMapper.addBrowse_num(scenery_id);
        return sceneryMapper.getSceneryBID(scenery_id);
    }

    @Override
    public List<Strategy> getStrategyBDiDianTop5(String recommend) {
        return strategyMapper.getStrategyBDiDianTop5(recommend);
    }

    @Override
    public List<Scenery> getSceneryByAreaID(int area_id) {
        return sceneryMapper.getSceneryByAreaID(area_id);
    }

    @Override
    public List<Scenery> getSceneryByAreaIDTop3(int area_id) {
        return sceneryMapper.getSceneryByAreaIDTop3(area_id);
    }

    @Override
    public int getIDBArea_name(String area_name) {
        Integer k;
        if (null == areaMapper.getIDBArea_name(area_name))
            k = 1;
        else k = areaMapper.getIDBArea_name(area_name);
        return k;
    }

    @Override
    public Area getAreaBArea_id(int area_id) {
        return areaMapper.getAreaBArea_id(area_id);
    }

    @Override
    public List<Guide> allGuideBScenery_id(int scenery_id) {
        return guideMapper.allGuideBScenery_id(scenery_id);
    }

    @Override
    public List<Strategy> getStrategyBDiDian(String recommend) {
        return strategyMapper.getStrategyBDiDian(recommend);
    }

    @Override
    public List<Hotel> getHotelAreaTop3(int area_id) {
        return hotelMapper.getHotelAreaTop3(area_id);
    }

    @Override
    public List<Hotel> getHotelBArea_id(int area_id) {
        return hotelMapper.getHotelBArea_id(area_id);
    }

    @Override
    public List<Hotel> searchHotel(String sn) {
        List<Hotel> hotels = hotelMapper.searchHotel(sn);
        if (hotels != null)
            return hotels;
        else return null;
    }

    @Override
    public List<Rest> getRestAreaTop3(int area_id) {
        return restMapper.getRestAreaTop3(area_id);
    }

    @Override
    public List<Rest> getRestBArea_id(int area_id) {
        return restMapper.getRestBArea_id(area_id);
    }

    @Override
    public int deleteStrategyBID(int strategy_id) {
        return strategyMapper.deleteStrategyBID(strategy_id);
    }

    @Override
    public int updateStrategyBID(Strategy strategy) {
        if (strategy.getStrategy_cover() != null)
            return strategyMapper.updateStrategyBID(strategy);
        else
            return strategyMapper.updateStrategyBIDNocover(strategy);
    }

    /**********************************************************************************************************/
    //后台
    @Override
    public List<User> getUserList(int currentPageNo, int pageSize) {
        List<User> userList = null;
        currentPageNo = (currentPageNo - 1) * pageSize;
        userList = userMapper.getUserList(currentPageNo, pageSize);
        return userList;
    }

    @Override
    public List<User> getUserListByName(String user_account) {
        List<User> userList = null;
        userList = userMapper.getUserListByName(user_account);
        return userList;

    }

    @Override
    public boolean delUser(String user_id) {
        return false;
    }

    @Override
    public int getCount() {
        int count = userMapper.getCount();
        return count;
    }

    @Override
    public int LogoutUser(String user_id) {
        Integer userid = Integer.parseInt(user_id);
        User user = userMapper.selectByPrimaryKey(userid);
        Integer isActive = user.getIsActive() ^ 1;
        user.setIsActive(isActive);
        int flag = userMapper.updateByPrimaryKey(user);
        return flag;
    }

    @Override
    public int Activating(String user_id) {
        Integer userid = Integer.parseInt(user_id);
        User user = userMapper.selectByPrimaryKey(userid);
        Integer isActive = user.getIsActive() ^ 1;
        user.setIsActive(isActive);
        int flag = userMapper.updateByPrimaryKey(user);
        return flag;
    }

}
