package com.fw.s1.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fw.s1.coupon.CouponService;
import com.fw.s1.coupon.CouponVO;
import com.fw.s1.coupon.CouponspVO;
import com.fw.s1.member.MemberService;
import com.fw.s1.member.MemberVO;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private CouponService couponService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;
	
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
	
	@PostMapping("setCouponsp")
	public void setCouponsp(CouponspVO couponspVO)throws Exception{
		
	}
	
	@GetMapping("transmitCoupon")
	public void transmitCoupon(Model model)throws Exception {
		model.addAttribute("cuspList", couponService.getCouponspList());
	}
	
	@GetMapping("selectedCoupon")
	public void selectedCoupon(CouponspVO couponspVO, Model model)throws Exception{
		model.addAttribute("item", couponService.getCouponsp(couponspVO));
	}
	
	@ResponseBody
	@GetMapping("couponforall")
	public Long couponforall(Long cuSpNum, Integer period)throws Exception{
		List<MemberVO> list = memberService.getAllusername();
		Calendar calendar = Calendar.getInstance();
		java.sql.Date date1 = new java.sql.Date(calendar.getTimeInMillis());
		calendar.add(Calendar.MONTH, period);
		java.sql.Date date2 = new java.sql.Date(calendar.getTimeInMillis());
		if(date1.after(date2)||date1.equals(date2)) {
			return 0L;
		}
		List<CouponVO> list2 = new ArrayList<>();
		for(MemberVO memberVO : list) {
			CouponVO couponVO = new CouponVO();
			couponVO.setUsername(memberVO.getUsername());
			couponVO.setCuSpNum(cuSpNum);
			couponVO.setPubDate(date1);
			couponVO.setExDate(date2);
			list2.add(couponVO);
		}
		return couponService.couponForAll(list2);
	}
	
	@ResponseBody
	@PostMapping("couponServeral")
	public Long couponServeral(String[] usernames, Long cuSpNum, Integer period)throws Exception{
		List<CouponVO> list = new ArrayList<>();
		Calendar calendar = Calendar.getInstance();
		java.sql.Date date1 = new java.sql.Date(calendar.getTimeInMillis());
		calendar.add(Calendar.MONTH, period);
		java.sql.Date date2 = new java.sql.Date(calendar.getTimeInMillis());
		if(date1.after(date2)||date1.equals(date2)) {
			return 0L;
		}
		for(String username : usernames) {
			CouponVO couponVO = new CouponVO();
			couponVO.setUsername(username);
			couponVO.setCuSpNum(cuSpNum);
			couponVO.setPubDate(date1);
			couponVO.setExDate(date2);
			list.add(couponVO);
		}
		return couponService.couponForAll(list);
	}
	
	@GetMapping("saleDay")
	public void saleDay(Model model)throws Exception{
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -1);
		java.sql.Date date = new java.sql.Date(calendar.getTimeInMillis());
		model.addAttribute("lastDay", date.toString());
	}
	
	//일단 최근 데이터만 가져오는걸로 하고 다른 날짜를 선택한다면 해당 날짜로 선택이 되게 하면 될 것이다.
	@GetMapping("getSaleDay")
	@ResponseBody
	public String[] getSaleDay(String date)throws Exception{
		if(date=="") {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, -1);
			java.sql.Date date2 = new java.sql.Date(calendar.getTimeInMillis());
			date = date2.toString();
		}
		List<AdminVO> list = adminService.saleDay(date);
		Gson gson = new Gson();
		int length = list.size();
		String[] result = new String[length];
		for(int i = 0 ; i < length; i++) {
			result[i] = gson.toJson(list.get(i));
		}
		return result;
	}
}
