package com.fw.s1.member;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	
	@GetMapping("memberJoin")
	public void setJoin(Model model) throws Exception {
		model.addAttribute("memberVO", new MemberVO());
	}
	
	@PostMapping("memberJoin")
	public void setJoin(@Valid MemberVO memberVO) throws Exception {
		System.out.println(memberVO.getUsername());
		System.out.println(memberVO.getPassword());
		System.out.println(memberVO.getName());
		System.out.println(memberVO.getPhone());
		System.out.println(memberVO.getEmail());
		System.out.println(memberVO.getBirth());
		System.out.println(memberVO.isSmsAgree());
		System.out.println(memberVO.isEmailAgree());
	}
	
	@PostMapping("usernameCheck")
	public void getUsernameCheck() throws Exception {
		
//		memberVO = memberService.getUsernameCheck(memberVO);
	}
}
