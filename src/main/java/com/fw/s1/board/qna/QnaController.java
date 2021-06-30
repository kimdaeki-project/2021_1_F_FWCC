package com.fw.s1.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fw.s1.board.BoardCommentVO;
import com.fw.s1.board.BoardFileVO;
import com.fw.s1.board.BoardVO;
import com.fw.s1.member.MemberVO;
import com.fw.s1.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	@Autowired
	private QnaService qnaService;

	
	  @PostMapping("summerFileDelete") public ModelAndView
	  setSummerFileDelete(String fileName)throws Exception{ ModelAndView mv = new
	  ModelAndView(); boolean result = qnaService.setSummerFileDelete(fileName);
	  mv.addObject("result", result); mv.setViewName("common/ajaxResult"); return
	  mv; }
	  
	  @PostMapping("summerFileUpload") public ModelAndView
	  setSummerFileUpload(MultipartFile file)throws Exception{ ModelAndView mv =
	  new ModelAndView(); System.out.println("Summer File Upload");
	  System.out.println(file.getOriginalFilename()); String fileName =
	  qnaService.setSummerFileUpload(file); fileName =
	  "../resources/upload/qna/"+fileName; mv.addObject("result", fileName) ;
	  mv.setViewName("common/ajaxResult");
	  
	  return mv; }
	 

	// /qna/fileDown
	@GetMapping("fileDown")
	public ModelAndView fileDown(String fileName, String oriName) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("fileName", fileName);
		mv.addObject("oriName", oriName);
		mv.addObject("filePath", "/upload/qna/");

		// view의 이름은 Bean의 이름과 일치
		mv.setViewName("down");
		// /fileDown.html
		return mv;
	}

	// /qna/list
	@GetMapping("list")
	public String getList(Model model, Pager pager) throws Exception {
		List<BoardVO> ar = qnaService.getList(pager);
		model.addAttribute("Qlist", ar);
		model.addAttribute("pager", pager);

		return "board/qna/qnaList";
	}

	@GetMapping("select")
	public ModelAndView getSelect(BoardVO boardVO, BoardCommentVO boardCommentVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardCommentVO> lbc = qnaService.commentList(boardCommentVO);
		mv.addObject("Qcm", lbc);
		boardVO = qnaService.getSelect(boardVO);
		mv.addObject("Qvo", boardVO);
		mv.setViewName("board/qna/qnaSelect");
		return mv;
	}

	@GetMapping("insert")
	public String setInsert(Model model) throws Exception {
		model.addAttribute("Qvo", new BoardVO());
		model.addAttribute("action", "qnaInsert");
		return "board/qna/qnaInsert";
	}

	@PostMapping("insert")
	public String setInsert(BoardVO boardVO, MultipartFile[] files) throws Exception {
//			System.out.println(files.length);
//			for(MultipartFile f : files) {
//				System.out.println(f.getOriginalFilename());
//			}

		int result = qnaService.setInsert(boardVO, files);

		return "redirect:./list";
	}

	@GetMapping("update")
	public String setUpdate(BoardVO boardVO, Model model) throws Exception {
		boardVO = qnaService.getSelect(boardVO);
		model.addAttribute("Qvo", boardVO);
		model.addAttribute("action", "Qupdate");
		return "board/qna/qnaUpdate";

	}

	@PostMapping("update")
	public String setUpdate(BoardVO boardVO,MultipartFile [] files) throws Exception {

		int result = qnaService.setUpdate(boardVO,files);

		return "redirect:./list";
	}

	@GetMapping("delete")
	public String setDelete(BoardVO boardVO) throws Exception {
		int result = qnaService.setDelete(boardVO);
		return "redirect:./list";
	}

	@PostMapping("commentInsert")
	public String commentInsert(BoardCommentVO boardCommentVO) throws Exception {
		int result = qnaService.commentInsert(boardCommentVO);
		return "redirect:./select";
	}

	@GetMapping("commentDelete")
	public String commentDelete(BoardCommentVO boardCommentVO) throws Exception {
		int result = qnaService.commentDelete(boardCommentVO);
		return "redirect:./select";
	}

	@GetMapping("commentUpdate")
	public String commentUpdate(BoardVO boardVO, BoardCommentVO boardCommentVO, Model model) throws Exception {
		boardVO = qnaService.getSelect(boardVO);
		boardCommentVO = qnaService.commentSelect(boardCommentVO);
		List<BoardCommentVO> lbc = qnaService.commentList(boardCommentVO);
		model.addAttribute("Qcm", lbc);
		model.addAttribute("Qvo", boardVO);
		model.addAttribute("Qcvo", boardCommentVO);
		model.addAttribute("action", "commentUpdate");
		return "board/qna/qnaSelect";
	}

	@PostMapping("commentUpdate")
	public String commentUpdate(BoardCommentVO boardCommentVO) throws Exception {
		int result = qnaService.commentUpdate(boardCommentVO);
		return "redirect:./select";
	}

}
