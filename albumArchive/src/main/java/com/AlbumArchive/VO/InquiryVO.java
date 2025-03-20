package com.AlbumArchive.VO;

public class InquiryVO {

    private int num;       // 문의 번호
    private String user_id; // 회원 ID
    private String title;  // 문의 제목
    private String info;   // 문의 내용
    private String answer; // 답변
    private String img;    // 이미지 경로
    private int checks;    // 확인 여부

    // 기본 생성자
    public InquiryVO() {}

    // Getter & Setter
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
        return "InquiryVO [num=" + num + ", user_id=" + user_id + ", title=" + title + ", info=" + info + ", answer=" + answer + ", img=" + img + ", checks=" + checks + "]";
    }
}
