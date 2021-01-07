package pojo;

import java.util.List;


public  class Hits {
    /**
     * datasetName : 百度默认黑词库
     * words : ["习近平"]
     */
    private double probability;
    private String datasetName;
    private List<String> words;

    public double getProbability() {
        return probability;
    }

    public void setProbability(double probability) {
        this.probability = probability;
    }

    public String getDatasetName() {
        return datasetName;
    }

    public void setDatasetName(String datasetName) {
        this.datasetName = datasetName;
    }

    public List<String> getWords() {
        return words;
    }

    public void setWords(List<String> words) {
        this.words = words;
    }
}