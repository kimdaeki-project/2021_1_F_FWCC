package com.fw.s1.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fw.s1.coupon.CouponService;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private CouponService couponService;
	
	@ModelAttribute("date")
	public String adminAll() {
		Date nowTime = Calendar.getInstance().getTime();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
		return sf.format(nowTime);
	}
	
	@GetMapping("adminHome")
	public void adminHome() {
		
	}
	
	@GetMapping("setCouponsp")
	public void setCouponsp()throws Exception {
		
	}
	
	@GetMapping("transmitCoupon")
	public void transmitCoupon(Model model)throws Exception {
		model.addAttribute("cuspList", couponService.getCouponspList());
	}
}
