package com.fw.s1.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fw.s1.board.BoardCommentVO;
import com.fw.s1.board.BoardVO;
import com.fw.s1.util.Pager;
import com.fw.s1.board.qna.QnaService;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	//comment
	
	
	// /qna/fileDown
	@GetMapping("qnaFileDown")
	public ModelAndView fileDown(String fileName, String oriName)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("qnaFileName", fileName);
		mv.addObject("qnaOriName", oriName);
		mv.addObject("qnaFilePath", "/upload/qna/");
		
		// view의 이름은 Bean의 이름과 일치
		mv.setViewName("qnaDown");
		//  /fileDown.html
		return mv;
	}
		
		// /qna/list
		@GetMapping("list")
		public String getList(Model model, Pager pager)throws Exception{
			List<BoardVO> ar = qnaService.getList(pager);
			model.addAttribute("qnaList", ar);
			model.addAttribute("pager", pager);

			return "board/qna/qnaList";
		}
		
		@GetMapping("select")
		public ModelAndView getSelect(BoardVO boardVO,BoardCommentVO boardCommentVO)throws Exception{
			ModelAndView mv = new ModelAndView();
			List<BoardCommentVO> qbc = qnaService.commentList(boardCommentVO);
			mv.addObject("qnaCm",boardCommentVO);
			boardVO = qnaService.getSelect(boardVO);
			mv.addObject("qnaVo", boardVO);
			mv.setViewName("board/qna/qnaSelect");
			return mv;
		}
		
		@GetMapping("insert")
		public String setInsert(Model model)throws Exception{
			model.addAttribute("qnavo", new BoardVO());
			model.addAttribute("action", "insert");
			return "board/qna/qnaInsert";
		}
		
		@PostMapping("insert")
		public String setInsert(BoardVO boardVO, MultipartFile [] files)throws Exception{
//			System.out.println(files.length);
//			for(MultipartFile f : files) {
//				System.out.println(f.getOriginalFilename());
//			}
			
			int result = qnaService.setInsert(boardVO, files);
			
			return "redirect:./list";
		}
		
		@GetMapping("update")
		public String setUpdate(BoardVO boardVO, Model model)throws Exception{
			boardVO = qnaService.getSelect(boardVO);
			model.addAttribute("qnavo", boardVO);
			model.addAttribute("action", "update");
			return "board/qna/form";
			
		}
		
		@PostMapping("update")
		public String setUpdate(BoardVO boardVO)throws Exception{
			
			int result = qnaService.setUpdate(boardVO, null);
			
			return "redirect:./list";
		}
		
		@GetMapping("delete")
		public String setDelete(BoardVO boardVO)throws Exception{
			
			int result = qnaService.setDelete(boardVO);
			
			return "redirect:./list";
		}
		
		@PostMapping("commentInsert")
		public String commentInsert(BoardCommentVO boardCommentVO)throws Exception{
			int result = qnaService.commentInsert(boardCommentVO);
			return "redirect:./list";
		}	
}
