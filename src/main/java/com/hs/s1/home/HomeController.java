package com.hs.s1.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	
	@GetMapping("/")
	public String goHome() throws Exception {
		return "index";
	}
}
