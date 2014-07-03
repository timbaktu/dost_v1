package com.dost.hibernate;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonManagedReference;

@Entity
@Table(name="USER")
public class DbUser extends DbGeneric implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1083243294363914028L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "userid")
	private Long userId;
	@Column(name = "username")
	private String username;
	@Column(name = "password")
	@JsonIgnore
	private String password;
	@Column(name = "userrole")
	@JsonIgnore
	private Role userRole;
	@JsonManagedReference
	@OneToOne(fetch = FetchType.EAGER, mappedBy = "dbUser", cascade = CascadeType.ALL)
	private DbUserRole dbUserRole;
	@Column(name = "enabled")
	@JsonIgnore
	private Integer enabled;
	
	//TODO: Need place holder for images or avatar, may be clob or blob. Satya you decide
	
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Role getUserRole() {
		return userRole;
	}
	public void setUserRole(Role userRole) {
		this.userRole = userRole;
	}
	public DbUserRole getDbUserRole() {
		return dbUserRole;
	}
	public void setDbUserRole(DbUserRole dbUserRole) {
		this.dbUserRole = dbUserRole;
	}
	public Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}
	
	
	
}
