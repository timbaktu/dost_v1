package com.dost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbCounselor;
import com.dost.service.CounselorService;

@Controller
@RequestMapping("api")
public class CounselorController {

	@Autowired
	CounselorService counselorService;
	
	@RequestMapping(value="/counselors/all", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbCounselor> getAllCounselors() {
		List<DbCounselor> counselors = counselorService.getAllCounselors();
		return counselors;
	}
}
