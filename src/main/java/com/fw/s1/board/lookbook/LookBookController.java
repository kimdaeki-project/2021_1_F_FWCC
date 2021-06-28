package com.fw.s1.board.lookbook;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


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
}
