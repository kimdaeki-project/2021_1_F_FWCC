package com.fw.s1.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fw.s1.address.AddressService;
import com.fw.s1.address.AddressVO;
import com.fw.s1.cart.CartService;
import com.fw.s1.cart.CartVO;
import com.fw.s1.coupon.CouponService;
import com.fw.s1.coupon.CouponVO;
import com.fw.s1.member.MemberVO;
import com.fw.s1.product.ProductVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/order/**")
public class OrderController {

	@Autowired
	private CartService cartService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private CouponService couponService;
	
	
	private IamportClient api;
	
	public OrderController(){
		this.api = new IamportClient("imp_apikey", "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f");
	}
	
	//결제를 위한 메서드, 결제 검증을 위해 필요하다.
	@ResponseBody
	@PostMapping("vertify/{imp_uid}")
	public IamportResponse<Payment> getVertify(Model model, Locale locale, 
												HttpSession httpSession, @PathVariable(value="imp_uid")String imp_uid)
																		throws IamportResponseException, IOException {
		return api.paymentByImpUid(imp_uid);
	}
	
	//삭제 작업을 위한 메서드, 후반에 완성시키자.
	@ResponseBody
	@PostMapping("cancle/{merchant_uid}")
	public boolean testCancelPaymentAlreadyCancelledMerchantUid(@PathVariable(value="merchant_uid")String merchant_uid) {
		String test_already_cancelled_merchant_uid = merchant_uid;
		CancelData cancel_data = new CancelData(test_already_cancelled_merchant_uid, false); //merchant_uid를 통한 전액취소
		cancel_data.setEscrowConfirmed(true); //에스크로 구매확정 후 취소인 경우 true설정
		boolean check = true;
		try {
			IamportResponse<Payment> payment_response = api.cancelPaymentByImpUid(cancel_data);
			if(payment_response.getResponse()==null) {
				check=false;
			}
			//assertNull(payment_response.getResponse()); // 이미 취소된 거래는 response가 null이다
			System.out.println(payment_response.getMessage());
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :	//401은 Unauthorized일때 혹은 비교를 했을때 아이디가 다른 경우에 가능하게 할 수 있다.
				check=false;
				break;
			case 404:	//해당 merhcant_uid가 존재하지 않는다.
				check=false;
				break;
			case 500 :	//서버와 응답할 수 없는 경우
				check=false;
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			check=false;
			e.printStackTrace();
		}	
		return check;
	}
	
	@GetMapping("basket")
	public void getCartList(Authentication authentication, Model model) throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername("admin");
		//memberVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		List<CartVO> list = cartService.getCartList(memberVO);
		long cartCount = list.size();
		
		long totalprice = 0;
		for(CartVO cartVO : list) {
			totalprice+=cartVO.getProductCount()*cartVO.getProductVO().getProductPrice();
			ProductVO productVO = cartVO.getProductVO();
			if(productVO.getProductDisRate()>0) {
				long cal = (((100-productVO.getProductDisRate())*productVO.getProductPrice()/100)/100)*100;
				cartVO.setFinalPrice(cal*cartVO.getProductCount());
				totalprice -= (productVO.getProductPrice()-cal)*cartVO.getProductCount();
			}
		}
		
		model.addAttribute("cartCount", cartCount);
		model.addAttribute("items", list);
		model.addAttribute("totalprice", totalprice);
	}
	
	//쿠폰 사용작업 필요
	//주소 추가작업 필요
	@PostMapping("orderform")
	public void getPurchase(long[] cartNums, Authentication authentication, Model model)throws Exception {
		List<CartVO> list = new ArrayList<>();
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername("admin");
		//memberVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		
		for(long cartNum : cartNums) {
			CartVO cartVO = new CartVO();
			cartVO.setCartNum(cartNum);
			cartVO.setUsername("admin");
			//cartVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
			list.add(cartVO);
		}
		
		list = cartService.getCartSelectList(list);
		long orderCount = list.size();
		
		long totalprice=0;
		long totalMileage=0;
		for(CartVO cartVO : list) {
			totalprice+=cartVO.getProductCount()*cartVO.getProductVO().getProductPrice();
			ProductVO productVO = cartVO.getProductVO();
			if(productVO.getProductDisRate()>0) {
				long cal = (((100-productVO.getProductDisRate())*productVO.getProductPrice()/100)/100)*100;
				cartVO.setFinalPrice(cal*cartVO.getProductCount());
				totalprice -= (productVO.getProductPrice()-cal)*cartVO.getProductCount();
			}
			totalMileage += productVO.getProductMileage();
		}
		
		List<AddressVO> addresslist = addressService.getAddressList(memberVO);
		List<AddressVO> addrList = new ArrayList<>();
		AddressVO orderAddr = new AddressVO();
		AddressVO recentAddr = new AddressVO();
		
		for(AddressVO addressVO : addresslist) {
			if(addressVO.getOrderAddr()) {
				orderAddr = addressVO;
			}else if(addressVO.getRecentUse()){
				recentAddr = addressVO;
				addrList.add(recentAddr);
			}else {
				addrList.add(addressVO);
			}
		}
		
		List<CouponVO> cuList = couponService.getCouponList(memberVO);

		orderAddr.phoneSeperator();
		model.addAttribute("recentAddr", recentAddr);
		model.addAttribute("orderAddr", orderAddr);
		model.addAttribute("orderDetail");
		model.addAttribute("addressList", addrList);
		model.addAttribute("totalMileage", totalMileage);
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("items", list);
		model.addAttribute("totalprice", totalprice);
	}
}
