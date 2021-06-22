package com.fw.s1.board.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fw.s1.board.review.ReviewMapper;
import com.fw.s1.board.BoardCommentVO;
import com.fw.s1.board.BoardFileVO;
import com.fw.s1.board.BoardService;
import com.fw.s1.board.BoardVO;
import com.fw.s1.util.FileManager2;
import com.fw.s1.util.FileManager;
import com.fw.s1.util.Pager;

@Service
public class ReviewService implements BoardService {

	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private FileManager2 fileManager2;
	@Autowired
	private HttpSession session;

	
	 public boolean setSummerFileDelete(String fileName)throws Exception{ boolean
	 result = fileManager.delete("review", fileName, session); return result; }
	  
	 public String setSummerFileUpload(MultipartFile file)throws Exception{
	  
	 String fileName = fileManager.save("review", file, session); return fileName;
	 }


	@Override
	public List<BoardVO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.makeRow();
		Long totalCount = reviewMapper.getTotalCount(pager);
		pager.makeNum(totalCount);
		return reviewMapper.getList(pager);
	}

	@Override
	public BoardVO getSelect(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		reviewMapper.setHitUpdate(boardVO);
		return reviewMapper.getSelect(boardVO);
	}

	@Override
	public int setInsert(BoardVO boardVO, MultipartFile[] files) throws Exception {
		// TODO Auto-generated method stub
		int result = reviewMapper.setInsert(boardVO);

		String filePath= "upload/review/";
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.getSize()==0) {
				continue;
			}
			String fileName= fileManager2.save(multipartFile, filePath);
			System.out.println(fileName);
			BoardFileVO boardFileVO = new BoardFileVO();
			boardFileVO.setFileName(fileName);
			boardFileVO.setOriName(multipartFile.getOriginalFilename());
			boardFileVO.setNum(boardVO.getNum());
			reviewMapper.setFileInsert(boardFileVO);
		}

		return result;
	}

	@Override
	public int commentInsert(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.commentInsert(boardCommentVO);
	}

	@Override
	public List<BoardCommentVO> commentList(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.commentList(boardCommentVO);
	}

	@Override
	public int commentUpdate(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.commentUpdate(boardCommentVO);
	}

	@Override
	public int commentDelete(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.commentDelete(boardCommentVO);
	}

	@Override
	public int setUpdate(BoardVO boardVO,MultipartFile[] files) throws Exception {
		
		return reviewMapper.setUpdate(boardVO);
	}

	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.setDelete(boardVO);
	}
	
	@Override
	public BoardCommentVO commentSelect(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.commentSelect(boardCommentVO);
	}

}
