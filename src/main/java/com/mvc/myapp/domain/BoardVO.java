package com.mvc.myapp.domain;

import java.util.Date;

import lombok.Data;


@Data
public class BoardVO {
	
	private Long boardNum;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private Date regdate;
	private Date updateDate;

}
