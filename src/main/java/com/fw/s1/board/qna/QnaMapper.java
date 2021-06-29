package com.fw.s1.board.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.board.BoardMapper;
import com.fw.s1.member.MemberVO;

@Mapper
public interface QnaMapper extends BoardMapper{
	
	// member Board List 조회
	public List<QnaVO> getMemberBoardList(MemberVO memberVO) throws Exception;
	
}
