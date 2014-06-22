package com.dost.hibernate;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;

import org.codehaus.jackson.annotate.JsonIgnore;

public class DbGeneric implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6567774336505738077L;
	@Column(name="createdate")
	@JsonIgnore
	private Date createDate;
	@Column(name="createby")
	@JsonIgnore
	private String createBy;
	@Column(name="updatedate")
	@JsonIgnore
	private Date updateDate;
	@Column(name="updateby")
	@JsonIgnore
	private String updateBy;
	@Column(name="deleted")
	@JsonIgnore
	private String deleted;
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	
	
}
