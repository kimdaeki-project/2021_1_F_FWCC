package com.fw.s1.board.qna;

import java.util.List;

import com.fw.s1.board.BoardFileVO;
import com.fw.s1.board.BoardVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QnaVO extends BoardVO{
	private long productNum;
	private List<BoardFileVO> files;
}
