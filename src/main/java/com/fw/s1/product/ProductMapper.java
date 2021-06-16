package com.fw.s1.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.order.OrderlistVO;
import com.fw.s1.util.ProductPager;

@Mapper
public interface ProductMapper {
	
	public Long getTotalCount(ProductPager productPager) throws Exception;
	public List<ProductVO> getList(ProductPager productPager) throws Exception;
	public ProductVO getSelect(ProductVO productVO) throws Exception;
	public int setInsert(ProductVO productVO) throws Exception;
	public int setUpdate(ProductVO productVO) throws Exception;
	public int setDelete(ProductVO productVO) throws Exception;
	public Long getNextNum()throws Exception;
	public int setInsertPInfo(ProductInfoVO pInfoVO) throws Exception;
	public int setFileInsert(ProductFileVO productFileVO) throws Exception;
	
	//구매 후 해당 상품의 재고량을 줄이는 메서드
	public Long updateStock(List<ProductInfoVO> list)throws Exception;
}
