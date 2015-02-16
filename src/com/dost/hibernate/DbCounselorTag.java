package com.dost.hibernate;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="dost_counselortags")
public class DbCounselorTag extends DbGeneric implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "tagid")
	private Long tagId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "counselorid", nullable = false)
	DbCounselor counselor;
	@Column(name = "tagname")
	private String tagName;
}
