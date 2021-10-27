package org.phone48.dto;

public class TagDTO {
	
	private String tagid;
	private int stag;

	public TagDTO() {
	}

	public String getTagid() {
		return tagid;
	}

	public void setTagid(String tagid) {
		this.tagid = tagid;
	}

	public int getStag() {
		return stag;
	}

	public void setStag(int stag) {
		this.stag = stag;
	}

	@Override
	public String toString() {
		return "TagDTO [tagid=" + tagid + ", stag=" + stag + "]";
	}
	
	
}
