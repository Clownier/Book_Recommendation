package com.clown.Modules;


import javafx.beans.property.SimpleStringProperty;

public class RecommendBook extends Book{

    protected SimpleStringProperty BRecScore;
    //图书推荐表格模板
    public RecommendBook(String bid, String BName, String BAuthor, String BType, String BStatus, String BIntro, String BImageUrl) {
        super(bid, BName, BAuthor, BType, BStatus, BIntro, BImageUrl);
    }


    @Override
    public String toString() {
        return "RecommendBook{" +
                "Bid=" + Bid +
                ", BName=" + BName +
                '}';
    }
}
