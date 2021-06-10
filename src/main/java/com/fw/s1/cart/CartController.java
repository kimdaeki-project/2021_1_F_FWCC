package com.fw.s1.cart;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@PostMapping("deleteItems")
	public Long deleteItem(@RequestParam(value="cartNums") ArrayList<Long> cartNums ,Authentication authentication)throws Exception{
		int length = cartNums.size();
		List<CartVO> carts = new ArrayList<CartVO>();
		for(int i = 0 ; i < length; i++) {
			CartVO cartVO = new CartVO();
			cartVO.setCartNum(cartNums.get(i));
			cartVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
			carts.add(cartVO);
		}
		return cartService.deleteItem(carts);
	}
	
	@GetMapping("updateCount")
	public Long updateCount(CartVO cartVO, Authentication authentication)throws Exception{
		cartVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		if(cartVO.getProductCount()>cartService.getStock(cartVO)) {
			return 0L;
		}else if(cartVO.getProductCount()<1) {
			return 0L;
		}
		return cartService.updateCount(cartVO);
	}
	
	@GetMapping("setCart")
	public Long setCart(CartVO cartVO, Authentication authentication)throws Exception{
		cartVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		return cartService.setCart(cartVO);
	}
}
