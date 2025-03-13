package com.AlbumArchive.VO;

public class CartVO {
	private int num;
	private String album_name;
	private String user_id;
	private int price;
	private String img;
	private int qty;
	
	
	public CartVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartVO(int num, String album_name, String user_id, int price, String img, int qty) {
		super();
		this.num = num;
		this.album_name = album_name;
		this.user_id = user_id;
		this.price = price;
		this.img = img;
		this.qty = qty;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getAlbum_name() {
		return album_name;
	}
	public void setAlbum_name(String album_name) {
		this.album_name = album_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	
	
}
