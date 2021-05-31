package com.fw.s1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/product/**")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping(value="list")
	public String getList(ProductVO productVO, Model model,String name)throws Exception{
		System.out.println(productVO.getCollab());
		System.out.println(productVO.getProductType());
		List<ProductVO> list = productService.getList(productVO);
		model.addAttribute("productList", list);
		model.addAttribute("name",name);
		return "/product/productList";
	}
}
