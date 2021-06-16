package com.fw.s1.order;

import java.sql.Date;

import com.fw.s1.mileage.MileageVO;
import com.fw.s1.product.ProductFileVO;
import com.fw.s1.product.ProductVO;

import lombok.Data;

@Data
public class OrderlistVO {

	private String orderNum;
	private Long totPrice;
	private Long spPrice;
	private Long cuNum;
	private String username;
	private String destination;
	private Date orderDate;
	private Long orderState;
	private String orderMessage;
	private String orderName;
	
	private String startDate;
	private String endDate;
	
	private ProductVO[] productVOs;
	private ProductFileVO[] productFileVOs;
	
	private MileageVO mileageVO;
}