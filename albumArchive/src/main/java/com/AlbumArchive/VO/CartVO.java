package com.AlbumArchive.VO;

public class CartVO {

    private int num;        // 장바구니 번호
    private int albumNum; // 앨범 ID
    private String userId;  // 회원 ID
    private int price;      // 가격
    private int qty;        // 수량
    private String name;    // 앨범 이름 추가

    // 기본 생성자
    public CartVO() {}

    public CartVO(int num, int qty) {
        this.num = num;
        this.qty = qty;
    }

    // Getter & Setter
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getAlbumNum() {
        return albumNum;
    }

    public void setAlbumNum(int albumNum) {
        this.albumNum = albumNum;
    }

    public String getUserId() {
        return userId;
    }

    public void setUser_id(String userId) {
        this.userId = userId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CartVO [num=" + num + ", albumNum=" + albumNum + ", userId=" + userId + ", price=" + price + ", qty=" + qty + ", name=" + name + "]";
    }
}
