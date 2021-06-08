package com.fw.s1.coupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.member.MemberVO;

@Mapper
public interface CouponMapper {

	//해당 유저가 가지고 있는 쿠폰들을 가져온다.
	public List<CouponVO> getCouponList(MemberVO memberVO)throws Exception;
	//관리자 페이지에서 조회할 모든 쿠폰 종류 리스트를 가져온다.
	public List<CouponspVO> getCouponspList()throws Exception;
	//결제할 때 쿠폰을 사용했을 경우 해당 쿠폰의 사용여부를 업데이트 한다.
	public Long useUpdate(CouponVO couponVO)throws Exception;
}
