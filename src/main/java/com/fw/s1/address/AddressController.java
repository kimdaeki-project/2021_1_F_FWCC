package com.fw.s1.address;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fw.s1.member.MemberVO;
import com.google.gson.Gson;

@Controller
@RequestMapping("/address/**")
public class AddressController {

	@Autowired
	private AddressService addressService;
	
	@ResponseBody
	@GetMapping("getSelectOne")
	public String getSelectOne(AddressVO addressVO, Authentication authentication)throws Exception{
		//addressVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		addressVO.setUsername("admin");
		addressVO = addressService.getSelectOne(addressVO);
		
		if(addressVO==null) {
			return "";
		}
		
		addressVO.phoneSeperator();
		Gson gson = new Gson();
		String result = gson.toJson(addressVO);
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("deleteSelect")
	public String deleteAddress(long[] addrNums, Authentication authentication)throws Exception{
		List<AddressVO> addressVOs = new ArrayList<>();
		MemberVO memberVO = new MemberVO();
		//memberVO.setUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		memberVO.setUsername("admin");
		
		for(long addrNum : addrNums) {
			AddressVO addressVO = new AddressVO();
			addressVO.setAddrNum(addrNum);
			addressVO.setUsername(memberVO.getUsername());
			addressVOs.add(addressVO);
		}
		
		Long result = addressService.deleteSelect(addressVOs);
		List<AddressVO> addressVOs2 = new ArrayList<>();
		
		if(result<1) {
			return "default";
		}
		result = 0L;
		
		addressVOs2 = addressService.getAddressList(memberVO);
		List<AddressVO> addressVOs3 = new ArrayList<>();
		String[] str = new String[addressVOs2.size()-1];
		
		for(AddressVO addressVO : addressVOs2) {
			if(!addressVO.getOrderAddr()) {
				addressVOs3.add(addressVO);
				result++;			
			}
		}
		
		if(result<1) {
			return "none";
		}
		
		String json = "";
		
		return json;
	}
}
