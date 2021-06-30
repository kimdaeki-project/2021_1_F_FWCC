package com.fw.s1.mileage;

import com.fw.s1.order.OrderlistVO;

import lombok.Data;

@Data
public class MileageVO {

	private Long mileNum;
	private Long usedMile;
	private Long changeMile;
	private String username;
	private String orderNum;
	private String mileContents;
	private Long enabledMile;
	
	private OrderlistVO orderlistVO;
}
