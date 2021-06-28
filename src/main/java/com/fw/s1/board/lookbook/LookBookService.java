package com.fw.s1.board.lookbook;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fw.s1.board.BoardVO;
import com.fw.s1.util.Pager;



@Service
public class LookBookService {
	@Autowired
	private LookBookMapper lookbookMapper;
	

	public List<LookBookVO> List(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.makeRow();
		Long totalCount = lookbookMapper.getTotalCount(pager);
		pager.makeNum(totalCount);
		return lookbookMapper.List(pager);
	}
	 	
	public LookBookVO getSelect(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.getSelect(lookbookVO);
	}
	
	public int setInsert(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.setInsert(lookbookVO);
	}
	
	public int setUpdate(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.setUpdate(lookbookVO);
	}
	
	public int setDelete(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.setDelete(lookbookVO);
	}

}
