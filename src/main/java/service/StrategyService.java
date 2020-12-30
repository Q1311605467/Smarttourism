package service;

import org.springframework.stereotype.Service;
import pojo.Rest;
import pojo.Strategy;

import java.util.List;

@Service
public interface StrategyService {
    public List<Strategy> getUnreviewedList(int currentPageNo, int pageSize);
    public List<Strategy>getReviewedList(int currentPageNo, int pageSize);
    public List<Strategy>getUnPassedList(int currentPageNo, int pageSize);
    public  int getCount();
    public  int getUncheckedCount();
    public  int getUnPassedCount();
    public  int passStrategy(int strategy_id);
    public  int unPassStrategy(int strategy_id);
    public  Strategy strategyDetail(int strategy_id);
}
