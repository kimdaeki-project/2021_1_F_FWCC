package com.fw.s1.admin;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class AdminTest {

	@Autowired
	private AdminService adminService;
	
	@Test
	void test() throws Exception {
		List<AdminVO> list = new ArrayList<>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 1 ; i <= 30; i++) {
			String temp = String.valueOf(i);
			if(i < 10) {
				temp = 0 + temp;
			}
			Date middle = new Date(simpleDateFormat.parse("2021-06-"+temp).getTime());
			Random random = new Random(Calendar.getInstance().getTimeInMillis());
			int pCount = random.nextInt(30) + 1;
			List<AdminVO> templist = new ArrayList<>();
			for(int j = 0 ; j < pCount; j++) {
				AdminVO adminVO = new AdminVO();
				adminVO.setAdminDate(middle);
				random = new Random(Calendar.getInstance().getTimeInMillis());
				long pNum = (long)(random.nextInt(121) + 723);
				boolean check = false;
				for(int k = 0 ; k < templist.size(); k++) {
					if(pNum == templist.get(k).getProductNum()) {
						check = true;
						break;
					}
				}
				if(check) {
					j--;
					continue;
				}
				adminVO.setProductNum(pNum);
				random = new Random(Calendar.getInstance().getTimeInMillis());
				long count = (long)(random.nextInt(7) + 1);
				adminVO.setSellCount(count);
				templist.add(adminVO);
			}
			for(int j = 0 ; j < templist.size(); j++) {
				list.add(templist.get(j));
			}
		}
		assertNotEquals(0, adminService.insertAdmin(list));
	}

}
