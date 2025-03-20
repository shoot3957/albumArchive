package com.AlbumArchive.VO;

import java.util.UUID;

public class AlbumVO {
    
    private UUID album_id;  // UUID 타입으로 앨범 ID
    private String name;    // 앨범 이름
    private UUID artist_id; // 아티스트 ID (UUID)
    private String info;    // 앨범 정보
    private int price;      // 가격
    private int likes;      // 좋아요 수
    private int total_qty;  // 총 재고 수량

    // 기본 생성자
    public AlbumVO() {}

    // Getters and Setters
    public UUID getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(UUID album_id) {
        this.album_id = album_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public UUID getArtist_id() {
        return artist_id;
    }

    public void setArtist_id(UUID artist_id) {
        this.artist_id = artist_id;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
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

    @Override
    public String toString() {
        return "AlbumVO [album_id=" + album_id + ", name=" + name + ", artist_id=" + artist_id + ", info=" + info
                + ", price=" + price + ", likes=" + likes + ", total_qty=" + total_qty + "]";
    }
}
