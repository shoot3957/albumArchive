package com.AlbumArchive.VO;

import java.util.UUID;

public class ArtistVO {

    private UUID id;       // 아티스트 ID (UUID)
    private String name;   // 아티스트 이름

    // 기본 생성자
    public ArtistVO() {}

    // Getter & Setter
    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "ArtistVO [id=" + id + ", name=" + name + "]";
    }
}
