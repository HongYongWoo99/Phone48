package org.phone48.dto;

import org.apache.ibatis.type.Alias;

@Alias("board")
public class BoardDTO {
	private int bno;
	private String id; 
	private String nickname; 
	private int trade; 
	private String title; 
	private String content;
	private int price;
	private char pick;
	
	public BoardDTO() {
	}

	public BoardDTO(int bno, String id, String nickname, int trade, String title, String content, int price,
			char pick) {
		super();
		this.bno = bno;
		this.id = id;
		this.nickname = nickname;
		this.trade = trade;
		this.title = title;
		this.content = content;
		this.price = price;
		this.pick = pick;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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

	public int getTrade() {
		return trade;
	}

	public void setTrade(int trade) {
		this.trade = trade;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public char getPick() {
		return pick;
	}

	public void setPick(char pick) {
		this.pick = pick;
	}

	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", id=" + id + ", nickname=" + nickname + ", trade=" + trade + ", title="
				+ title + ", content=" + content + ", price=" + price + ", pick=" + pick + "]";
	}



	
}
