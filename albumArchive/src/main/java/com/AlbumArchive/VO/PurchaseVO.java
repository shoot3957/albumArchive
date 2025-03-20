package com.AlbumArchive.VO;

public class PurchaseVO {

    private int num;        // 구매 번호
    private String album_id; // 앨범 ID
    private String user_id;  // 회원 ID
    private int total_price; // 총 가격
    private String dday;     // 배송일
    private int total_qty;   // 총 구매 수량

    // 기본 생성자
    public PurchaseVO() {}

    // Getter & Setter
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(String album_id) {
        this.album_id = album_id;
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

    @Override
    public String toString() {
        return "PurchaseVO [num=" + num + ", album_id=" + album_id + ", user_id=" + user_id + ", total_price=" + total_price + ", dday=" + dday + ", total_qty=" + total_qty + "]";
    }
}
