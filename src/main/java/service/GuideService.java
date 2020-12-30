package service;

import org.springframework.stereotype.Service;
import pojo.Guide;
import pojo.User;

import java.util.List;

@Service
public interface GuideService {
    public List<Guide> getGuideList(int currentPageNo, int pageSize);
    public List<Guide>getGuideListByName(String guide_name);
    public int insertGuide(Guide guide);
    public  int getCount();
    public  Guide guideDetail(int guide_id);
    public  int updateByPrimaryKeySelective(Guide guide);
    public  int guideDel(int guide_id);

    public int htaddGuide(Guide guide);
}
