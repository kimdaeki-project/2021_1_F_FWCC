package com.fw.s1.address;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AddressMapper {

	public int setAddress(AddressVO addressVO) throws Exception;
	
}
