package com.AlbumArchive.VO;

public class SongVO {
    private String id;      // 노래 ID (UUID)
    private int albumNum;   // 앨범 번호
    private String name;    // 노래 이름

    public SongVO() {}

    public SongVO(String id, int albumNum, String name) {
        this.id = id;
        this.albumNum = albumNum;
        this.name = name;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public int getAlbumNum() { return albumNum; }
    public void setAlbumNum(int albumNum) { this.albumNum = albumNum; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}