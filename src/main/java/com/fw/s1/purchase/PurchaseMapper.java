package com.fw.s1.purchase;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.order.OrderlistVO;

@Mapper
public interface PurchaseMapper {

	//그날 주문 결과 가지고 온다.
	public List<PurchaseVO> getTodayPurchase(Date date)throws Exception;
	//주문 후 해당 구매한 상품 내역들 입력
	public Long setOrderPurchase(List<PurchaseVO> list)throws Exception;
	//admin에서 취소된 주문만큼 항목을 제거하기 위한 get
	public List<PurchaseVO> getPurAdmin(OrderlistVO orderlistVO)throws Exception;
}
