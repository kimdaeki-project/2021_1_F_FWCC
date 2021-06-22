package com.fw.s1.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.fw.s1.product.ProductFileVO;

@Service
public class OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	public Long setOrder(OrderlistVO orderlistVO)throws Exception{
		return orderMapper.setOrder(orderlistVO);
	}
	
	public OrderlistVO getOrder(OrderlistVO orderlistVO)throws Exception{
		return orderMapper.getOrder(orderlistVO);
	}
	
	// member orderList 조회
	public List<ProductFileVO> getOrderList(OrderlistVO orderlistVO) throws Exception {
		return orderMapper.getOrderList(orderlistVO);
	}
	
}
