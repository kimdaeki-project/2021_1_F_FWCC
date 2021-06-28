package com.fw.s1.board.lookbook;

import java.util.List;

import lombok.Data;


@Data
public class LookBookVO {
	private long lookbookNum;
	private String division;
	private String title;
	private List<LookBookFileVO> files;
}
