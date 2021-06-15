package com.fw.s1.product;

import java.awt.image.BufferedImage;
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
	
	public Long getNextNum() throws Exception{
		return productMapper.getNextNum();
	}
	
	public List<ProductVO> getList(ProductPager productPager) throws Exception{
		long num = productMapper.getTotalCount(productPager);
		System.out.println("totalNum"+num);
		
		
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
	
	public int setInsert(ProductVO productVO, String size, MultipartFile thumbNail) throws Exception{
		String type = productVO.getProductType();
		type = type.replace(",", "-");
		Long price = productVO.getProductPrice();
		Long disRate = productVO.getProductDisRate();
		if(disRate==null) {
			disRate = 0L;
		}
		Long finalPrice = price*(100-disRate);
		Long mileage = ((price/100)*5);
		productVO.setFinalPrice(finalPrice);
		productVO.setProductMileage(mileage);
		productVO.setProductType(type);
		productVO.setProductSaleable(true);
		System.out.println("disRate : "+ disRate);
		System.out.println("finalPrice : "+finalPrice);
		System.out.println("mileage : "+mileage);
		System.out.println("type : "+type);
		System.out.println("saleable : "+productVO.getProductSaleable());
		int result = productMapper.setInsert(productVO);
		
		String[] fileNames = productFileManager.thumbNailSave("/"+productVO.getProductNum(), thumbNail,session);
		for(String str:fileNames) {
			System.out.println(str);
			ProductFileVO pFileVO = new ProductFileVO();
			pFileVO.setProductNum(productVO.getProductNum());
			pFileVO.setFileName(str);
			pFileVO.setOriName(thumbNail.getOriginalFilename());
			result = productMapper.setFileInsert(pFileVO);
		}
		
//		String bFile = productFileManager.createThumbnail("static/images/product/"+productVO.getProductNum(),fileName, thumbNail, 100, 100);
//		pFileVO = new ProductFileVO();
//		pFileVO.setProductNum(productVO.getProductNum());
//		pFileVO.setFileName(bFile);
//		pFileVO.setOriName(thumbNail.getOriginalFilename());
//		result = productMapper.setFileInsert(pFileVO);
		String[] sizeAssy = size.split(",");
		for(String str:sizeAssy) {
			System.out.println("size : "+str);
			ProductInfoVO pInfoVO = new ProductInfoVO();
			pInfoVO.setProductNum(productVO.getProductNum());
			pInfoVO.setSize(str);
			result = productMapper.setInsertPInfo(pInfoVO);
		}
		return result;
	}
	
	
	
	public boolean setSummerFileDelete(String fileName) throws Exception{
		boolean result = productFileManager.Delete("src/main/resources/static/images/product/test", fileName, session);
		return result;
	}
	
	
	public String setSummerFileUpload(MultipartFile file,String productNum) throws Exception{
		
		String fileName = productFileManager.save("/"+productNum, file, session);
		return fileName;
		
	}
	
	
	
}
