package com.mvc.myapp.domain;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum;
	private int amountPerPage;
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum,int amountPerPage) {
		
		this.pageNum=pageNum;
		this.amountPerPage=amountPerPage;
		
	}
	
	public String[] getTypeArr() {
		
		return type== null ? new String[] {}: type.split("");
	}
	
}
