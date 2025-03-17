package com.AlbumArchive.VO;

public class AlbumVO {
    private String name;      // 앨범명
    private int artist_num;   // 아티스트 번호
    private String info;      // 앨범 설명
    private String img;       // 앨범 이미지 경로
    private int price;        // 가격
    private int likes;         // 좋아요 수
    private int total_qty;    // 총 수량
    private String category;  // 카테고리
    private String dates;      // 등록일

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getArtist_num() {
        return artist_num;
    }

    public void setArtist_num(int artist_num) {
        this.artist_num = artist_num;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getTotal_qty() {
        return total_qty;
    }

    public void setTotal_qty(int total_qty) {
        this.total_qty = total_qty;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDates() {
        return dates;
    }

    public void setDates(String dates) {
        this.dates = dates;
    }
}
