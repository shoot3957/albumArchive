package com.AlbumArchive.VO;

public class SearchVO {

    private int num;          // 검색 번호
    private String category;  // 카테고리
    private int artist_num;   // 아티스트 번호
    private String album_name; // 앨범 이름

    // 기본 생성자
    public SearchVO() {}

    // Getter & Setter
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getArtist_num() {
        return artist_num;
    }

    public void setArtist_num(int artist_num) {
        this.artist_num = artist_num;
    }

    public String getAlbum_name() {
        return album_name;
    }

    public void setAlbum_name(String album_name) {
        this.album_name = album_name;
    }

    @Override
    public String toString() {
        return "SearchVO [num=" + num + ", category=" + category + ", artist_num=" + artist_num + ", album_name=" + album_name + "]";
    }
}
