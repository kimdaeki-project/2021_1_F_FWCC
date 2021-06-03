package com.fw.s1.member;

import java.sql.Date;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fw.s1.mileage.MileageVO;

import lombok.Data;

@Data
public class MemberVO implements UserDetails{
	
	private String username;
	private String password;
	private String name;
	private String phone;
	private String email;
	private Date birth;
	private boolean smsAgree;
	private boolean emailAgree;
	private boolean enabled;
	
	private String email1;
	private String email2;
	private String email3;
	private MileageVO mileageVO;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return this.enabled;
	}

	public void emailSeperator() {
		String[] templist = this.email.split("[@\\.]");
		this.email1 = templist[0];
		this.email2 = templist[1];
		this.email3 = templist[2];
	}
}
