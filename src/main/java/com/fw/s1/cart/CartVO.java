package com.fw.s1.cart;

import com.fw.s1.product.ProductFileVO;
import com.fw.s1.product.ProductInfoVO;
import com.fw.s1.product.ProductVO;

import lombok.Data;

@Data
public class CartVO {

	private Long cartNum;
	private Long productNum;
	private Long pInfoNum;
	private Long productCount;
	private String username;
	
	private Long finalPrice;
	
	private ProductVO productVO;
	private ProductInfoVO productInfoVO;
	private ProductFileVO productFileVO;
}