package com.dost.dao;

import java.util.List;

import com.dost.hibernate.DbForumTopic;

public interface ForumDAO {

	List<DbForumTopic> getLastNTopics(int count);

}
