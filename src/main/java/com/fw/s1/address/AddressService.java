package com.fw.s1.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddressService {

	@Autowired
	private AddressMapper addressMapper;
	
	public int setAddress(AddressVO addressVO) throws Exception {
		return addressMapper.setAddress(addressVO);
	}
	
}
