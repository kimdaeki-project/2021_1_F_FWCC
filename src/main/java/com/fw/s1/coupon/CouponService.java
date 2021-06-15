package com.fw.s1.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fw.s1.member.MemberVO;

@Service
public class CouponService {

	@Autowired
	private CouponMapper couponMapper;
	
	public List<CouponVO> getCouponList(MemberVO memberVO)throws Exception{
		return couponMapper.getCouponList(memberVO);
	}
	
	public List<CouponspVO> getCouponspList()throws Exception{
		return couponMapper.getCouponspList();
	}
	
	public Long useUpdate(CouponVO couponVO)throws Exception{
		return couponMapper.useUpdate(couponVO);
	}
	
	// Member 쿠폰 개수
	public Long getMemberCouponCount(CouponVO couponVO) throws Exception {
		return couponMapper.getMemberCouponCount(couponVO);
	}
}
