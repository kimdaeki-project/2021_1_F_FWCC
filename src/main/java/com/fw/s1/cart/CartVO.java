package com.fw.s1.cart;

import lombok.Data;

@Data
public class CartVO {

	private Long cartNum;
	private Long productNum;
	private Long pInfoNum;
	private Long productCount;
	private String username;
}