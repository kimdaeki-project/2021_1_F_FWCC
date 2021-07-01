package com.fw.s1.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	public MemberVO getLogin(MemberVO memberVO) throws Exception;
	
	public MemberVO getMember(MemberVO memberVO) throws Exception;
	
	public int setJoin(MemberVO memberVO) throws Exception;
	
	public int setMemberRole(Map<String, String> map) throws Exception;
	
	public MemberVO getUsernameCheck(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberProfile(MemberVO memberVO) throws Exception;
	
	public Long setMemberUpdate(MemberVO memberVO) throws Exception;
	
	//결제폼에서 유저 정보를 일부 가져오기 위함
	public MemberVO getUsernameandemail(MemberVO memberVO)throws Exception;
}
