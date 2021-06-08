package com.fw.s1.product;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Random;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fw.s1.product.ProductMapper;
import com.fw.s1.product.ProductVO;
import com.fw.s1.util.ProductPager;
@SpringBootTest
class ProductMapperTest {
	
	@Autowired
	private ProductMapper productMapper;

	@Test
	void getListTest() throws Exception {
		ProductPager productPager = new ProductPager();
		long num = productMapper.getTotalCount(productPager);
		productPager.setStartRow(0);
		productPager.setLastRow(num);
		
		List<ProductVO> list = productMapper.getList(productPager);
		System.out.println(list.size());
		for(ProductVO vo:list) {
//			if(vo.getProductSaleable()!=1) {
//				System.out.println(vo.getProductTitle());
//			}
		}
		assertNotNull(list);
	}
	
//	@Test
	void getSelectTest() throws Exception{
		ProductVO vo = new ProductVO();
		vo.setProductNum(33L);
		vo = productMapper.getSelect(vo);
		System.out.println(vo.getProductTitle());
		
		assertNotNull(vo);
		
	}
	
//	@Test
	void setInsertTest() throws Exception{
		int total=0;
		String name = "top-short";
		for(int i=0;i<300;i++) {
			ProductVO vo = new ProductVO();
			vo.setProductTitle(name+i);
			vo.setProductPrice((long) ((i+1)*10000));
			vo.setProductContents("productContents"+i);
			vo.setCollab("collab"+i%3);
			vo.setProductType(name);
			int result = productMapper.setInsert(vo);
			total += result;
			System.out.println("r : "+result+" t : "+total);
			if(i%10==0) {
				Thread.sleep(1000);
			}
		}
		assertNotEquals(0, total);
	}
	
//	@Test
	void getTotalListTest() throws Exception{
		ProductPager productPager = new ProductPager();
		long num = productMapper.getTotalCount(productPager);
		productPager.setStartRow(0);
		productPager.setLastRow(num);
		
		List<ProductVO> list = productMapper.getList(productPager);
		
		System.out.println(list.size());
		
		assertNotEquals(0, list);
	}
	
//	@Test
	void setUpdateTest() throws Exception {
		ProductPager productPager = new ProductPager();
		long num = productMapper.getTotalCount(productPager);
		productPager.setStartRow(0);
		productPager.setLastRow(num);
		int totalResult=0;
		List<ProductVO> list = productMapper.getList(productPager);
		Random rm = new Random();
//		for(ProductVO vo:list) {
//			vo.setProductDisRate((long)((rm.nextInt(11))*5));
//			long price = vo.getProductPrice();
//			long rate = vo.getProductDisRate();
//			rate = (100-rate);
//			long fPrice = ((price*rate)/10000)*100;
//			
//			long mileage = price/2000*100;
//			vo.setFinalPrice(fPrice);
//			vo.setProductMileage(mileage);
//			
//			
//			int result = productMapper.setUpdate(vo);
//			totalResult += result;
//			if(totalResult%10==0) {
//				System.out.println("===================================");
//				System.out.println("price : "+price);
//				System.out.println("rate : "+(100-rate));
//				System.out.println("finalPrice : "+fPrice);
//				System.out.println("===================================");
//			}
//		}
		for(ProductVO vo:list) {
			int rand = rm.nextInt(2);
//			vo.setProductSaleable((long)rand);
			int result = productMapper.setUpdate(vo);
			totalResult += result;
			if(totalResult%10==0) {
				System.out.println(totalResult);
			}
		}
		System.out.println(totalResult);
		assertNotEquals(0, totalResult);
	}
	
//	@Test
	void setDeleteTest() throws Exception{
		ProductVO vo = new ProductVO();
		vo.setProductNum(36L);
		int result = productMapper.setDelete(vo);
		assertNotEquals(0, result);
	}
}
