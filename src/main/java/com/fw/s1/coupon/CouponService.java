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
}
