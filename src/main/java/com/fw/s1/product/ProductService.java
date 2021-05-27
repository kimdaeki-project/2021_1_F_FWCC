package com.fw.s1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	public List<ProductVO> getList() throws Exception{
		return productMapper.getList();
	}
}
