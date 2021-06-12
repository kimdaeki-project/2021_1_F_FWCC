package com.fw.s1.scheduler;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.fw.s1.admin.AdminService;
import com.fw.s1.admin.AdminVO;
import com.fw.s1.purchase.PurchaseService;
import com.fw.s1.purchase.PurchaseVO;

@Component
public class AdminScheduler {

	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private AdminService adminService;
	
	//하루 판매 현황을 모두 조회한 다음에 상품 별로 나눠서 각 상품이 팔린량을 저장한다(안팔린건 그냥 무시)
	@Scheduled(cron = "0 0 1 * * *")
	public void adminTable()throws Exception{
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -1);
		Date dbdate = new Date(calendar.getTimeInMillis());
		
		List<PurchaseVO> purchaseVOs = purchaseService.getTodayPurchase(dbdate);
		HashMap<Long, AdminVO> hashMap = new HashMap<>();
		for(PurchaseVO purchaseVO : purchaseVOs) {
			if(hashMap.get(purchaseVO.getProductNum())==null) {
				AdminVO adminVO = new AdminVO();
				adminVO.setAdminDate(dbdate);
				adminVO.setProductNum(purchaseVO.getProductNum());
				adminVO.setSellCount(purchaseVO.getProductCount());
				hashMap.put(purchaseVO.getProductNum(), adminVO);
			}else {
				AdminVO adminVO = hashMap.get(purchaseVO.getProductNum());
				adminVO.setSellCount(adminVO.getSellCount()+purchaseVO.getProductCount());
				hashMap.replace(purchaseVO.getProductNum(), adminVO);
			}
		}
		
		List<AdminVO> list = new ArrayList<>();
		Iterator<Long> iterator = hashMap.keySet().iterator();
		while(iterator.hasNext()) {
			list.add(hashMap.get(iterator.next()));
		}
		
		adminService.insertAdmin(list);
	}
}
