package com.fw.s1.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fw.s1.purchase.PurchaseVO;

@Service
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	public Long insertAdmin(List<AdminVO> list)throws Exception{
		return adminMapper.insertAdmin(list);
	}
	
	public List<AdminVO> saleDay(String date)throws Exception{
		return adminMapper.saleDay(date);
	}
	
	public List<AdminVO> saleDays(HashMap<String, String> hashMap)throws Exception{
		return adminMapper.saleDays(hashMap);
	}
	
	public List<AdminVO> saleMonth(String date)throws Exception{
		return adminMapper.saleMonth(date);
	}
	
	public Long cancledOrder(List<PurchaseVO> list)throws Exception{
		return adminMapper.cancledOrder(list);
	}
	
	public Long reCancledOrder(List<PurchaseVO> list)throws Exception{
		return adminMapper.reCancledOrder(list);
	}
}
