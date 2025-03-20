package com.AlbumArchive.VO;

public class AlbumVO {

	private String id; // 앨범명
	private String name; // 앨범명
	private int artistId; // 아티스트 번호
	private String info; // 앨범 설명
	private String img; // 앨범 이미지 경로
	private int price; // 가격
	private int likes; // 좋아요 수
	private int total_qty; // 총 수량
	private String category; // 카테고리
	private String dates; // 등록일


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	// Getters and Setters
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getArtistId() {
		return artistId;
	}

	public void setArtistId(int artistId) {
		this.artistId = artistId;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}
}
