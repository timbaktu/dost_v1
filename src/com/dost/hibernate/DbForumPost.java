package com.dost.hibernate;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name="jforum_posts")
@Cache(usage=CacheConcurrencyStrategy.READ_ONLY, region="database")
public class DbForumPost implements Serializable {

	@Id
	@Column(name = "post_id")
	private Long postId;
	@Column(name = "post_time")
	private String postTime;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "topic_id", nullable = false)
	@JsonBackReference
	DbForumTopic dbForumTopic;
	
	public Long getPostId() {
		return postId;
	}
	public void setPostId(Long postId) {
		this.postId = postId;
	}
	public String getPostTime() {
		return postTime;
	}
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	public DbForumTopic getDbForumTopic() {
		return dbForumTopic;
	}
	public void setDbForumTopic(DbForumTopic dbForumTopic) {
		this.dbForumTopic = dbForumTopic;
	}
	
	
}
