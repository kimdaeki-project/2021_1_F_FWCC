package com.fw.s1.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	public MemberVO getUsernameCheck(MemberVO memberVO) throws Exception;
	
}
