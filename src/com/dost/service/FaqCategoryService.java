package com.dost.service;

import java.util.List;

import com.dost.hibernate.DbFaqCategory;

public interface FaqCategoryService {
	
	public List<String> getCategoryList();
	
	public List<DbFaqCategory> getAllCategories();
	
	public DbFaqCategory addFaqCategory(DbFaqCategory category);
}
