package pojo;


import java.util.List;

public  class Data {
    /**
     * msg : 存在百度官方默认违禁词库不合规
     * conclusion : 不合规
     * hits : [{"datasetName":"百度默认黑词库","words":["sb习近平"]}]
     * subType : 0
     * conclusionType : 2
     * type : 11
     */

    private String msg;
    private String conclusion;
    private int subType;
    private int conclusionType;
    private int type;
    private List<Hits> hits;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion;
    }

    public int getSubType() {
        return subType;
    }

    public void setSubType(int subType) {
        this.subType = subType;
    }

    public int getConclusionType() {
        return conclusionType;
    }

    public void setConclusionType(int conclusionType) {
        this.conclusionType = conclusionType;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public List<Hits> getHits() {
        return hits;
    }

    public void setHits(List<Hits> hits) {
        this.hits = hits;
    }
}