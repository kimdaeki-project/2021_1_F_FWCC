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
	
	public AddressVO getSelectOne(AddressVO addressVO)throws Exception{
		return addressMapper.getSelectOne(addressVO);
	}
	
	public AddressVO getSelectRecent(AddressVO addressVO)throws Exception{
		return addressMapper.getSelectRecent(addressVO);
	}
	
	public Long checkCount(AddressVO addressVO)throws Exception{
		return addressMapper.checkCount(addressVO);
	}
	
	public Long deleteSelect(List<AddressVO> addressVOs)throws Exception{
		return addressMapper.deleteSelect(addressVOs);
	}
	
	public Long beforeAddreess(AddressVO addressVO)throws Exception{
		return addressMapper.beforeAddress(addressVO);
	}
	
	public Long updateAddress(AddressVO addressVO)throws Exception{
		return addressMapper.updateAddress(addressVO);
	}
	
	public Long setAddress(AddressVO addressVO)throws Exception{
		return addressMapper.setAddress(addressVO);
	}
}
