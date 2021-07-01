package com.fw.s1.board.lookbook;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.fw.s1.util.FileManager2;
import com.fw.s1.util.Pager;



@Service
public class LookBookService {
	@Autowired
	private LookBookMapper lookbookMapper;

	@Autowired
	private FileManager2 fileManager2;

	

	public List<LookBookVO> List(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.makeRow();
		Long totalCount = lookbookMapper.getTotalCount(pager);
		pager.makeNum(totalCount);
		return lookbookMapper.List(pager);
	}
	 	
	public LBSelectVO getSelect(LBSelectVO lbSelectVO) throws Exception {
		return lookbookMapper.getSelect(lbSelectVO);
	}
	
	public int setInsert(LookBookVO lookbookVO,MultipartFile[] files) throws Exception {
		int result = lookbookMapper.setInsert(lookbookVO);

		String filePath= "upload/lookbook/";
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.getSize()==0) {
				continue;
			}
			String fileName= fileManager2.save(multipartFile, filePath);
			System.out.println(fileName);
			LookBookFileVO boardFileVO = new LookBookFileVO();
			boardFileVO.setFileName(fileName);
			boardFileVO.setOriName(multipartFile.getOriginalFilename());
			boardFileVO.setNum(lookbookVO.getLookbookNum());
			result = lookbookMapper.setFileInsert(boardFileVO);
		}

		return result;
	}

	
	public int setUpdate(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.setUpdate(lookbookVO);
	}
	
	public int setDelete(LookBookVO lookbookVO) throws Exception {
		return lookbookMapper.setDelete(lookbookVO);
	}

}
