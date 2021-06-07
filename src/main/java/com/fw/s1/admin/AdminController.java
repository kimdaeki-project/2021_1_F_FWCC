package com.fw.s1.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@GetMapping("adminHome")
	public void adminHome() {
		
	}
}
