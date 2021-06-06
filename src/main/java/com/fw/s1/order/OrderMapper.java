package com.fw.s1.order;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {

	//주문 완료 후 주문내역을 저장하는 mapper
	public Long setOrder(OrderlistVO orderlistVO)throws Exception;
}
