package com.AlbumArchive.VO;

public class AlbumVO {
	private int num; // 앨범 번호 (AUTO_INCREMENT)
	private String name; // 앨범명
	private int artistNum; // 아티스트 번호
	private String info; // 앨범 설명
	private String img; // 앨범 이미지 경로
	private int price; // 가격
	private int likes; // 좋아요 수
	private int totalQty; // 총 수량
	private String category; // 카테고리
	private String dates; // 등록일

	public AlbumVO() {
	}

	public AlbumVO(int num, String name, int artistNum, String info, String img, int price, int likes, int totalQty,
			String category, String dates) {
		this.num = num;
		this.name = name;
		this.artistNum = artistNum;
		this.info = info;
		this.img = img;
		this.price = price;
		this.likes = likes;
		this.totalQty = totalQty;
		this.category = category;
		this.dates = dates;
	}

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

	public int getArtistNum() {
		return artistNum;
	}

	public void setArtistNum(int artistNum) {
		this.artistNum = artistNum;
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

	public int getTotalQty() {
		return totalQty;
	}

	public void setTotalQty(int totalQty) {
		this.totalQty = totalQty;
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