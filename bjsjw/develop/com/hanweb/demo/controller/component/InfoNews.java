package com.hanweb.demo.controller.component;

import java.util.Date;
import com.hanweb.common.annotation.Column;
import com.hanweb.common.annotation.ColumnType;
import com.hanweb.common.annotation.Id;
import com.hanweb.common.annotation.Table;

@Table(name = InfoNews.TABLE_NAME)
public class InfoNews {
	
	public static final String TABLE_NAME = "demo_infonews";
	
	@Id
	@Column(type = ColumnType.INT)
	private Integer iid;

	@Column(type = ColumnType.VARCHAR)
	private String info_title;
	
	@Column(type = ColumnType.INT, length = 1)
	private Integer info_type;
	
	@Column(type = ColumnType.DATE)
	private Date info_date;
	
	@Column(type = ColumnType.TEXT)
	private String info_content;

	public Integer getIid() {
		return iid;
	}

	public void setIid(Integer iid) {
		this.iid = iid;
	}

	public String getInfo_title() {
		return info_title;
	}

	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}

	public Integer getInfo_type() {
		return info_type;
	}

	public void setInfo_type(Integer info_type) {
		this.info_type = info_type;
	}

	public Date getInfo_date() {
		return info_date;
	}

	public void setInfo_date(Date info_date) {
		this.info_date = info_date;
	}

	public String getInfo_content() {
		return info_content;
	}

	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}
}
