package com.fw.s1.mileage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.member.MemberVO;

@Mapper
public interface MileageMapper {

	//최근 마일리지 수정 내역으로 마일리지 조회할 수 있게 해당 내역을 가져온다.
	public MileageVO getRecentMileage(MileageVO mileageVO)throws Exception;
	//구매 후 마일리지 잃은 양과 얻은 량을 표기
	public Long setMileAfterOrder(List<MileageVO> list)throws Exception;
	//모든 사람들에게 마일리지 전송
	public Long mileageForAll(MileageVO mileageVO)throws Exception;
	//선택한 사람들에게 마일리지 전송
	public Long mileageForSelect(List<MileageVO> list)throws Exception;
	// 회원가입 후 마일리지 적립
	public Long setMileAfterJoin(MileageVO mileageVO) throws Exception;
	
	// member 마일리지 조회
	public List<MileageVO> getMemberMileage(MemberVO memberVO) throws Exception;
	
	// member 최근 마일리지 조회
	public MileageVO getRecentMemberMileage(MemberVO memberVO) throws Exception;
}
