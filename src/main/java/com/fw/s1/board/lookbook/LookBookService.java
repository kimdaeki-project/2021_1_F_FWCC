package com.fw.s1.board.lookbook;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fw.s1.util.FileManager;
import com.fw.s1.util.Pager;



@Service
public class LookBookService {
	@Autowired
	private LookBookMapper lookbookMapper;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private HttpSession session;
	
	 public boolean setSummerFileDelete(String fileName)throws Exception{ boolean
		 result = fileManager.delete("notice", fileName, session); return result; }
		  
		 public String setSummerFileUpload(MultipartFile file)throws Exception{
		  
		 String fileName = fileManager.save("notice", file, session); return fileName;
		 }
	
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
		int result = lookbookMapper.setInsert(lookbookVO);

		return result;
	}

	
	public int setUpdate(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.setUpdate(lookbookVO);
	}
	
	public int setDelete(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.setDelete(lookbookVO);
	}

}
