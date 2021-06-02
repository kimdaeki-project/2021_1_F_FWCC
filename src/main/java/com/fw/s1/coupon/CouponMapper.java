package com.fw.s1.coupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.member.MemberVO;

@Mapper
public interface CouponMapper {

	//해당 유저가 가지고 있는 쿠폰들을 가져온다.
	public List<CouponVO> getCouponList(MemberVO memberVO)throws Exception;
}
