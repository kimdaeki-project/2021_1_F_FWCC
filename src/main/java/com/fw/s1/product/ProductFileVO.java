package com.fw.s1.product;

import com.fw.s1.order.OrderlistVO;
import com.fw.s1.purchase.PurchaseVO;

import lombok.Data;

@Data
public class ProductFileVO {

	private Long fileNum;
	private Long productNum;
	private String fileName;
	private String oriName;
	
	private ProductVO productVO;
	private PurchaseVO purchaseVO;
	private OrderlistVO orderlistVO;
	
}
