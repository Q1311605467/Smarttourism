package service;

import dao.SCommentMapper;
import org.springframework.stereotype.Service;
import pojo.Strategy_comment;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Strategy_commentServiceImpl implements Strategy_commentService {

    @Resource
    private SCommentMapper SCMapper;


    @Override
    public int addStrategy_comment(Strategy_comment strategy_comment) {
        int res = SCMapper.addStrategy_comment(strategy_comment);
        return res;
    }

    @Override
    public List<Strategy_comment> getS_COne(int strategy_id) {
        return SCMapper.getS_COne(strategy_id);
    }

    @Override
    public List<Strategy_comment> getS_CTwo(Strategy_comment strategy_comment) {
        return SCMapper.getS_CTwo(strategy_comment);
    }

    @Override
    public int update(int comment_id) {
        int res = SCMapper.updateSC(comment_id);
        return res;
    }
}
