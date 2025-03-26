package com.AlbumArchive.VO;

public class ReviewVO {
	private int num;
	private String info;
	private String userId;
	private int albumNum;
	private String title;

	public ReviewVO() {
	}

	public ReviewVO(String info, String userId, int albumNum, String title) {
		this.info = info;
		this.userId = userId;
		this.albumNum = albumNum;
		this.title = title;
	}

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getAlbumNum() {
		return albumNum;
	}

	public void setAlbumNum(int albumNum) {
		this.albumNum = albumNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "ReviewVO [num=" + num + ", info=" + info + ", userId=" + userId + ", albumNum=" + albumNum + ", title="
				+ title + "]";
	}
}