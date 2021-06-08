package com.fw.s1.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fw.s1.address.AddressService;
import com.fw.s1.address.AddressVO;

@Service
public class MemberService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private AddressService addressService;
	
	@Transactional(rollbackFor = Exception.class)
	public int setJoin(MemberVO memberVO) throws Exception {
		// 1. password 암호화
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		// 2. 사용자 활성화
		memberVO.setEnabled(true);
		// 3. member table 저장
		int result = memberMapper.setJoin(memberVO);
		// 4. role table 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", memberVO.getUsername());
		map.put("roleName", "ROLE_MEMBER");
		result = memberMapper.setMemberRole(map);
		
		// 5. address table 저장
		AddressVO addressVO = new AddressVO();
		addressVO.setUsername(memberVO.getUsername());
		addressVO.setRecipient(memberVO.getName());
		addressVO.setAddrPhone(memberVO.getPhone());
		addressVO.setZipCode(memberVO.getZipCode());
		addressVO.setBasicAddr(memberVO.getBasicAddr());
		addressVO.setDetailAddr(memberVO.getDetailAddr());
		result = addressService.setAddress(addressVO);
	
		if(result<1) {
			throw new Exception();
		}
		
		return result;
	}
	
	public MemberVO getUsernameCheck(MemberVO memberVO) throws Exception {
		return memberMapper.getUsernameCheck(memberVO);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(username);
		
		return memberVO;
	}
	
	
	
}
