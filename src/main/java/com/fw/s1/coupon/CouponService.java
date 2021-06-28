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
	
	public CouponspVO getCouponsp(CouponspVO couponspVO)throws Exception{
		return couponMapper.getCouponsp(couponspVO);
	}
	
	public Long useUpdate(CouponVO couponVO)throws Exception{
		return couponMapper.useUpdate(couponVO);
	}
	
	public Long couponForAll(CouponVO couponVO)throws Exception{
		return couponMapper.couponForAll(couponVO);
	}
	
	public Long couponForSelected(List<CouponVO> list)throws Exception{
		return couponMapper.couponForSelected(list);
	}
	// Member 쿠폰 개수
	public Long getMemberCouponCount(MemberVO memberVO) throws Exception {
		return couponMapper.getMemberCouponCount(memberVO);
	}
}
