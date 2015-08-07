package com.moe.sls.dao;

import java.util.Date;

public class Pojo {
	Long id;
	String link_name;
	Short min;
	Short max;
	Date createDate;
	Long createBy ;
	Date updateDate = new Date();
	Long updateBy;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLink_name() {
		return link_name;
	}
	public void setLink_name(String link_name) {
		this.link_name = link_name;
	}
	public Short getMin() {
		return min;
	}
	public void setMin(Short min) {
		this.min = min;
	}
	public Short getMax() {
		return max;
	}
	public void setMax(Short max) {
		this.max = max;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Long getCreateBy() {
		return createBy;
	}
	public void setCreateBy(Long createBy) {
		this.createBy = createBy;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Long getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(Long updateBy) {
		this.updateBy = updateBy;
	}
	
	

}
