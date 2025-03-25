package com.AlbumArchive.VO;

public class SongVO {
    private String id;
    private int albumNum;
    private String name;

    public SongVO() {}

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public int getAlbumNum() { return albumNum; }
    public void setAlbumNum(int albumNum) { this.albumNum = albumNum; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    @Override
    public String toString() {
        return "SongVO [id=" + id + ", albumNum=" + albumNum + ", name=" + name + "]";
    }
}