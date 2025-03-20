package com.AlbumArchive.VO;

public class SongVO {

    private String id;       // 노래 ID
    private String album_id; // 앨범 ID

    // 기본 생성자
    public SongVO() {}

    // Getter & Setter
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(String album_id) {
        this.album_id = album_id;
    }

    @Override
    public String toString() {
        return "SongVO [id=" + id + ", album_id=" + album_id + "]";
    }
}
