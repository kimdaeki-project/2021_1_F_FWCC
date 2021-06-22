package com.fw.s1.board.lookbook;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class LookBookService {
	@Autowired
	private LookBookMapper lookbookMapper;
	
	public List<LookBookVO> lbList(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.lbList(lookbookVO);
	}
	
	public LookBookVO lbSelect(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.lbSelect(lookbookVO);
	}
	
	public int lbInsert(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.lbInsert(lookbookVO);
	}
	
	public int lbUpdate(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.lbUpdate(lookbookVO);
	}
	
	public int lbDelete(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.lbDelete(lookbookVO);
	}
}
