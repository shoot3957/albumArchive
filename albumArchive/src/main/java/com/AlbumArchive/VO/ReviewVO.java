package com.AlbumArchive.VO;

public class ReviewVO {

    private int num;         // 리뷰 번호
    private String info;     // 리뷰 내용
    private String user_id;  // 회원 ID
    private String album_id; // 앨범 ID
    private String title;    // 리뷰 제목

    // 기본 생성자
    public ReviewVO() {}

    // Getter & Setter
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(String album_id) {
        this.album_id = album_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "ReviewVO [num=" + num + ", info=" + info + ", user_id=" + user_id + ", album_id=" + album_id + ", title=" + title + "]";
    }
}
