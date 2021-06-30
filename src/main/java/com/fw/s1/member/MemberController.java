package com.fw.s1.member;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fw.s1.address.AddressVO;
import com.fw.s1.board.qna.QnaVO;
import com.fw.s1.coupon.CouponService;
import com.fw.s1.coupon.CouponVO;
import com.fw.s1.mileage.MileageService;
import com.fw.s1.mileage.MileageVO;
import com.fw.s1.order.OrderService;
import com.fw.s1.order.OrderlistVO;
import com.fw.s1.product.ProductFileVO;
import com.fw.s1.util.MemberPager;
import com.fw.s1.util.Pager;

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
			MemberVO memberVO = new MemberVO();
			memberVO.setUsername(authentication.getName());
			long couponCount = couponService.getMemberCouponCount(memberVO);
			
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
	public ModelAndView getOrderList(Authentication authentication, MemberPager memberPager) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberPager.setUsername(authentication.getName());
		List<ProductFileVO> ar = orderService.getOrderList(memberPager);
		mv.addObject("list", ar);
		mv.setViewName("member/memberPage/orderList");
		return mv;
	}
	
	@GetMapping("memberPage/filteredList")
	public ModelAndView getFilteredList(OrderlistVO orderlistVO, Authentication authentication) throws Exception {
		System.out.println("=== 검색 컨트롤러 ===");
		ModelAndView mv = new ModelAndView();
		orderlistVO.setUsername(authentication.getName());
		List<ProductFileVO> ar = orderService.getFilteredList(orderlistVO);
		mv.addObject("list", ar);
		mv.setViewName("member/memberPage/orderList");
		return mv;
	}

// profile ===============================================
	@GetMapping("memberPage/memberProfile")
	public ModelAndView getMemberProfile(Authentication authentication) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(authentication.getName());
		memberVO = memberService.getMemberProfile(memberVO);
		AddressVO addressVO = memberService.getProfileAddress(memberVO);
		mv.addObject("VO", memberVO);
		mv.addObject("addressVO", addressVO);
		mv.setViewName("member/memberPage/memberProfile");
		return mv;
	}
	
	@PostMapping("memberPage/pwCheck")
	public ModelAndView getPwCheck(MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		boolean result = memberService.getPwCheck(memberVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("memberPage/memberUpdate")
	public ModelAndView setMemberUpdate(MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		long result = 0L;
		result = memberService.setMemberUpdate(memberVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
// mileage ===============================================
	@GetMapping("memberPage/memberMileage")
	public ModelAndView getMemberMileage(Authentication authentication) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(authentication.getName());
		List<MileageVO> ar = memberService.getMemberMileage(memberVO);
		for(MileageVO VO:ar) {
			System.out.println(VO);
		}
		MileageVO mileageVO = memberService.getRecentMemberMileage(memberVO);
		mv.addObject("list", ar);
		mv.addObject("mileageVO", mileageVO);
		mv.setViewName("member/memberPage/memberMileage");
		return mv;
	}
	
// coupon ===============================================
	@GetMapping("memberPage/memberCoupon")
	public ModelAndView getMemberCoupon(Authentication authentication) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(authentication.getName());
		List<CouponVO> ar = couponService.getCouponList(memberVO);
		
		long couponCount = couponService.getMemberCouponCount(memberVO);
		mv.addObject("list", ar);
		mv.addObject("couponCount", couponCount);
		mv.setViewName("member/memberPage/memberCoupon");
		return mv;
	}
	
// board ===============================================
	@GetMapping("memberPage/memberBoard")
	public ModelAndView getMemberBoard(Authentication authentication) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(authentication.getName());
		List<QnaVO> ar = memberService.getMemberBoardList(memberVO);
		mv.addObject("list", ar);
		mv.setViewName("member/memberPage/memberBoard");
		return mv;
	}
	
// address ===============================================
	@GetMapping("memberPage/memberAddress")
	public ModelAndView getMemberAddress(Authentication authentication) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(authentication.getName());
		List<AddressVO> ar = memberService.getMemberAddress(memberVO);
		mv.addObject("list", ar);
		mv.setViewName("member/memberPage/memberAddress");
		return mv;
	}
	
	@GetMapping("memberPage/addressInsert")
	public ModelAndView setAddress() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberPage/addressInsert");
		return mv;
	}
	
	@PostMapping("memberPage/addressInsert")
	public ModelAndView setAddress(AddressVO addressVO, Authentication authentication) throws Exception {
		ModelAndView mv = new ModelAndView();
		addressVO.setUsername(authentication.getName());
		long result = memberService.setMemberAddress(addressVO);
		String msg = "등록 실패";
		String path = "/member/memberPage/addressInsert";
		if(result >0) {
			msg = "등록 성공";
			path = "/member/memberPage/memberAddress";
		}
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/commonResult");
		return mv;
	}
	
	@GetMapping("memberPage/addressModify")
	public ModelAndView modifyAddress(Authentication authentication, Long addrNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		AddressVO addressVO = new AddressVO();
		addressVO.setUsername(authentication.getName());
		addressVO.setAddrNum(addrNum);
		addressVO = memberService.getAddressSelectOne(addressVO);
		mv.addObject("VO", addressVO);
		mv.setViewName("member/memberPage/addressModify");
		return mv;
	}
	
	@PostMapping("memberPage/addressModify")
	public ModelAndView modifyAddress(Authentication authentication, AddressVO addressVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		addressVO.setUsername(authentication.getName());
		long result = memberService.updateMemberAddress(addressVO);
		String msg = "수정 실패";
		String path = "/member/memberPage/addressModify";
		if(result >0) {
			msg = "수정 성공";
			path = "/member/memberPage/memberAddress";
		}
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/commonResult");
		return mv;
	}
	
	@PostMapping("memberPage/addressDelete")
	public ModelAndView deleteAddress(long[] ar, Authentication authentication) throws Exception {
		ModelAndView mv = new ModelAndView();
		long result = 0L;
		for(long addrNum:ar) {
			AddressVO addressVO = new AddressVO();
			addressVO.setUsername(authentication.getName());
			addressVO.setAddrNum(addrNum);			
			result = memberService.deleteMemberAddress(addressVO);
		}
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	
}
