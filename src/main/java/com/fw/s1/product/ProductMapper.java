package com.fw.s1.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fw.s1.order.OrderlistVO;
import com.fw.s1.util.ProductPager;

@Mapper
public interface ProductMapper {
	
	public Long getTotalCount(ProductPager productPager) throws Exception;
	public List<ProductVO> getList(ProductPager productPager) throws Exception;
	public Long getNextNum()throws Exception;
	public ProductVO getProductSelect(ProductVO productVO) throws Exception;
	public List<ProductInfoVO> getInfoSelect(ProductVO productVO) throws Exception;
	public List<ProductFileVO> getFileSelect(ProductVO productVO) throws Exception;
	public ProductDivisionVO getDivisionSelect(ProductVO productVO) throws Exception;
	public List<ProductVO> getAllList()throws Exception;
	public ProductFileVO getThumbNail(ProductVO productVO) throws Exception;
	public ProductFileVO getMain(ProductVO productVO) throws Exception;
	public String[] getDivisions() throws Exception;
	public List<ProductDivisionVO> getDivision(ProductDivisionVO productDivisonVO) throws Exception;
	
	public int setInsert(ProductVO productVO) throws Exception;
	public int setUpdate(ProductVO productVO) throws Exception;
	public int setFileDelete(ProductVO productVO) throws Exception;
	public int setInsertPInfo(ProductInfoVO pInfoVO) throws Exception;
	public int setFileInsert(ProductFileVO productFileVO) throws Exception;
	public int setUpdateProductInfo(ProductInfoVO productInfoVO) throws Exception;
	
	
	
	
	//구매 후 해당 상품의 재고량을 줄이는 메서드
	public Long updateStock(List<ProductInfoVO> list)throws Exception;
}
