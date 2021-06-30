package com.fw.s1.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.product.ProductFileVO;
import com.fw.s1.util.MemberPager;

@Mapper
public interface OrderMapper {

	//주문 완료 후 주문내역을 저장하는 메서드
	public Long setOrder(OrderlistVO orderlistVO)throws Exception;
	//주문 완료 후 혹은 조회시 해당 주문번호를 가져오는 메서드
	public OrderlistVO getOrder(OrderlistVO orderlistVO)throws Exception;
	//주문 상태 변화를 위해서 해당 상태를 가져오는 메서드
	public List<OrderlistVO> orderStateChange(OrderlistVO orderlistVO)throws Exception;
	//해당 번호의 주문번호만 선택해서 확인
	public OrderlistVO selectedOrder(OrderlistVO orderlistVO)throws Exception;
	//해당 ordernum이 접속한 username을 가지고 있는지 확인
	public OrderlistVO checkOrder(OrderlistVO orderlistVO)throws Exception;
	//해당 번호의 주문번호로 검색한 항목 state update
	public Long orderlistUpdate(OrderlistVO orderlistVO)throws Exception;
	//선택된 항목들의 주문번호로 state update
	public Long orderlistsUpdate(List<OrderlistVO> list)throws Exception;
	
	
	// member orderList 조회
	public List<ProductFileVO> getOrderList(MemberPager memberPager) throws Exception;
	
	// member orderList filter 조회
	public List<ProductFileVO> getFilteredList(OrderlistVO orderlistVO) throws Exception;
}
