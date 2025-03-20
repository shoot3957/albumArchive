package com.AlbumArchive.VO;

public class PurchaseVO {

	private int num;
	private String album_name;
	private String user_id;
	private int total_price;
	private String dday;
	private int total_qty;
	
	
	public PurchaseVO(int num, String album_name, String user_id, int total_price, String dday, int total_qty) {
		super();
		this.num = num;
		this.album_name = album_name;
		this.user_id = user_id;
		this.total_price = total_price;
		this.dday = dday;
		this.total_qty = total_qty;
	}
	public PurchaseVO(String album_name, String user_id, int total_price, String dday, int total_qty) {
		super();
		this.album_name = album_name;
		this.user_id = user_id;
		this.total_price = total_price;
		this.dday = dday;
		this.total_qty = total_qty;
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
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getDday() {
		return dday;
	}
	public void setDday(String dday) {
		this.dday = dday;
	}
	public int getTotal_qty() {
		return total_qty;
	}
	public void setTotal_qty(int total_qty) {
		this.total_qty = total_qty;
	}
	@Override
	public String toString() {
		return "PurchaseVO [num=" + num + ", album_name=" + album_name + ", user_id=" + user_id + ", total_price="
				+ total_price + ", dday=" + dday + ", total_qty=" + total_qty + "]";
	}
	
	
	
}
