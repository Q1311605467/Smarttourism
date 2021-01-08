package service;

import dao.StatisticMapper;
import org.springframework.stereotype.Service;
import pojo.Statistic;

import javax.annotation.Resource;
import javax.jnlp.ServiceManager;
import java.util.List;
import java.util.Map;

@Service
public class StatisticServiceImpl implements StatisticService {

    @Resource
    private StatisticMapper statisticMapper;
    @Override
    public List<Map> countAreaNum() {
        return statisticMapper.countAreaNum();
    }

    @Override
    public List<Map> countSceneryNum() {
        return statisticMapper.countSceneryNum();
    }
}
