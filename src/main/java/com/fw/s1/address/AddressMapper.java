package com.fw.s1.address;

import org.apache.ibatis.annotations.Mapper;
	
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.member.MemberVO;

@Mapper
public interface AddressMapper {
	
	//회원가입 시 주소 insert
	public int setJoinAddress(AddressVO addressVO) throws Exception;
	//회원정보 조회 시 주소 select
	public AddressVO getProfileAddress(MemberVO memberVO) throws Exception;
	//회원정보 수정 시 주소 update
	public Long setProfileAddressUpdate(MemberVO memberVO) throws Exception;
	//memberPage 주소록 관리 list select
	public List<AddressVO> getMemberAddress(MemberVO memberVO) throws Exception;
	//memberPage 주소 추가
	public Long setMemberAddress(AddressVO addressVO) throws Exception;
	//memberPage 주소 업데이트
	public Long updateMemberAddress(AddressVO addressVO) throws Exception;

	//주소목록 불러오기
	public List<AddressVO> getAddressList(MemberVO memberVO)throws Exception;
	//주소 하나 가져오기
	public AddressVO getSelectOne(AddressVO addressVO)throws Exception;
	//최근 사용된 주소 가져오기
	public AddressVO getSelectRecent(AddressVO addressVO)throws Exception;
	//주소 개수 구하기
	public Long checkCount(AddressVO addressVO)throws Exception;
	//주소목록 일부 삭제
	public Long deleteSelect(List<AddressVO> addressVOs)throws Exception;
	//insert update 전 작업
	public Long beforeAddress(AddressVO addressVO)throws Exception;
	//update 작업
	public Long updateAddress(AddressVO addressVO)throws Exception;
	//insert 작업
	public Long setAddress(AddressVO addressVO)throws Exception;

}
