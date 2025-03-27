package com.AlbumArchive.VO;

public class AlbumVO {
    private int num;
    private String name;
    private int artistNum;
    private String info;
    private int price;
    private int likes;
    private int totalQty;
    private String category;
    private String dates;
    private String img;
    private String mood;

    public AlbumVO() {}

    public int getNum() { return num; }
    public void setNum(int num) { this.num = num; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getArtistNum() { return artistNum; }
    public void setArtistNum(int artistNum) { this.artistNum = artistNum; }
    public String getInfo() { return info; }
    public void setInfo(String info) { this.info = info; }
    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }
    public int getLikes() { return likes; }
    public void setLikes(int likes) { this.likes = likes; }
    public int getTotalQty() { return totalQty; }
    public void setTotalQty(int totalQty) { this.totalQty = totalQty; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getDates() { return dates; }
    public void setDates(String dates) { this.dates = dates; }
    public String getImg() { return img; }
    public void setImg(String img) { this.img = img; }
    public String getMood() { return mood; }
    public void setMood(String mood) { this.mood = mood; }

    @Override
    public String toString() {
        return "AlbumVO [num=" + num + ", name=" + name + ", artistNum=" + artistNum + "]";
    }
}