package org.phone48.dto;

public class TagDTO {
	
	private int btag;
	private String btname;
	private int atag;
	private String atname;
	private int ctag;
	private String ctname;
	private int rtag;
	private String prtname;
	private int ptag;
	private String ptname;

	public TagDTO() {
	}

	public int getBtag() {
		return btag;
	}

	public void setBtag(int btag) {
		this.btag = btag;
	}

	public String getBtname() {
		return btname;
	}

	public void setBtname(String btname) {
		this.btname = btname;
	}

	public int getAtag() {
		return atag;
	}

	public void setAtag(int atag) {
		this.atag = atag;
	}

	public String getAtname() {
		return atname;
	}

	public void setAtname(String atname) {
		this.atname = atname;
	}

	public int getCtag() {
		return ctag;
	}

	public void setCtag(int ctag) {
		this.ctag = ctag;
	}

	public String getCtname() {
		return ctname;
	}

	public void setCtname(String ctname) {
		this.ctname = ctname;
	}

	public int getRtag() {
		return rtag;
	}

	public void setRtag(int rtag) {
		this.rtag = rtag;
	}

	public String getPrtname() {
		return prtname;
	}

	public void setPrtname(String prtname) {
		this.prtname = prtname;
	}

	public int getPtag() {
		return ptag;
	}

	public void setPtag(int ptag) {
		this.ptag = ptag;
	}

	public String getPtname() {
		return ptname;
	}

	public void setPtname(String ptname) {
		this.ptname = ptname;
	}

	@Override
	public String toString() {
		return "TagDTO [btag=" + btag + ", btname=" + btname + ", atag=" + atag + ", atname=" + atname + ", ctag="
				+ ctag + ", ctname=" + ctname + ", rtag=" + rtag + ", prtname=" + prtname + ", ptag=" + ptag
				+ ", ptname=" + ptname + "]";
	}
	
	
	
}
