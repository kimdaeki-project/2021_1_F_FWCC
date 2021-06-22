package com.fw.s1.board.lookbook;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.util.Pager;

@Mapper
public interface LookBookMapper {
	public int lbInsert(LookBookVO lookbookVO)throws Exception;
	//lbList
	public List<LookBookVO> lbList(Pager pager)throws Exception;
	//lbSelect
	public LookBookVO lbSelect(LookBookVO lookbookVO)throws Exception;
	//lbUpdate
	public int lbUpdate(LookBookVO lookbookVO)throws Exception;
	//lbDelete
	public int lbDelete(LookBookVO lookbookVO)throws Exception;
}
