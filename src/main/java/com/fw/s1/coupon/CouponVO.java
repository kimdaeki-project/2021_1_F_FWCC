package com.fw.s1.coupon;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponVO {

	private Long cuNum;
	private String username;
	private Long cuSpNum;
	private Date pubDate;
	private Date exDate;
}
