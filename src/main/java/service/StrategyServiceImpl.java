package service;

import dao.StrategyMapper;
import org.springframework.stereotype.Service;
import pojo.Rest;
import pojo.Strategy;

import javax.annotation.Resource;
import java.util.List;

import static tools.Constants.pageSize;

@Service
public class StrategyServiceImpl implements StrategyService {
    @Resource
    private StrategyMapper strategyMapper;

    @Override
    public List<Strategy> getUnreviewedList(int currentPageNo, int pageSize) {
        List<Strategy>strategyList = null;
        currentPageNo = (currentPageNo-1)*pageSize;
        strategyList =strategyMapper.getUnreviewedList(currentPageNo,pageSize);
        return  strategyList;

    }

    @Override
    public List<Strategy> getReviewedList(int currentPageNo, int pageSize) {
        List<Strategy>strategyList = null;
        currentPageNo = (currentPageNo-1)*pageSize;
        strategyList =strategyMapper.getReviewedList(currentPageNo,pageSize);
        return  strategyList;
    }

    @Override
    public List<Strategy> getUnPassedList(int currentPageNo, int pageSize) {
        List<Strategy>strategyList = null;
        currentPageNo = (currentPageNo-1)*pageSize;
        strategyList =strategyMapper.getUnPassedList(currentPageNo,pageSize);
        return  strategyList;
    }

    @Override
    public int getCount() {
      int count = strategyMapper.getCount();
      return count;

    }

    @Override
    public int getUncheckedCount() {
       int count = strategyMapper.getUncheckedCount();
       return count;
    }

    @Override
    public int getUnPassedCount() {
        int count = strategyMapper.getUnPassedCount();
        return count;
    }

    @Override
    public int passStrategy(int strategy_id) {
        Strategy strategy = null;
        strategy = strategyMapper.selectByPrimaryKey(strategy_id);
        strategy.setIsRelease(strategy.getIsRelease()^1);
        int flag = 0;
        if(strategyMapper.updateByPrimaryKey(strategy)>0){
            flag = 1;
        }
        return flag;
    }

    @Override
    public int unPassStrategy(int strategy_id) {
        Strategy strategy = null;
        strategy = strategyMapper.selectByPrimaryKey(strategy_id);
        strategy.setIsRelease(strategy.getIsRelease()+2);
        int flag = 0;
        if(strategyMapper.updateByPrimaryKey(strategy)>0){
            flag = 1;
        }
        return flag;
    }

    @Override
    public Strategy strategyDetail(int strategy_id) {
        Strategy strategy = null;
        strategy = strategyMapper.selectByPrimaryKey(strategy_id);
        return strategy;
    }
}
