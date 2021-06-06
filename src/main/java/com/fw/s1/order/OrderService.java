package com.fw.s1.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
