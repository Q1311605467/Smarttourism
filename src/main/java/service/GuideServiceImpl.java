package service;

import dao.GuideMapper;
import org.springframework.stereotype.Service;
import pojo.Guide;
import pojo.User;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GuideServiceImpl implements GuideService{

    @Resource
    private GuideMapper guideMapper;

    @Override
    public List<Guide> getGuideList(int currentPageNo, int pageSize) {
        List<Guide>guideList = null;
        currentPageNo = (currentPageNo-1)*pageSize;
        guideList = guideMapper.getGuideList(currentPageNo,pageSize);
        return  guideList;
    }
    @Override
    public List<Guide> getGuideListByName(String guide_name) {
        List<Guide>guideList = null;
        guideList = guideMapper.getGuideListByName(guide_name);
        return guideList;
    }

    @Override
    public int insertGuide(Guide guide) {
        int flag = guideMapper.insert(guide);
        return flag;
    }

    @Override
    public int getCount() {
        int count = guideMapper.getCount();
        return count;
    }

    @Override
    public Guide guideDetail(int guide_id) {
        Guide guide = null;
        guide = guideMapper.selectByPrimaryKey(guide_id);
        return guide;
    }

    @Override
    public int updateByPrimaryKeySelective(Guide guide) {
        int flag = guideMapper.updateByPrimaryKeySelective(guide);
        return flag;
    }

    @Override
    public int guideDel(int guide_id) {
        int flag = guideMapper.deleteByPrimaryKey(guide_id);
        return flag;
    }

    @Override
    public int htaddGuide(Guide guide) {

        int res = guideMapper.htselectByName(guide.getGuide_name());

        if(res==1){
            System.out.println("数据库里已经添加过该导游");
        }else {
            res = guideMapper.htaddGuide(guide);
        }

        return res;
    }

}
