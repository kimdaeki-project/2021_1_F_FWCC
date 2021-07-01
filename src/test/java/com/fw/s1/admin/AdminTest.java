package com.fw.s1.admin;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Calendar;
import java.util.Random;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class AdminTest {

	@Test
	void test() {
		Random random = new Random(Calendar.getInstance().getTimeInMillis());
		int count = random.nextInt()%7+1;
	}

}
