package com.fw.s1.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.product.ProductFileVO;

@Mapper
public interface OrderMapper {

	//주문 완료 후 주문내역을 저장하는 메서드
	public Long setOrder(OrderlistVO orderlistVO)throws Exception;
	//주문 완료 후 혹은 조회시 해당 주문번호를 가져오는 메서드
	public OrderlistVO getOrder(OrderlistVO orderlistVO)throws Exception;
	
	// member orderList 조회
	public List<ProductFileVO> getOrderList(OrderlistVO orderlistVO) throws Exception;
	
}
