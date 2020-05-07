package com.yzx.pojo;

/**
 * @author YZX
 * @date 2020年4月26日
 * @time 上午9:25:34
 */

public class Shop {
	private int id;
	private int shopid;
	private String shopname;
	private String address;
	private String daddress;
	public String getDaddress() {
		return daddress;
	}
	public void setDadress(String daddress) {
		this.daddress = daddress;
	}
	private String remark;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getShopid() {
		return shopid;
	}
	public void setShopid(int shopid) {
		this.shopid = shopid;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getAddress() {
		return address;
	}
	public void setAdress(String address) {
		this.address = address;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
