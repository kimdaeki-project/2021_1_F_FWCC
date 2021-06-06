package com.fw.s1.mileage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MileageMapper {

	//최근 마일리지 수정 내역으로 마일리지 조회할 수 있게 해당 내역을 가져온다.
	public MileageVO getRecentMileage(MileageVO mileageVO)throws Exception;
	//구매 후 마일리지 잃은 양과 얻은 량을 표기
	public Long setMileAfterOrder(List<MileageVO> list)throws Exception;
}
