package com.clown.Modules;

import javafx.beans.property.SimpleStringProperty;

public class Book {

    //图书信息
    protected SimpleStringProperty Bid;
    protected SimpleStringProperty BName;
    protected SimpleStringProperty BAuthor;
    protected SimpleStringProperty BType;
    protected SimpleStringProperty BStatus;
    protected SimpleStringProperty BImageUrl;

    public String getBImageUrl() {
        return BImageUrl.get();
    }

    public SimpleStringProperty BImageUrlProperty() {
        return BImageUrl;
    }

    public void setBImageUrl(String BImageUrl) {
        this.BImageUrl.set(BImageUrl);
    }

    @Override
    public String toString() {
        return "Book{" +
                "Bid=" + Bid.get() +
                ", BName=" + BName.get() +
                ", BAuthor=" + BAuthor.get() +
                ", BType=" + BType.get() +
                ", BStatus=" + BStatus.get() +

                ", BImageUrl=" + BImageUrl.get() +
                ", BIntro=" + BIntro.get() +
                '}';
    }

    protected SimpleStringProperty BIntro;

    public String getBid() {
        return Bid.get();
    }

    public SimpleStringProperty bidProperty() {
        return Bid;
    }

    public void setBid(String bid) {
        this.Bid.set(bid);
    }

    public String getBName() {
        return BName.get();
    }

    public SimpleStringProperty BNameProperty() {
        return BName;
    }

    public void setBName(String BName) {
        this.BName.set(BName);
    }

    public String getBAuthor() {
        return BAuthor.get();
    }

    public SimpleStringProperty BAuthorProperty() {
        return BAuthor;
    }

    public void setBAuthor(String BAuthor) {
        this.BAuthor.set(BAuthor);
    }

    public String getBType() {
        return BType.get();
    }

    public SimpleStringProperty BTypeProperty() {
        return BType;
    }

    public void setBType(String BType) {
        this.BType.set(BType);
    }

    public String getBStatus() {
        return BStatus.get();
    }

    public SimpleStringProperty BStatusProperty() {
        return BStatus;
    }

    public void setBStatus(String BStatus) {
        this.BStatus.set(BStatus);
    }

    public String getBIntro() {
        return BIntro.get();
    }

    public SimpleStringProperty BIntroProperty() {
        return BIntro;
    }

    public void setBIntro(String BIntro) {
        this.BIntro.set(BIntro);
    }

    public Book(String bid, String BName, String BAuthor, String BType, String BStatus, String BIntro, String BImageUrl) {
        this.Bid = new SimpleStringProperty(bid);
        this.BName = new SimpleStringProperty(BName);
        this.BAuthor = new SimpleStringProperty(BAuthor);
        this.BType = new SimpleStringProperty(BType);
        this.BStatus = new SimpleStringProperty(BStatus);
        this.BIntro = new SimpleStringProperty(BIntro);
        this.BImageUrl = new SimpleStringProperty(BImageUrl);
    }

}
