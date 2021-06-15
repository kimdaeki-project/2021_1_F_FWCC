package com.fw.s1.product;

import java.util.List;

import lombok.Data;

@Data
public class ProductVO {

	private Long productNum;
	private String productTitle;
	private Long productPrice;
	private Long productDisRate;
	private String summary;
	private String productContents;
	private Long productDivNum;
	private Long finalPrice;
	private Long productMileage;
	
	private String collab;
	private String productType;

	private Boolean productSaleable;
	
	private ProductDivisionVO productDivisionVO;
//	private List<ProductFileVO> files;
//	private List<ProductInfoVO> infos;
	
}
