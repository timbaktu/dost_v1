package com.dost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbFaqCategory;
import com.dost.service.FaqCategoryService;

@Controller
@RequestMapping("api")
public class FaqCategoryController {

	@Autowired
	FaqCategoryService categoryService;
	
	@RequestMapping(value="/faqcategory/names",method=RequestMethod.GET)
	@ResponseBody
	public List<String> getCategoryList() {
		return categoryService.getCategoryList(); 
	}
	
	@RequestMapping(value="/faqcategory/all",method=RequestMethod.GET)  
	@ResponseBody
	public List<DbFaqCategory> getAllCategories() {
		return categoryService.getAllCategories(); 
	}
}
