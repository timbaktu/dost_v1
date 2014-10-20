package com.dost.hibernate;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonManagedReference;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name="jforum_topics")
@Cache(usage=CacheConcurrencyStrategy.READ_ONLY, region="database")
public class DbForumTopic implements Serializable {

	@Id
	@Column(name = "topic_id")
	private Long topicId;
	@Column(name = "topic_title")
	private String topicTitle;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "dbForumTopic")
	@JsonManagedReference
	private List<DbForumPost> forumPosts;
	
	public Long getTopicId() {
		return topicId;
	}
	public void setTopicId(Long topicId) {
		this.topicId = topicId;
	}
	public String getTopicTitle() {
		return topicTitle;
	}
	public void setTopicTitle(String topicTitle) {
		this.topicTitle = topicTitle;
	}
	public List<DbForumPost> getForumPosts() {
		return forumPosts;
	}
	public void setForumPosts(List<DbForumPost> forumPosts) {
		this.forumPosts = forumPosts;
	}
	
	
}
