package dao;

import pojo.Statistic;

import java.util.List;
import java.util.Map;

public interface StatisticMapper {
    /**
     * 统计地区浏览量图表
     */
    List<Map> countAreaNum();
    /**
     * 统计旅游景区浏览量图表
     */
    List<Map>countSceneryNum();

}
