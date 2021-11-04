package org.phone48.dto;

import java.io.File;

import org.apache.ibatis.type.Alias;

@Alias("file")
public class FileDTO {
	private int fno;
	private int bno;
	private String id;
	private String path;
	private String originfilename;
	private String type;
	private String url;

	public FileDTO() {
	}

	public FileDTO(File file) {
		this.path = file.getAbsolutePath();
		this.originfilename = file.getName();
		switch (originfilename.substring(originfilename.lastIndexOf(".") + 1).toLowerCase()) {
		case "png":
		case "bmp":
		case "jpg":
		case "gif":
			type = "image";
			break;
		default:
			type = "normal";
		}
	}
	
	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "FileDTO [fno=" + fno + ", bno=" + bno + ", id=" + id + ", path=" + path
				+ ", originfilename=" + originfilename + ", type=" + type + ", url=" + url + "]";
	}

	public String getOriginfilename() {
		return originfilename;
	}

	public void setOriginfilename(String originfilename) {
		this.originfilename = originfilename;
	} 
	
	public String geturl() {
		return url;
	}
	
	public void seturl(String url) {
		this.url = url;
	}

	
}