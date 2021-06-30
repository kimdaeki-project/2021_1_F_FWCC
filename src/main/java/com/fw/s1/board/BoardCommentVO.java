package com.fw.s1.board;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardCommentVO {
	private long commentNum;
	private String writer;
	private Date regDate;
	private String contents;
	private long num;
}
