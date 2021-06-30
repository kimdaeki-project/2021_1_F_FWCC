package com.fw.s1.board.stockist;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class stockistController {
	@GetMapping("/stockist")
	public String stockist(@ModelAttribute("msg")String msg) throws Exception {
		return "board/stockist/stockist";
	}

}
