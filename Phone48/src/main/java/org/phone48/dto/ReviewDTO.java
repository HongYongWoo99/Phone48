package org.phone48.dto;

public class ReviewDTO {
	private int rno;
	private String id;
	private String nickname;
	private String review_content;
	private int review_point;
	public ReviewDTO(int rno, String id, String nickname, String review_content, int review_point) {
		super();
		this.rno = rno;
		this.id = id;
		this.nickname = nickname;
		this.review_content = review_content;
		this.review_point = review_point;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_point() {
		return review_point;
	}
	public void setReview_point(int review_point) {
		this.review_point = review_point;
	}
	@Override
	public String toString() {
		return "ReviewDTO [rno=" + rno + ", id=" + id + ", nickname=" + nickname + ", review_content=" + review_content
				+ ", review_point=" + review_point + "]";
	}
	
}

