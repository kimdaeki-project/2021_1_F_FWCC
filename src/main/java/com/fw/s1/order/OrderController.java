package com.fw.s1.order;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/order/**")
public class OrderController {

private IamportClient api;
	
	public OrderController(){
		this.api = new IamportClient("imp_apikey", "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f");
	}
	
	@ResponseBody
	@PostMapping("vertify/{imp_uid}")
	public IamportResponse<Payment> getVertify(Model model, Locale locale, 
												HttpSession httpSession, @PathVariable(value="imp_uid")String imp_uid)
																		throws IamportResponseException, IOException {
		System.out.println(imp_uid);
		return api.paymentByImpUid(imp_uid);
	}
	
	@GetMapping("basket")
	public void getCartList() {
		
	}
	
	@GetMapping("orderform")
	public void getPurchase() {
		
	}
}
