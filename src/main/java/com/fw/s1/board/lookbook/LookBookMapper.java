package com.fw.s1.board.lookbook;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.fw.s1.board.BoardFileVO;
import com.fw.s1.util.Pager;

@Mapper
public interface LookBookMapper {
	public Long getTotalCount(Pager pager)throws Exception;
	public int setInsert(LookBookVO lookbookVO)throws Exception;
	//FileInsert
	public int setFileInsert(LookBookFileVO boardFileVO)throws Exception;
	//lbList
	public List<LookBookVO> List(Pager pager)throws Exception;
	//lbSelect
	public LookBookVO getSelect(LookBookVO lookbookVO)throws Exception;
	//lbUpdate
	public int setUpdate(LookBookVO lookbookVO)throws Exception;
	//lbDelete
	public int setDelete(LookBookVO lookbookVO)throws Exception;
}
