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
		System.out.println("username : "+memberVO.getUsername());
		System.out.println("password : "+memberVO.getPassword());
		System.out.println("name : "+memberVO.getName());
		System.out.println("phone0 : "+memberVO.getPhone0());
		System.out.println("phone1 : "+memberVO.getPhone1());
		System.out.println("phone2 : "+memberVO.getPhone2());
		System.out.println("phone : "+memberVO.getPhone());
		System.out.println("email : "+memberVO.getEmail());
		System.out.println("birth : "+memberVO.getBirth());
		System.out.println("smsAgree : "+memberVO.isSmsAgree());
		System.out.println("emailAgree : "+memberVO.isEmailAgree());
		System.out.println("zipCode : "+memberVO.getZipCode());
		System.out.println("basicAddr : "+memberVO.getBasicAddr());
		System.out.println("detailAddr : "+memberVO.getDetailAddr());
	}
	
	@PostMapping("usernameCheck")
	public void getUsernameCheck() throws Exception {
		
//		memberVO = memberService.getUsernameCheck(memberVO);
	}
}
