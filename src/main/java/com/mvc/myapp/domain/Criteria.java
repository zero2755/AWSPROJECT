package com.mvc.myapp.domain;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum;
	private int amountPerPage;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum,int amountPerPage) {
		
		this.pageNum=pageNum;
		this.amountPerPage=amountPerPage;
		
	}
	
}
