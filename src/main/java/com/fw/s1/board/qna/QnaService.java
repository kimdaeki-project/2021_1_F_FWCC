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
		return null;
	}
	@Override
	public BoardVO getSelect(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int setInsert(BoardVO boardVO, MultipartFile[] files) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int setUpdate(BoardVO boardVO, MultipartFile[] files) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int commentInsert(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<BoardCommentVO> commentList(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public BoardCommentVO commentSelect(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int commentUpdate(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int commentDelete(BoardCommentVO boardCommentVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
