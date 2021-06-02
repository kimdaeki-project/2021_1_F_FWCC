package com.fw.s1.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fw.s1.member.MemberVO;

@Controller
@RequestMapping("/coupon/**")
public class CouponController {

	@Autowired
	private CouponService couponService;
	
	@GetMapping("list")
	public void getCouponList(Authentication authentication, Model model)throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername("admin");
		//memberVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		model.addAttribute("list", couponService.getCouponList(memberVO));
	}
}
