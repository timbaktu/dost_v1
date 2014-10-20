package com.dost.hibernate;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonManagedReference;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name="faqcategory")
@Cache(usage=CacheConcurrencyStrategy.READ_ONLY, region="database")
public class DbFaqCategory extends DbGeneric implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3183374686311271754L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "faqcategoryid")
	private Long faqCategoryId;
	@Column(name = "faqcategoryname")
	private String faqCategoryName;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "category")
	@JsonManagedReference
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
