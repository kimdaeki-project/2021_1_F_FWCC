package com.fw.s1.board;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long num;
	private String writer;
	private String contents;
	private Date regDate;
	private Long hit;
	private String title;
}
