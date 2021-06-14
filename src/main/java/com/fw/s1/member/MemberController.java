package com.fw.s1.member;

import java.util.Enumeration;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
// Member Login =========================================================================
	@GetMapping("memberLogin")
	public void getLogin() throws Exception {
		
	}
	
	@GetMapping("memberLoginSuccess")
	public ModelAndView loginSuccess(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		// 1. session의 속성명들 꺼내오기
		Enumeration<String> enumeration = session.getAttributeNames();
		while(enumeration.hasMoreElements()) {
			System.out.println(enumeration.nextElement());
		}
		
		mv.addObject("msg", "로그인 성공");
		mv.addObject("path", "/");
		mv.setViewName("common/commonResult");
		return mv;
	}
	
	@GetMapping("memberLoginFail")
	public ModelAndView loginFail() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "다시 로그인해주세요");
		mv.addObject("path", "/member/memberLogin");
		mv.setViewName("common/commonResult");
		return mv;
	}
	
	@GetMapping("memberLogout")
	public ModelAndView getLogout(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("/");
		return mv;
	}
	
// Member Join ============================================================================
	@GetMapping("memberJoin")
	public void setJoin(Model model) throws Exception {
		model.addAttribute("memberVO", new MemberVO());
	}
	
	@PostMapping("memberJoin")
	public ModelAndView setJoin(@Valid MemberVO memberVO, Errors errors) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = memberService.setJoin(memberVO);
		if(errors.hasErrors()) {
			System.out.println("=================================");
			System.out.println("errors : "+errors);
			System.out.println("=================================");
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("usernameCheck")
	public ModelAndView getUsernameCheck(MemberVO memberVO) throws Exception {		
		ModelAndView mv = new ModelAndView();
		int result = memberService.getUsernameCheck(memberVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
// My Page ================================================================================
	@GetMapping("memberPage")
	public void memberPage() throws Exception {
		
	}
	
	
}
