package com.fw.s1.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.purchase.PurchaseVO;

@Mapper
public interface AdminMapper {

	//이전 날짜에 팔린 내역을 저장한다.
	public Long insertAdmin(List<AdminVO> list)throws Exception;
	//해당 날짜에 팔린 내역을 가져온다.
	public List<AdminVO> saleDay(String date)throws Exception;
	//해당 선택된 날짜들의 내역을 가져온다.
	public List<AdminVO> saleDays(HashMap<String, String> hashMap)throws Exception;
	//해당 달에 팔린 내역을 가져온다.
	public List<AdminVO> saleMonth(String date)throws Exception;
	//주문을 취소했을 경우 해당 내역을 admin테이블에서 제거
	public Long cancledOrder(List<PurchaseVO> list)throws Exception;
	//취소한 내역을 복구할 경우 해당 내역을 admin테이블에 추가
	public Long reCancledOrder(List<PurchaseVO> list)throws Exception;
}
