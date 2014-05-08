package com.dost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.FaqCategoryDAO;
import com.dost.hibernate.DbFaqCategory;

@Service("faqCategoryService")
@Transactional(propagation = Propagation.SUPPORTS)
public class FaqCategoryServiceImpl implements FaqCategoryService {

	@Autowired
	FaqCategoryDAO categoryDAO;
	
	public List<String> getCategoryList() {
		return categoryDAO.getCategoryList();
	}

	public List<DbFaqCategory> getAllCategories() {
		return categoryDAO.getAllCategories();
	}

	public DbFaqCategory addFaqCategory(DbFaqCategory category) {
		return categoryDAO.addFaqCategory(category);
	}

	
	
}
