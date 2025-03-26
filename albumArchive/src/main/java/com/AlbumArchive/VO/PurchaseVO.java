package com.AlbumArchive.VO;

public class PurchaseVO {

    private int num;              // 구매 번호
    private String album_name;    // 앨범 이름
    private String user_id;       // 사용자 아이디
    private int total_price;      // 총 가격
    private String dday;          // 구매 일자
    private int total_qty;        // 총 수량
    private String img;           // 앨범 이미지

    // 기본 생성자
    public PurchaseVO() {}

    // 모든 필드를 받는 생성자
    public PurchaseVO(int num, String album_name, String user_id, int total_price, String dday, int total_qty, String img) {
        this.num = num;
        this.album_name = album_name;
        this.user_id = user_id;
        this.total_price = total_price;
        this.dday = dday;
        this.total_qty = total_qty;
        this.img = img;
    }

    // Getter & Setter
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getAlbum_name() {
        return album_name;
    }

    public void setAlbum_name(String album_name) {
        this.album_name = album_name;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    public String getDday() {
        return dday;
    }

    public void setDday(String dday) {
        this.dday = dday;
    }

    public int getTotal_qty() {
        return total_qty;
    }

    public void setTotal_qty(int total_qty) {
        this.total_qty = total_qty;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "PurchaseVO [num=" + num + ", album_name=" + album_name + ", user_id=" + user_id + ", total_price=" + total_price + ", dday=" + dday + ", total_qty=" + total_qty + ", img=" + img + "]";
    }
}
