package com.dost.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbFaq;
import com.dost.hibernate.DbFaqCategory;
import com.dost.model.Faq;
import com.dost.service.FaqCategoryService;
import com.dost.service.FaqService;

@Controller
@RequestMapping("api")
public class FaqController {

	@Autowired
	private FaqService faqService;
	@Autowired
	private FaqCategoryService categoryService;
	
	@RequestMapping(value="/faq/{id}", method=RequestMethod.GET)  
	@ResponseBody
	public DbFaq getFaqById(@PathVariable Long id, HttpServletRequest request) {
		
		String actionType = request.getParameter("type");
		// Set default if not present
		if(actionType == null) {
			actionType = "CURRENT";
		}
		DbFaq response = null;
		// Start checking now
		if(actionType.equals("CURRENT")) {
			response = faqService.getFaqById(id); 
		}
		else if(actionType.equals("NEXT")) {
			response = faqService.getNextFaqForThisId(id); 
		}
		else if(actionType.equals("PREVIOUS")) {
			response = faqService.getPreviousFaqForThisId(id); 
		}
		return response;
	}
	
	@RequestMapping(value="/faqs/all", method=RequestMethod.GET, produces = "application/json")  
	@ResponseBody
	public List<DbFaq> getAllFaqs() {
		List<DbFaq> faqs = faqService.getAllFaq(); 
		return faqs;
	}
	
//	@RequestMapping(value="/faq/add", method=RequestMethod.POST)  
//	@ResponseBody
//	public DbFaq addFaq(DbFaq dbFaq) {
//		DbFaqCategory dbFaqCategory = new DbFaqCategory();
//		dbFaqCategory.setFaqCategoryId(1L);
//		dbFaqCategory.setFaqCategoryName("Career");
//		dbFaq.setCategory(dbFaqCategory);
//
//		DbFaq faq = faqService.addFaq(dbFaq); 
//		return faq;
//	}
	
	@RequestMapping(value="/faq/add", method=RequestMethod.POST)  
	@ResponseBody
	public Faq addFaq(@RequestBody Faq faq, HttpServletRequest request){
		DbFaqCategory dbFaqCategory = categoryService.findCategoryByName(faq.getCategory());
		DbFaq dbFaq = new DbFaq();
		dbFaq.setQuestion(faq.getQuestion());
		dbFaq.setAnswer(faq.getAnswer());
		dbFaq.setCategory(dbFaqCategory);
		faq.setCategoryId(""+dbFaqCategory.getFaqCategoryId());
		faqService.addFaq(dbFaq);
		return faq;
	}
	
	@RequestMapping(value="/faq/update", method=RequestMethod.PUT)  
	@ResponseBody
	public Faq updateFaq(@RequestBody Faq faq, HttpServletRequest request) {
		DbFaqCategory dbFaqCategory = categoryService.findCategoryByName(faq.getCategory());
		DbFaq dbFaq = faqService.getFaqById(faq.getId());
		dbFaq.setQuestion(faq.getQuestion());
		dbFaq.setAnswer(faq.getAnswer());
		dbFaq.setCategory(dbFaqCategory);
		faq.setCategoryId(""+dbFaqCategory.getFaqCategoryId());
		faqService.addFaq(dbFaq);
		return faq;
	}
	
	@RequestMapping(value="/faq/{id}/delete", method=RequestMethod.DELETE)  
	public Map<String, String> deleteFaqById(@PathVariable Long id) {
		Map<String, String> response = new HashMap<String, String>();
		boolean output = faqService.deleteFaqById(id);
		response.put("status", output+"");
		return response;
	}
}
