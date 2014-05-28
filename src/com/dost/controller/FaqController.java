package com.dost.controller;

import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbFaq;
import com.dost.hibernate.DbFaqCategory;
import com.dost.service.FaqService;

@Controller
@RequestMapping("api")
public class FaqController {

	@Autowired
	private FaqService faqService;
	
	@RequestMapping(value="/faq/{id}", method=RequestMethod.GET)  
	@ResponseBody
	public DbFaq getFaqById(@PathVariable Long id) {
		try {
			System.out.println(new ObjectMapper().writeValueAsString(faqService.getFaqById(id).getCategory()));
		}
		catch (Exception e) {
					e.printStackTrace();
		}
		return faqService.getFaqById(id); 
	}
	
	@RequestMapping(value="/faqs/all", method=RequestMethod.GET, produces = "application/json")  
	@ResponseBody
	public List<DbFaq> getAllFaqs() {
		List<DbFaq> faqs = faqService.getAllFaq(); 
		return faqs;
	}
	
	@RequestMapping(value="/faq/add", method=RequestMethod.POST)  
	@ResponseBody
	public DbFaq addFaq(DbFaq dbFaq) {
		DbFaqCategory dbFaqCategory = new DbFaqCategory();
		dbFaqCategory.setFaqCategoryId(1L);
		dbFaqCategory.setFaqCategoryName("Career");
		dbFaq.setCategory(dbFaqCategory);

		DbFaq faq = faqService.addFaq(dbFaq); 
		return faq;
	}
}
