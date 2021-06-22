package com.fw.s1.board.lookbook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lookbook/**")
public class LookBookController {
	@Autowired
	private LookBookService lookbookService;
	
	
}
