package com.fw.s1.purchase;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PurchaseTest {

	@Autowired
	private PurchaseService purchaseService;
	
	@Test
	void test() throws Exception {
		PurchaseVO purchaseVO = new PurchaseVO();
		purchaseVO.setOrderNum("123-234");
		purchaseVO.setPInfoNum(1L);
		purchaseVO.setProductCount(1L);
		purchaseVO.setProductNum(1L);
		purchaseVO.setProPriceSum(10000L);
		List<PurchaseVO> purchaseVOs = new ArrayList<>();
		purchaseVOs.add(purchaseVO);
		assertNotEquals(0, purchaseService.setOrderPurchase(purchaseVOs));
	}

}
