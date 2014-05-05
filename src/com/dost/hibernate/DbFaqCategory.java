package com.dost.hibernate;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="FAQCATEGORY")
public class DbFaqCategory extends DbGeneric {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "faqcategoryid")
	private Long faqCategoryId;
	@Column(name = "faqcategoryname")
	private String faqCategoryName;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
	private List<DbFaq> faqs;
	
	
	public Long getFaqCategoryId() {
		return faqCategoryId;
	}
	public void setFaqCategoryId(Long faqCategoryId) {
		this.faqCategoryId = faqCategoryId;
	}
	public String getFaqCategoryName() {
		return faqCategoryName;
	}
	public void setFaqCategoryName(String faqCategoryName) {
		this.faqCategoryName = faqCategoryName;
	}
	public List<DbFaq> getFaqs() {
		return faqs;
	}
	public void setFaqs(List<DbFaq> faqs) {
		this.faqs = faqs;
	}

	
	
}
