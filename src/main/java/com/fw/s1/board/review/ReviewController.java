package com.fw.s1.board.review;

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
@RequestMapping("/review/**")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;

	
	  @PostMapping("summerFileDelete") public ModelAndView
	  setSummerFileDelete(String fileName)throws Exception{ ModelAndView mv = new
	  ModelAndView(); boolean result = reviewService.setSummerFileDelete(fileName);
	  mv.addObject("result", result); mv.setViewName("common/ajaxResult"); return
	  mv; }
	  
	  @PostMapping("summerFileUpload") public ModelAndView
	  setSummerFileUpload(MultipartFile file)throws Exception{ ModelAndView mv =
	  new ModelAndView(); System.out.println("Summer File Upload");
	  System.out.println(file.getOriginalFilename()); String fileName =
	  reviewService.setSummerFileUpload(file); fileName =
	  "../resources/upload/review/"+fileName; mv.addObject("result", fileName) ;
	  mv.setViewName("common/ajaxResult");
	  
	  return mv; }
	 

	// /review/fileDown
	@GetMapping("fileDown")
	public ModelAndView fileDown(String fileName, String oriName) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("fileName", fileName);
		mv.addObject("oriName", oriName);
		mv.addObject("filePath", "/upload/review/");

		// view의 이름은 Bean의 이름과 일치
		mv.setViewName("down");
		// /fileDown.html
		return mv;
	}

	// /review/list
	@GetMapping("list")
	public String getList(Model model, Pager pager) throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO = reviewService.getSelect(boardVO);
		model.addAttribute("Rvo", boardVO);
		List<BoardVO> ar = reviewService.getList(pager);
		model.addAttribute("Rlist", ar);
		model.addAttribute("pager", pager);

		return "board/review/reviewList";
	}

	@GetMapping("select")
	public ModelAndView getSelect(BoardVO boardVO, BoardCommentVO boardCommentVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardCommentVO> lbc = reviewService.commentList(boardCommentVO);
		mv.addObject("Rcm", lbc);
		boardVO = reviewService.getSelect(boardVO);
		mv.addObject("Rvo", boardVO);
		mv.setViewName("board/review/reviewSelect");
		return mv;
	}

	@GetMapping("insert")
	public String setInsert(Model model) throws Exception {
		model.addAttribute("Rvo", new BoardVO());
		model.addAttribute("action", "reviewInsert");
		return "board/review/reviewInsert";
	}

	@PostMapping("insert")
	public String setInsert(BoardVO boardVO, MultipartFile[] files) throws Exception {
//			System.out.println(files.length);
//			for(MultipartFile f : files) {
//				System.out.println(f.getOriginalFilename());
//			}

		int result = reviewService.setInsert(boardVO, files);

		return "redirect:./list";
	}

	@GetMapping("update")
	public String setUpdate(BoardVO boardVO, Model model) throws Exception {
		boardVO = reviewService.getSelect(boardVO);
		model.addAttribute("Rvo", boardVO);
		model.addAttribute("action", "update");
		return "board/review/reviewUpdate";

	}

	@PostMapping("update")
	public String setUpdate(BoardVO boardVO,MultipartFile [] files) throws Exception {

		int result = reviewService.setUpdate(boardVO,files);

		return "redirect:./list";
	}

	@GetMapping("delete")
	public String setDelete(BoardVO boardVO) throws Exception {
		int result = reviewService.setDelete(boardVO);
		return "redirect:./list";
	}

	@PostMapping("commentInsert")
	public String commentInsert(BoardCommentVO boardCommentVO) throws Exception {
		int result = reviewService.commentInsert(boardCommentVO);
		return "redirect:./list";
	}

	@GetMapping("commentDelete")
	public String commentDelete(BoardCommentVO boardCommentVO) throws Exception {
		int result = reviewService.commentDelete(boardCommentVO);
		return "redirect:./list";
	}

	@GetMapping("commentUpdate")
	public String commentUpdate(BoardVO boardVO, BoardCommentVO boardCommentVO, Model model) throws Exception {
		boardVO = reviewService.getSelect(boardVO);
		boardCommentVO = reviewService.commentSelect(boardCommentVO);
		List<BoardCommentVO> lbc = reviewService.commentList(boardCommentVO);
		model.addAttribute("Rcm", lbc);
		model.addAttribute("Rvo", boardVO);
		model.addAttribute("Rcvo", boardCommentVO);
		model.addAttribute("action", "commentUpdate");
		return "board/review/reviewSelect";
	}

	@PostMapping("commentUpdate")
	public String commentUpdate(BoardCommentVO boardCommentVO) throws Exception {
		int result = reviewService.commentUpdate(boardCommentVO);
		return "redirect:./list";
	}

}
