package com.fw.s1.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

	//이전 날짜에 팔린 내역을 저장한다.
	public Long insertAdmin(List<AdminVO> list)throws Exception;
	//해당 날짜에 팔린 내역을 가져온다.
	public List<AdminVO> saleDay(String date)throws Exception;
	//해당 선택된 날짜들의 내역을 가져온다.
	public List<AdminVO> saleDays(HashMap<String, String> hashMap)throws Exception;
}
