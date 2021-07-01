package com.fw.s1.board.review;

import java.util.List;

import com.fw.s1.board.BoardFileVO;
import com.fw.s1.board.BoardVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO extends BoardVO{
	private List<BoardFileVO> files;
	private String fileName;
}
