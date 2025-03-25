package com.AlbumArchive.VO;

import java.util.UUID;

public class ArtistVO {

    private int num;       // 아티스트 ID (UUID)
    private String name;   // 아티스트 이름
    private String img;

    // 기본 생성자
    public ArtistVO() {}

    // Getter & Setter
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "ArtistVO [num=" + num + ", name=" + name + "]";
    }
}
