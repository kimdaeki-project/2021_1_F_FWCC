package com.fw.s1.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fw.s1.board.BoardCommentVO;
import com.fw.s1.board.BoardFileVO;
import com.fw.s1.board.BoardService;
import com.fw.s1.board.BoardVO;
import com.fw.s1.util.FileManager;
import com.fw.s1.util.Pager;

@Service
public class QnaService implements BoardService{
	
	@Autowired
	private QnaMapper qnaMapper;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<BoardVO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.makeRow();
		Long totalCount = qnaMapper.getTotalCount(pager);
		pager.makeNum(totalCount);
		return qnaMapper.getList(pager);
	}

	@Override
	public BoardVO getSelect(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		qnaMapper.setHitUpdate(boardVO);
		return qnaMapper.getSelect(boardVO);
	}

	@Override
	public int setInsert(BoardVO boardVO, MultipartFile[] files) throws Exception {
		// TODO Auto-generated method stub
		int result = qnaMapper.setInsert(boardVO);
		
		String filePath= "upload/qna/";
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.getSize()==0) {
				continue;
			}
			String fileName= fileManager.save(multipartFile, filePath);
			System.out.println(fileName);
			BoardFileVO boardFileVO = new BoardFileVO();
			boardFileVO.setFileName(fileName);
			boardFileVO.setOriName(multipartFile.getOriginalFilename());
			boardFileVO.setNum(boardVO.getNum());
			qnaMapper.setFileInsert(boardFileVO);
		}
		
		return result;
	}

	@Override
	public int setUpdate(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaMapper.setUpdate(boardVO);
	}

	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaMapper.setDelete(boardVO);
	}

	@Override
	public int commentInsert(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaMapper.commentInsert(boardCommentVO);
	}

	@Override
	public BoardCommentVO commentList(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaMapper.commentList(boardCommentVO);
	}

	@Override
	public int commentUpdate(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaMapper.commentUpdate(boardCommentVO);
	}

	@Override
	public int commentDelete(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaMapper.commentUpdate(boardCommentVO);
	}

}
