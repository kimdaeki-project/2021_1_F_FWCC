package com.fw.s1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fw.s1.util.ProductPager;

@Service
public class ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	public List<ProductVO> getList(ProductPager productPager) throws Exception{
		long num = productMapper.getTotalCount(productPager);
		System.out.println(num);
		productPager.makeRow();
		productPager.makeNum(num);
		List<ProductVO> list = productMapper.getList(productPager);
		System.out.println(list.size());
		return list;
	}
}
