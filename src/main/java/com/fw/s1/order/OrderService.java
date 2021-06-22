package com.fw.s1.order;

import java.util.List;

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
	
	public List<OrderlistVO> orderStateChange(OrderlistVO orderlistVO)throws Exception{
		return orderMapper.orderStateChange(orderlistVO);
	}
	
	public OrderlistVO selectedOrder(OrderlistVO orderlistVO)throws Exception{
		return orderMapper.selectedOrder(orderlistVO);
	}
	
	public Long orderlistUpdate(OrderlistVO orderlistVO)throws Exception{
		return orderMapper.orderlistUpdate(orderlistVO);
	}
	
	public Long orderlistsUpdate(List<OrderlistVO> list)throws Exception{
		return orderMapper.orderlistsUpdate(list);
	}
}
