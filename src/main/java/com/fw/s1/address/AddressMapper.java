package com.fw.s1.address;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.member.MemberVO;

@Mapper
public interface AddressMapper {

	//주소목록 불러오기
	public List<AddressVO> getAddressList(MemberVO memberVO)throws Exception;
}
