package com.fw.s1.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fw.s1.util.ProductFileManager;
import com.fw.s1.util.ProductPager;

@Service
public class ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private ProductFileManager productFileManager;
	
	@Autowired
	private HttpSession session;
	
	public List<ProductVO> getList(ProductPager productPager) throws Exception{
		long num = productMapper.getTotalCount(productPager);
		System.out.println(num);
		productPager.makeRow();
		productPager.makeNum(num);
		List<ProductVO> list = productMapper.getList(productPager);
		System.out.println(list.size());
		return list;
	}
	
	public long getTotalCount(ProductPager productPager) throws Exception{
		return productMapper.getTotalCount(productPager);
	}
	
	public Long updateStock(List<ProductInfoVO> list)throws Exception{
		return productMapper.updateStock(list);
	}
	
	
	
	
	public boolean setSummerFileDelete(String fileName) throws Exception{
		boolean result = productFileManager.Delete("src/main/resources/static/images/product/test", fileName, session);
		return result;
	}
	
	
	public String setSummerFileUpload(MultipartFile file) throws Exception{
		
		String fileName = productFileManager.save("src/main/resources/static/images/product/test", file, session);
		return fileName;
		
	}
	
	
	
}
