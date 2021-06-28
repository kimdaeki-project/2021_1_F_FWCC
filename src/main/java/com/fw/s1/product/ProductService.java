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
		Long finalPrice = price*(100-disRate)/100;
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
	
	
	
	public boolean setSummerFileDelete(String fileName,String productNum) throws Exception{
		boolean result = productFileManager.Delete("/"+productNum, fileName, session);
		return result;
	}
	
	
	public String setSummerFileUpload(MultipartFile file,String productNum) throws Exception{
		System.out.println("num:"+productNum);
		String fileName = productFileManager.save("/"+productNum, file, session);
		return fileName;
		
	}
	
	
	
	public List<ProductVO> setUpdate()throws Exception{
		List<ProductVO> array = productMapper.getAllList();
		System.out.println(array.size());
		return array;
	}
	
	public ProductVO setUpdate(ProductVO productVO)throws Exception{
		ProductVO vo = productMapper.getProductSelect(productVO);
		vo.setFile(productMapper.getMain(vo));
		vo.setInfos(productMapper.getInfoSelect(vo));
		vo.setProductDivisionVO(productMapper.getDivisionSelect(vo));
		return vo;
	}
	
	public void setUpdate(ProductVO productVO,String[] sizeList, Long[] stockList, MultipartFile thumbNail) throws Exception{
		String type = productVO.getProductType();
		type = type.replace(",", "-");
		productVO.setProductType(type);
		System.out.println(type);
		int result = productMapper.setUpdate(productVO);
		if(sizeList.length==stockList.length) {
			for(int i=0;i<sizeList.length;i++) {
				ProductInfoVO piVO = new ProductInfoVO();
				piVO.setProductNum(productVO.getProductNum());
				piVO.setSize(sizeList[i]);
				piVO.setStock(stockList[i]);
				int result2 = productMapper.setUpdateProductInfo(piVO);
				System.out.println(i+" : "+result2);
			}
		}
		if(thumbNail.getOriginalFilename().length()>0) {
			List<ProductFileVO> array = productMapper.getFileSelect(productVO);
			System.out.println(array.size());
			if(array.size()!=0) {
				for(ProductFileVO file:array) {
					boolean delCheck = productFileManager.Delete("/"+productVO.getProductNum(), file.getFileName(), session);
					System.out.println("=====");
					System.out.println(delCheck);
					System.out.println("=====");
				}
				productMapper.setFileDelete(productVO);
			}
			String[] fileNames = productFileManager.thumbNailSave("/"+productVO.getProductNum(), thumbNail, session);
			for(String str:fileNames) {
				System.out.println(str);
				ProductFileVO pFileVO = new ProductFileVO();
				pFileVO.setProductNum(productVO.getProductNum());
				pFileVO.setFileName(str);
				pFileVO.setOriName(thumbNail.getOriginalFilename());
				result = productMapper.setFileInsert(pFileVO);
			}
		}
		
	}
	
	public ProductVO getSelect(ProductVO productVO)throws Exception{
		productVO = productMapper.getProductSelect(productVO);
		System.out.println("=====================Select==========================");
		System.out.println(productVO);
		System.out.println("pTitle : "+productVO.getProductTitle());
		System.out.println("pPrice : "+productVO.getProductPrice());
		System.out.println("pFinalPrice : "+productVO.getFinalPrice());
		System.out.println("pSummary : "+productVO.getSummary());
		System.out.println("pContents : "+productVO.getProductContents());
		productVO.setFile(productMapper.getMain(productVO));
		productVO.setInfos(productMapper.getInfoSelect(productVO));
		return productVO;
	}
	
	public String[] setInsert()throws Exception{
		return productMapper.getDivision();
	}
}
