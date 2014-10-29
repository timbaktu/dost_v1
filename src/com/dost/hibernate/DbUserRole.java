package com.dost.hibernate;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name="user_roles")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE, region="database")
public class DbUserRole extends DbGeneric implements Serializable  {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "user_role_id")
	private Long userRoleId;
	@Column(name="username")
	private String username;
	@Column(name="role")
	private String role;
	@JsonBackReference
	@OneToOne
	@JoinColumn(name="userid", nullable=false)
	private DbUser dbUser;
	
	public Long getUserRoleId() {
		return userRoleId;
	}
	public void setUserRoleId(Long userRoleId) {
		this.userRoleId = userRoleId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public DbUser getDbUser() {
		return dbUser;
	}
	public void setDbUser(DbUser dbUser) {
		this.dbUser = dbUser;
	}
	
	
}
