package com.dost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.ForumDAO;
import com.dost.hibernate.DbForumTopic;

@Service("forumService")
@Transactional(propagation = Propagation.SUPPORTS)
public class ForumServiceImpl implements ForumService {

	@Autowired
	ForumDAO forumDAO;
	
	public List<DbForumTopic> getLastNTopics(int count) {
		return forumDAO.getLastNTopics(count);
	}

}
