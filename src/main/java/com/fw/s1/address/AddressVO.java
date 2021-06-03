package com.fw.s1.address;

import lombok.Data;

@Data
public class AddressVO {

	private Long addrNum;
	private String username;
	private String addrName;
	private String recipient;
	private String addrPhone;
	private String zipCode;
	private String basicAddr;
	private String detailAddr;
	private Boolean orderAddr;
	private Boolean recentUse;
	
	private String addrPhone1;
	private String addrPhone2;
	private String addrPhone3;
	
	public void phoneSeperator() {
		String[] tempphone = this.addrPhone.split("[-]");
		this.addrPhone1 = tempphone[0];
		this.addrPhone2 = tempphone[1];
		this.addrPhone3 = tempphone[2];
	}
}
