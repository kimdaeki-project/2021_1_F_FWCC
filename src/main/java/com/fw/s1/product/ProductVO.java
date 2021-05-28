package com.fw.s1.product;

import lombok.Data;

@Data
public class ProductVO {
	
	private Long productNum;
	private String productTitle;
	private Integer productPrice;
	private Integer productDisRate;
	private String productContents;
	private String collab;
	private String productType;
}
