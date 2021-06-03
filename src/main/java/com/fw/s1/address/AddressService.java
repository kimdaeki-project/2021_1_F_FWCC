package com.fw.s1.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fw.s1.member.MemberVO;

@Service
public class AddressService {

	@Autowired
	private AddressMapper addressMapper;
	
	public List<AddressVO> getAddressList(MemberVO memberVO)throws Exception{
		return addressMapper.getAddressList(memberVO);
	}
}
