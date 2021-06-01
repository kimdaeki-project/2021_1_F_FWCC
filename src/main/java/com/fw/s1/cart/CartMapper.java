package com.fw.s1.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.member.MemberVO;

@Mapper
public interface CartMapper {

	//카트에 담겨져 있는 항목들의 내용들 가져오기
	public List<CartVO> getCartList(MemberVO memberVO)throws Exception;
	//카트에 담겨있는 내용의 개수 가져오기
	public Long getCartCount(MemberVO memberVO)throws Exception;
	//카트에 품목 넣기
	public Long setCart(CartVO cartVO)throws Exception;
	//카트에 들어있는 항목의 개수 변경
	public Long updateCount(CartVO cartVO)throws Exception;
	//카트에 들어있는 항목 제거
	public Long deleteItem(List<CartVO> list)throws Exception;
	//카트에 있는 모든 항목 제거
	public Long deleteCart(MemberVO memberVO)throws Exception;
}
