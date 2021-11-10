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
	private String btag;
	private String atag;
	private String model;
	private String ctag;
	private String ptag;
	private int price;
	public BoardDTO(int bno, String id, String nickname, int trade, String title, String content, String btag,
			String atag, String model, String ctag, String ptag, int price) {
		super();
		this.bno = bno;
		this.id = id;
		this.nickname = nickname;
		this.trade = trade;
		this.title = title;
		this.content = content;
		this.btag = btag;
		this.atag = atag;
		this.model = model;
		this.ctag = ctag;
		this.ptag = ptag;
		this.price = price;
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
	public String getBtag() {
		return btag;
	}
	public void setBtag(String btag) {
		this.btag = btag;
	}
	public String getAtag() {
		return atag;
	}
	public void setAtag(String atag) {
		this.atag = atag;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getCtag() {
		return ctag;
	}
	public void setCtag(String ctag) {
		this.ctag = ctag;
	}
	public String getPtag() {
		return ptag;
	}
	public void setPtag(String ptag) {
		this.ptag = ptag;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", id=" + id + ", nickname=" + nickname + ", trade=" + trade + ", title="
				+ title + ", content=" + content + ", btag=" + btag + ", atag=" + atag + ", model=" + model + ", ctag="
				+ ctag + ", ptag=" + ptag + ", price=" + price + "]";
	}
	
	
}