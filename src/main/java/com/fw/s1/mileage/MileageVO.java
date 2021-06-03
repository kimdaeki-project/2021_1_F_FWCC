package com.fw.s1.mileage;

import lombok.Data;

@Data
public class MileageVO {

	private Long mileNum;
	private Long usedMile;
	private Long changedMile;
	private String username;
	private String orderNum;
	private String mileContents;
	private Long enabledMile;
}
