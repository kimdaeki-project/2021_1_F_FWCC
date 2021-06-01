package com.fw.s1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	public List<ProductVO> getList(ProductVO productVO) throws Exception{
		System.out.println(productVO.getCollab());
		System.out.println(productVO.getProductType());
		List<ProductVO> list = productMapper.getList(productVO);
		System.out.println(list.size());
		return list;
	}
}
