package service;

import pojo.Statistic;

import java.util.List;
import java.util.Map;

public interface StatisticService {
    List<Map> countAreaNum();
    List<Map> countSceneryNum();
}
