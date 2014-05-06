package com.dost.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbFaqCategory;

@Repository("faqCategoryDAO")
public class FaqCategoryDAOImpl implements FaqCategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<String> getCategoryList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select c.faqCategoryName from DbFaqCategory fc");
		List<String> categoriesList = query.list();
		if(categoriesList == null) {
			categoriesList = new ArrayList<String>();
		}
		return categoriesList;
	}

	public List<DbFaqCategory> getAllCategories() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbFaqCategory fc");
		List<DbFaqCategory> categoriesList = query.list();
		if(categoriesList == null) {
			categoriesList = new ArrayList<DbFaqCategory>();
		}
		return categoriesList;
	}
	
	
}
