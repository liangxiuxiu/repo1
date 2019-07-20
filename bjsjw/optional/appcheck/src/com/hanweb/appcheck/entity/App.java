package com.hanweb.appcheck.entity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.hanweb.common.annotation.Column;
import com.hanweb.common.annotation.ColumnType;
import com.hanweb.common.annotation.Id;
import com.hanweb.common.annotation.Table;

@Table(name = App.TABLE)
public class App implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -213625138950068659L;

	public static final String TABLE = "complat_app";
	
	/**
	 * 主键
	 */
	@Id
	@Column(type = ColumnType.INT)
	private Integer iid;
	/**
	 * 应用名称
	 */
	@Column(type = ColumnType.VARCHAR)
	private String appname;
	/**
	 * appid
	 */
	@Column(type = ColumnType.VARCHAR, update = false)
	private String appid;
	/**
	 * appsecret
	 */
	@Column(type = ColumnType.VARCHAR, update = false)
	private String appsecret;
	/**
	 * ip地址
	 */
	@Column(type = ColumnType.VARCHAR)
	private String ipadd;
	/**
	 * 私钥
	 */
	@Column(type = ColumnType.VARCHAR, length = 1000, update = false)
	private String prK;
	/**
	 * 公钥
	 */
	@Column(type = ColumnType.VARCHAR, length = 1000, update = false)
	private String puK;
	
	/**
	 * 是否开启(1:开启    0：关闭)
	 */
	@Column(type = ColumnType.CHAR, length = 1, update = false)
	private String isOpen = "1";
	
	@Column(type = ColumnType.JSON)
	private Map<String, String> cusParam = new HashMap<String, String>();
	
	public Integer getIid() {
		return iid;
	}
	public void setIid(Integer iid) {
		this.iid = iid;
	}
	public String getAppname() {
		return appname;
	}
	public void setAppname(String appname) {
		this.appname = appname;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getAppsecret() {
		return appsecret;
	}
	public void setAppsecret(String appsecret) {
		this.appsecret = appsecret;
	}
	public String getIpadd() {
		return ipadd;
	}
	public void setIpadd(String ipadd) {
		this.ipadd = ipadd;
	}
	public String getPrK() {
		return prK;
	}
	public void setPrK(String prK) {
		this.prK = prK;
	}
	public String getPuK() {
		return puK;
	}
	public void setPuK(String puK) {
		this.puK = puK;
	}
	public String getIsOpen() {
		return isOpen;
	}
	public void setIsOpen(String isOpen) {
		this.isOpen = isOpen;
	}
	public Map<String, String> getCusParam() {
		return cusParam;
	}
	public void setCusParam(Map<String, String> cusParam) {
		this.cusParam = cusParam;
	}
	
}
