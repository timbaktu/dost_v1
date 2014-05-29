package com.dost.dao;

import java.util.List;

import com.dost.hibernate.DbFaqCategory;

public interface FaqCategoryDAO {

	public List<String> getCategoryList();
	
	public List<DbFaqCategory> getAllCategories();

	public DbFaqCategory addFaqCategory(DbFaqCategory category);

	public DbFaqCategory findCategoryByName(String name);
}
