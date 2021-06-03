package com.fw.s1.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	public MemberVO getUsernameCheck(MemberVO memberVO) throws Exception;
	
	//결제폼에서 유저 정보를 일부 가져오기 위함
	public MemberVO getUsernameandemail(MemberVO memberVO)throws Exception;
}
