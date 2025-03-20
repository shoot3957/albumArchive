package com.AlbumArchive.VO;

public class InquiryVO {

	private int num;
	private String user_id;
	private String title;
	private String info;
	private String answer;
	private String img;
	private int checks;
	public InquiryVO(int num, String user_id, String title, String info, String answer, String img, int checks) {
		super();
		this.num = num;
		this.user_id = user_id;
		this.title = title;
		this.info = info;
		this.answer = answer;
		this.img = img;
		this.checks = checks;
	}
	public InquiryVO(String user_id, String title, String info, String answer, String img, int checks) {
		super();
		this.user_id = user_id;
		this.title = title;
		this.info = info;
		this.answer = answer;
		this.img = img;
		this.checks = checks;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getChecks() {
		return checks;
	}
	public void setChecks(int checks) {
		this.checks = checks;
	}
	@Override
	public String toString() {
		return "InquiryVO [num=" + num + ", user_id=" + user_id + ", title=" + title + ", info=" + info + ", answer="
				+ answer + ", img=" + img + ", checks=" + checks + "]";
	}
	
	
	
}
