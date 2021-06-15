package com.fw.s1.mileage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MileageService {

	@Autowired
	private MileageMapper mileageMapper;
	
	public MileageVO getRecentMileage(MileageVO mileageVO)throws Exception{
		return mileageMapper.getRecentMileage(mileageVO);
	}
	
	public Long setMileAfterOrder(List<MileageVO> list)throws Exception{
		return mileageMapper.setMileAfterOrder(list);
	}
	
	// 회원가입 후 마일리지 적립
	public Long setMileAfterJoin(MileageVO mileageVO) throws Exception {
		return mileageMapper.setMileAfterJoin(mileageVO);
	}
}
