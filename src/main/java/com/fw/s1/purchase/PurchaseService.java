package com.fw.s1.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PurchaseService {

	@Autowired
	private PurchaseMapper purchaseMapper;
	
	public Long setOrderPurchase(List<PurchaseVO> list)throws Exception{
		return purchaseMapper.setOrderPurchase(list);
	}
}
