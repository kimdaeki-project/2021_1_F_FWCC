package com.fw.s1.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String goHome(@ModelAttribute("msg")String msg) throws Exception {
		return "index";
	}
}
