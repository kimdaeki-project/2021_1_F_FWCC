package com.fw.s1.member;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MemberMapperTest {

	@Autowired
	private MemberVO memberVO;
	
	@Test
	public void authoritiesTest() throws Exception {
		Object obj = memberVO.getAuthorities();
		assertNotNull(obj);
	}

}
