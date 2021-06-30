package com.fw.s1.board.lookbook;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fw.s1.board.BoardVO;
import com.fw.s1.util.Pager;

@Controller
@RequestMapping("/lookbook/**")
public class LookBookController {
	@Autowired
	private LookBookService lookbookService;
	
	@GetMapping("list")
	public String getList(Model model, Pager pager) throws Exception {
		List<LookBookVO> ar = lookbookService.List(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);

		return "board/lookbook/lookbook";
	}
	
	@GetMapping("select")
	public ModelAndView getSelect(LookBookVO lookbookVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		lookbookVO = lookbookService.getSelect(lookbookVO);
		mv.addObject("vo", lookbookVO);
		mv.setViewName("board/lookbook/lookbookSelect");
		return mv;
	}
	
	@GetMapping("insert")
	public String setInsert(Model model) throws Exception {
		model.addAttribute("action", "insert");
		return "board/lookbook/lookbookInsert";
	}

	@PostMapping("insert")
	public String setInsert(LookBookVO lookbookVO,MultipartFile[] files) throws Exception {
//			System.out.println(files.length);
//			for(MultipartFile f : files) {
//				System.out.println(f.getOriginalFilename());
//			}

		int result = lookbookService.setInsert(lookbookVO,files);

		return "redirect:./list";
	}
}
