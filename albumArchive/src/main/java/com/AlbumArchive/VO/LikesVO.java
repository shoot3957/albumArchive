package com.AlbumArchive.VO;

public class LikesVO {

    private int num;       // 좋아요 번호
    private String album_id; // 앨범 ID
    private String name;   // 회원 ID

    // 기본 생성자
    public LikesVO() {}

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "LikesVO [num=" + num + ", album_id=" + album_id + ", name=" + name + "]";
    }
}
