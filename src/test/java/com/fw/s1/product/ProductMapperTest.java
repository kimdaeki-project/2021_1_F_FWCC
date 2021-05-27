package com.fw.s1.product;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fw.s1.product.ProductMapper;
import com.fw.s1.product.ProductVO;
@SpringBootTest
class ProductMapperTest {
	
	@Autowired
	private ProductMapper productMapper;

	@Test
	void test() throws Exception {
		List<ProductVO> list = productMapper.getList();
		System.out.println(list.size());
		assertNotNull(list);
	}

}
