package com.AlbumArchive.VO;

public class CartVO {

    private int num;        // 장바구니 번호
    private String album_num; // 앨범 ID
    private String user_id;  // 회원 ID
    private int price;      // 가격
    private int qty;        // 수량

    // 기본 생성자
    public CartVO() {}

    // Getter & Setter
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getAlbum_num() {
        return album_num;
    }

    public void setAlbum_num(String album_num) {
        this.album_num = album_num;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
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

    @Override
    public String toString() {
        return "CartVO [num=" + num + ", album_num=" + album_num+ ", user_id=" + user_id + ", price=" + price + ", qty=" + qty + "]";
    }
}
