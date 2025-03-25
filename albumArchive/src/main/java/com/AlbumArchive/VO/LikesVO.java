package com.AlbumArchive.VO;

public class LikesVO {
    private int num;       // 좋아요 번호
    private int albumNum;  // 앨범 번호
    private String name;   // 회원 ID

    public LikesVO() {}

    public LikesVO(int albumNum, String name) {
        this.albumNum = albumNum;
        this.name = name;
    }

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "LikesVO [num=" + num + ", albumNum=" + albumNum + ", name=" + name + "]";
    }
}