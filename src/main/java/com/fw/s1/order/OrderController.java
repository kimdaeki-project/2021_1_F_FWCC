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
import com.siot.IamportRestClient.request.CancelData;
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
		return api.paymentByImpUid(imp_uid);
	}
	
	@ResponseBody
	@PostMapping("cancle/{merchant_uid}")
	public boolean testCancelPaymentAlreadyCancelledMerchantUid(@PathVariable(value="merchant_uid")String merchant_uid) {
		String test_already_cancelled_merchant_uid = merchant_uid;
		CancelData cancel_data = new CancelData(test_already_cancelled_merchant_uid, false); //merchant_uid를 통한 전액취소
		cancel_data.setEscrowConfirmed(true); //에스크로 구매확정 후 취소인 경우 true설정
		boolean check = true;
		try {
			IamportResponse<Payment> payment_response = api.cancelPaymentByImpUid(cancel_data);
			if(payment_response.getResponse()==null) {
				check=false;
			}
			//assertNull(payment_response.getResponse()); // 이미 취소된 거래는 response가 null이다
			System.out.println(payment_response.getMessage());
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :	//401은 Unauthorized일때 혹은 비교를 했을때 아이디가 다른 경우에 가능하게 할 수 있다.
				check=false;
				break;
			case 404:	//해당 merhcant_uid가 존재하지 않는다.
				check=false;
				break;
			case 500 :	//서버와 응답할 수 없는 경우
				check=false;
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			check=false;
			e.printStackTrace();
		}	
		return check;
	}
	
	@GetMapping("basket")
	public void getCartList() {
		
	}
	
	@GetMapping("orderform")
	public void getPurchase() {
		
	}
}
