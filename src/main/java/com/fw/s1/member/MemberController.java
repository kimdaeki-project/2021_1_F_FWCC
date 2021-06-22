package com.fw.s1.member;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fw.s1.coupon.CouponService;
import com.fw.s1.coupon.CouponVO;
import com.fw.s1.mileage.MileageService;
import com.fw.s1.mileage.MileageVO;
import com.fw.s1.order.OrderService;
import com.fw.s1.order.OrderlistVO;
import com.fw.s1.product.ProductFileVO;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MileageService mileageService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private OrderService orderService;
	
// Member Login =========================================================================
	@GetMapping("memberLogin")
	public void getLogin() throws Exception {
		
	}
	
	@GetMapping("memberLoginSuccess")
	public ModelAndView loginSuccess(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		// 1. session의 속성명들 꺼내오기
		Enumeration<String> enumeration = session.getAttributeNames();
		
//		mv.addObject("msg", "로그인 성공");
//		mv.addObject("path", "/");
//		mv.setViewName("common/commonResult");
		mv.setViewName("index");
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
	public ModelAndView memberPage(Authentication authentication) throws Exception {
		ModelAndView mv = new ModelAndView();
		// 1. mileage 가져오기
		MileageVO mileageVO = new MileageVO();
		if(authentication != null) {			
			mileageVO.setUsername(authentication.getName());
			mileageVO = mileageService.getRecentMileage(mileageVO);
			// 2. coupon 개수 가져오기
			CouponVO couponVO = new CouponVO();
			couponVO.setUsername(authentication.getName());
			long couponCount = couponService.getMemberCouponCount(couponVO);
			
			mv.addObject("mileage", mileageVO.getEnabledMile());
			mv.addObject("couponCount", couponCount);
			mv.setViewName("member/memberPage");
		} else {
			mv.addObject("msg", "로그인이 필요합니다.");
			mv.addObject("path", "/");
			mv.setViewName("common/commonResult");
		}
		
		return mv;
	}
	
// orderList =============================================
	@GetMapping("memberPage/orderList")
	public ModelAndView getOrderList(Authentication authentication) throws Exception {
		ModelAndView mv = new ModelAndView();
		OrderlistVO orderlistVO = new OrderlistVO();
		orderlistVO.setUsername(authentication.getName());
		List<ProductFileVO> ar = orderService.getOrderList(orderlistVO);
		mv.addObject("list", ar);
		mv.setViewName("member/memberPage/orderList");
		return mv;
	}
	
	@GetMapping("memberPage/filteredList")
	public ModelAndView getFilteredList(OrderlistVO orderlistVO, Authentication authentication) throws Exception {
		System.out.println("=== 검색 컨트롤러 ===");
		ModelAndView mv = new ModelAndView();
		orderlistVO.setUsername(authentication.getName());
		System.out.println("===========================================================");
		System.out.println(orderlistVO.getStartDate());
		System.out.println(orderlistVO.getEndDate());
		System.out.println("===========================================================");
		List<ProductFileVO> ar = orderService.getOrderList(orderlistVO);
		mv.addObject("list", ar);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
}
