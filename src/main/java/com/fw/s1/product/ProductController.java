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
		System.out.println(productPager.getLastNum());
		System.out.println("pre : "+ productPager.isPre());
		System.out.println("next : "+productPager.isNext());
		return "/product/productList";
	}

	@GetMapping(value="insert")
	public String setInsert()throws Exception{
		return "/product/productInsert";
	}

	@PostMapping(value="insert")
	public void  setInsert(ProductVO productVO, MultipartFile[] files, MultipartFile thumbnail, String size)throws Exception{
		System.out.println(productVO.getProductTitle());
		System.out.println(productVO.getCollab());
		System.out.println(productVO.getProductType());
		System.out.println(productVO.getProductPrice());
		System.out.println(productVO.getSummary());
		System.out.println(productVO.getProductContents());
		System.out.println(thumbnail.getOriginalFilename());
		System.out.println(files == null);
		System.out.println(files.length);
		for(MultipartFile mf:files) {
			System.out.println(mf.getOriginalFilename());
		}
		System.out.println(size);

	}
	
	
	@PostMapping(value="summerFileDelete")
	public ModelAndView setSummerFileDelete(String fileName) throws Exception{
		ModelAndView mv  = new ModelAndView();
		boolean result = productService.setSummerFileDelete(fileName);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	
	@PostMapping(value="summerFileUpload")
	@ResponseBody
	public String setSummerFileUpload(MultipartFile file)throws Exception{
		System.out.println("summerfileUpload");
		System.out.println(file.getOriginalFilename());
		String fileName = productService.setSummerFileUpload(file);
		fileName="/images/product/test/"+fileName;
		
		return fileName;
	}
	
	
}
