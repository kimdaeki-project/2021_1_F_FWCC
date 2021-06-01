package com.fw.s1.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fw.s1.member.MemberVO;

@RestController
@RequestMapping("/cart/**")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@GetMapping("counting")
	public Long getCartCount(Authentication authentication)throws Exception{
		if(authentication==null) {
			return 0L;
		}
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		Long result = cartService.getCartCount(memberVO);
		return result;
	}

	@GetMapping("deleteCart")
	public Long deleteCart(Authentication authentication)throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		return cartService.deleteCart(memberVO);
	}
	
}
