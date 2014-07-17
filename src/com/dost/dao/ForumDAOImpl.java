package com.dost.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbForumTopic;

@Repository("forumDAO")
public class ForumDAOImpl implements ForumDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<DbForumTopic> getLastNTopics(int count) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbForumTopic ft order by ft.topicId desc");
		query.setMaxResults(count);
		
		List<DbForumTopic> topics = query.list();
		if(topics == null) {
			topics = new ArrayList<DbForumTopic>();
		}
		return topics;
	}

}
