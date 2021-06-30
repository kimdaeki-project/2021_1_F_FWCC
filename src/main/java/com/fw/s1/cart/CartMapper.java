package com.fw.s1.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.member.MemberVO;

@Mapper
public interface CartMapper {

	//카트에 담겨져 있는 항목들의 내용들 가져오기
	public List<CartVO> getCartList(MemberVO memberVO)throws Exception;
	//카트에서 일정 항목만 가지고 오기
	public List<CartVO> getCartSelectList(List<CartVO> list)throws Exception;
	//카트에 담겨있는 내용의 개수 가져오기
	public Long getCartCount(MemberVO memberVO)throws Exception;
	//해당 품목의 남은 개수
	public Long getStock(CartVO cartVO)throws Exception;
	//카트에 품목 넣기
	public Long setCart(CartVO cartVO)throws Exception;
	//카트에 여러 품목 넣기
	public Long setCartList(List<CartVO> list)throws Exception;
	//카트에 들어있는 항목의 개수 변경
	public Long updateCount(CartVO cartVO)throws Exception;
	//재고보다 더 많았던 카트의 항목들 수정
	public Long updateCountList(List<CartVO> list)throws Exception;
	//카트에 들어있는 항목 제거
	public Long deleteItem(List<CartVO> list)throws Exception;
	//카트에 있는 모든 항목 제거
	public Long deleteCart(MemberVO memberVO)throws Exception;
}
