package com.dost.service;

import java.util.List;

import com.dost.hibernate.DbForumTopic;

public interface ForumService {

	List<DbForumTopic> getLastNTopics(int i);

	
}
