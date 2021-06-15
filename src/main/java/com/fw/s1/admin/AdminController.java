package com.fw.s1.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
import com.fw.s1.mileage.MileageService;
import com.fw.s1.mileage.MileageVO;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private CouponService couponService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private MileageService mileageService;
	
	@ModelAttribute("date")
	public String adminAll() {
		Date nowTime = Calendar.getInstance().getTime();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
		return sf.format(nowTime);
	}
	
	//admin main페이지로 이동
	@GetMapping("adminHome")
	public void adminHome() { }
	
	//쿠폰 종류를 입력하는 페이지로 이동
	@GetMapping("setCouponsp")
	public void setCouponsp()throws Exception {	}
	
	//쿠폰 종류 입력후 저장을 위함
	@PostMapping("setCouponsp")
	public void setCouponsp(CouponspVO couponspVO)throws Exception{
		
	}
	
	//쿠폰 목록을 보여주는 페이지
	@GetMapping("transmitCoupon")
	public void transmitCoupon(Model model)throws Exception {
		model.addAttribute("cuspList", couponService.getCouponspList());
	}
	
	//선택한 쿠폰을 보낼 페이지로 이동
	@GetMapping("selectedCoupon")
	public void selectedCoupon(CouponspVO couponspVO, Model model)throws Exception{
		model.addAttribute("item", couponService.getCouponsp(couponspVO));
	}
	
	//쿠폰을 모든 사람들에게 전송
	@ResponseBody
	@GetMapping("couponforall")
	public Long couponforall(Long cuSpNum, Integer period)throws Exception{
		Calendar calendar = Calendar.getInstance();
		java.sql.Date date1 = new java.sql.Date(calendar.getTimeInMillis());
		calendar.add(Calendar.MONTH, period);
		java.sql.Date date2 = new java.sql.Date(calendar.getTimeInMillis());
		if(date1.after(date2)||date1.equals(date2)) {
			return 0L;
		}
		CouponVO couponVO = new CouponVO();
		couponVO.setCuSpNum(cuSpNum);
		couponVO.setPubDate(date1);
		couponVO.setExDate(date2);

		return couponService.couponForAll(couponVO);
	}
	
	//쿠폰을 입력한 username들에게 보냄
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
		return couponService.couponForSelected(list);
	}
	
	//마일리지 전송하는 페이지
	@GetMapping("transmitMile")
	public void transmitMile() { }
	
	//모든 사람들에게 마일리지를 전송
	@ResponseBody
	@GetMapping("transAllMile")
	public Long transAllMile(Long mileage, String contents)throws Exception {
		MileageVO mileageVO = new MileageVO();
		mileageVO.setChangeMile(mileage);
		mileageVO.setEnabledMile(mileage);
		mileageVO.setMileContents(contents);
		return mileageService.mileageForAll(mileageVO);
	}
	
	//입력한 사람들에게만 마일리지를 전송
	@ResponseBody
	@PostMapping("mileageForSelect")
	public Long mileageForSelect(Long mileage, String contents, String[] usernames)throws Exception{
		List<MileageVO> list = new ArrayList<>();
		for(String temp : usernames) {
			MileageVO mileageVO = new MileageVO();
			mileageVO.setUsername(temp);
			mileageVO.setChangeMile(mileage);
			mileageVO.setEnabledMile(mileage);
			mileageVO.setMileContents(contents);
			list.add(mileageVO);
		}
		return mileageService.mileageForSelect(list);
	}
	
	//하루 일치의 판매량을 집계하여 보여주는 페이지
	@GetMapping("saleDay")
	public void saleDay(Model model)throws Exception{
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -1);
		java.sql.Date date = new java.sql.Date(calendar.getTimeInMillis());
		model.addAttribute("lastDay", date.toString());
	}
	
	//하루 일치의 판매량을 집계하여 보여주는 페이지의 일자를 변경하였을 때 해당 결과를 보내주는 페이지
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
	
	//일주일치의 판매량을 집계하여 보여주는 페이지
	@GetMapping("saleWeek")
	public void saleWeek(Model model)throws Exception{
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -1);
		java.sql.Date date = new java.sql.Date(calendar.getTimeInMillis());
		model.addAttribute("lastDay", date.toString());
	}
	
	//일주일치의 판매량을 집계하여 보여주는 페이지의 일자를 변경하였을 때 해당 결과를 보내주는 페이지
	@GetMapping("getSaleWeek")
	@ResponseBody
	public String[] getSaleWeek(String date)throws Exception{
		String date2 = "";
		if(date=="") {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, -1);
			java.sql.Date tempdate = new java.sql.Date(calendar.getTimeInMillis());
			date = tempdate.toString();
			calendar.add(Calendar.DATE, -6);
			tempdate = new java.sql.Date(calendar.getTimeInMillis());
			date2 = tempdate.toString();
		}else {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(simpleDateFormat.parse(date).getTime());
			calendar.add(Calendar.DATE, -6);
			java.sql.Date tempdate = new java.sql.Date(calendar.getTimeInMillis());
			date2 = tempdate.toString();
		}
		HashMap<String, String> hm = new HashMap<>();
		hm.put("start", date2);
		hm.put("end", date);
		List<AdminVO> list = adminService.saleDays(hm);
		Gson gson = new Gson();
		int length = list.size();
		String[] result = new String[length];
		for(int i = 0 ; i < length; i++) {
			list.get(i).setParseDate(list.get(i).getAdminDate().toString());
			result[i] = gson.toJson(list.get(i));
		}
		return result;
	}
		
	//한달치의 판매량을 집계하여 보여주는 페이지
	@GetMapping("saleMonth")
	public void saleMonth(Model model)throws Exception{
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -1);
		java.sql.Date date = new java.sql.Date(calendar.getTimeInMillis());
		String result = date.toString().replaceAll("\\-[0-9]+$", "");
		model.addAttribute("lastMonth",result);
	}
	
	//한달치의 판매량을 집계하여 보여주는 페이지의 일자를 변경하였을 때 해당 결과를 보내주는 페이지
	@GetMapping("getSaleMonth")
	@ResponseBody
	public String[] getSaleMonth(String date)throws Exception{
		if(date=="") {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, -1);
			java.sql.Date date2 = new java.sql.Date(calendar.getTimeInMillis());
			date = date2.toString().replaceAll("\\-[0-9]+$", "");
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
