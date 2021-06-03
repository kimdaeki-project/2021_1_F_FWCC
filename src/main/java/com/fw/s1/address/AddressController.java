package com.fw.s1.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class AddressController {

	@Autowired
	private AddressService addressService;
	
}
