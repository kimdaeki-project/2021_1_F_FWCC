package com.fw.s1.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	
	public List<ProductVO> getList(ProductVO productVO) throws Exception;
	public ProductVO getSelect(ProductVO productVO) throws Exception;
	public int setInsert(ProductVO productVO) throws Exception;
	public int setUpdate(ProductVO productVO) throws Exception;
	public int setDelete(ProductVO productVO) throws Exception;
	
	//구매 후 해당 상품의 재고량을 줄이는 메서드
	public Long updateStock(List<ProductInfoVO> list)throws Exception;

}
