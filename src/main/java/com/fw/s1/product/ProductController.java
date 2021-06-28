package com.fw.s1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fw.s1.util.ProductPager;

@Controller
@RequestMapping(value="/product/**")
public class ProductController {

	@Autowired
	private ProductService productService;

	@GetMapping(value="list")
	public String getList(ProductPager productPager, Model model,String name,String division)throws Exception{
		System.out.println(productPager);
		System.out.println(productPager.getProductType());
		System.out.println(productPager.isSale());
//		String str=productPager.getProductType();
//		if(str.equals("TOP-")||str.equals("BOTTOM-")) {
//			System.out.println("str1 : "+str);
//			str=str.replace("-", "");			
//		}
//		str=str.toLowerCase();
//		System.out.println("str2 : "+str);
//		productPager.setProductType(str);
//		System.out.println(productPager.getProductType());
		if(productPager.getProductType().equals("All-New arrival")||productPager.getProductType().equals("sale-")) {
			productPager.setProductType(null);
		}
		Long total = productService.getTotalCount(productPager);
		List<ProductVO> list = productService.getList(productPager);
		model.addAttribute("productList", list);
		model.addAttribute("totalCount",total);
		model.addAttribute("name",name);
		model.addAttribute("division", division);
		model.addAttribute("pager", productPager);
		model.addAttribute("sortStandard", productPager.getSortStandard());
		model.addAttribute("sale", productPager.isSale());
		System.out.println("lastNum : "+productPager.getLastNum());
		System.out.println("pre : "+ productPager.isPre());
		System.out.println("next : "+productPager.isNext());
		System.out.println("totalPage : "+productPager.getTotalPage());
		return "/product/productList";
	}

	@GetMapping(value="insert")
	public String setInsert(Model model)throws Exception{
		model.addAttribute("productNum", productService.getNextNum());
		return "/product/productInsert";
	}

	@PostMapping(value="insert")
	public String  setInsert(ProductVO productVO, MultipartFile thumbnail, String size)throws Exception{
		System.out.println("");
		System.out.println("=============================================================");
		System.out.println("productNum : "+productVO.getProductNum());
		System.out.println("title : "+productVO.getProductTitle());
		System.out.println("price : "+productVO.getProductPrice());
		System.out.println("summary : "+productVO.getSummary());
		System.out.println("contents : "+productVO.getProductContents());
		System.out.println("thumbNail : "+thumbnail.getOriginalFilename());
		System.out.println("disRate : "+productVO.getProductDisRate());
//		System.out.println(files == null);
//		System.out.println(files.length);
//		for(MultipartFile mf:files) {
//			System.out.println(mf.getOriginalFilename());
//		}
		System.out.println("size : "+size);
		int result = productService.setInsert(productVO, size, thumbnail);
		return "redirect:/admin/adminHome";
	}
	
	
	@PostMapping(value="summerFileDelete")
	public ModelAndView setSummerFileDelete(String fileName,String productNum) throws Exception{
		System.out.println(fileName);
		System.out.println(productNum);
		ModelAndView mv  = new ModelAndView();
		boolean result = productService.setSummerFileDelete(fileName,productNum);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	
	@PostMapping(value="summerFileUpload")
	@ResponseBody
	public String setSummerFileUpload(MultipartFile file,String productNum)throws Exception{
		System.out.println(productNum);
		System.out.println("summerfileUpload");
		System.out.println(file == null);
		System.out.println(file.getOriginalFilename());
		String fileName = productService.setSummerFileUpload(file,productNum);
		fileName="/resources/images/product/"+productNum+"/"+fileName;
		
		return fileName;
	}
	
	
	@GetMapping(value="allList")
	public String setUpdate(Model model)throws Exception{
		List<ProductVO> array = productService.setUpdate();
		model.addAttribute("allList",array);
		return "product/allList";
	}
	
	@GetMapping(value="update")
	public String setUpdate(Model model,ProductVO productVO)throws Exception{
		System.out.println(productVO.getProductNum());
		ProductVO vo = productService.setUpdate(productVO);
		model.addAttribute("VO", vo);
		return "product/productUpdate";
	}
	@PostMapping(value="update")
	public void setUpdate(ProductVO productVO,String[] sizeList, Long[] stockList, MultipartFile thumbnail)throws Exception{
		System.out.println(productVO.getProductTitle());
		System.out.println(productVO.getProductPrice());
		System.out.println(productVO.getProductDisRate());
		System.out.println(productVO.getFinalPrice());
		System.out.println(thumbnail==null);
		System.out.println("oriName : "+thumbnail.getOriginalFilename());
		System.out.println("oriNameLenghth : "+thumbnail.getOriginalFilename().length());
		System.out.println(productVO.getSummary());
		System.out.println(productVO.getProductContents());
		System.out.println(productVO.getCollab());
		System.out.println(productVO.getProductType());
		System.out.println(sizeList.length);
		System.out.println(stockList.length);
		for(String size:sizeList) {
			System.out.println(size);
		}
		for(Long stock:stockList) {
			System.out.println(stock);
		}
		productService.setUpdate(productVO, sizeList, stockList, thumbnail);
	}
	
	@GetMapping(value="select")
	public String getSelect(ProductVO productVO,Model model)throws Exception{
		productVO = productService.getSelect(productVO);
		model.addAttribute("VO",productVO);
		return "product/productSelect";
	}
	
}
