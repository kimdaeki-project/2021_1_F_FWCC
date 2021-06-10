package com.fw.s1.admin;

import java.sql.Date;

import com.fw.s1.product.ProductVO;

import lombok.Data;

@Data
public class AdminVO {

	private Long adminIdx;
	private Date adminDate;
	private Long productNum;
	private Long sellCount;
	private String productType;
	private String collab;
	
	private ProductVO productVO;
}
