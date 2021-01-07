package pojo;


import java.util.List;

public class CheckTextResult {


    /**
     * conclusion : 不合规
     * log_id : 16100013325026571
     * data : [{"msg":"存在百度官方默认违禁词库不合规","conclusion":"不合规","hits":[{"datasetName":"百度默认黑词库","words":["sb习近平"]}],"subType":0,"conclusionType":2,"type":11},{"msg":"存在暴恐违禁不合规","conclusion":"不合规","hits":[{"probability":1,"datasetName":"百度默认文本反作弊库","words":["有毒品卖"]}],"subType":1,"conclusionType":2,"type":12},{"msg":"存在政治敏感不合规","conclusion":"不合规","hits":[{"probability":1,"datasetName":"百度默认文本反作弊库","words":["习近平"]}],"subType":3,"conclusionType":2,"type":12}]
     * conclusionType : 2
     */

    private String conclusion;
    private long log_id;
    private int conclusionType;
    private List<Data> data;

    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion;
    }

    public long getLog_id() {
        return log_id;
    }

    public void setLog_id(long log_id) {
        this.log_id = log_id;
    }

    public int getConclusionType() {
        return conclusionType;
    }

    public void setConclusionType(int conclusionType) {
        this.conclusionType = conclusionType;
    }

    public List<Data> getData() {
        return data;
    }

    public void setData(List<Data> data) {
        this.data = data;
    }
}
