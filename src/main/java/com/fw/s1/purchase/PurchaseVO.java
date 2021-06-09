package com.fw.s1.purchase;

import com.fw.s1.product.ProductVO;

import lombok.Data;

@Data
public class PurchaseVO {

	private Long purNum;
	private Long productNum;
	private Long pInfoNum;
	private String orderNum;
	private Long productCount;
	private Long proPriceSum;
	
	private ProductVO productVO;
}
