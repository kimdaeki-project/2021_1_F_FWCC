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
import org.springframework.validation.Errors;

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
		result = addressService.setJoinAddress(addressVO);
	
		if(result<1) {
			throw new Exception();
		}
		
		return result;
	}
	
	public int getUsernameCheck(MemberVO memberVO) throws Exception {
		int result = 0;
		String username = memberVO.getUsername();
		memberVO = memberMapper.getUsernameCheck(memberVO);
		if(memberVO !=null) {
			String checkName = memberVO.getUsername();
			if(username.equals(checkName)) {
				result = 1;
			}			
		}
		return result;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("======= Service START =======");
		System.out.println("username : "+username);
		System.out.println("======= Service END =======");
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(username);
		try {
			memberVO = memberMapper.getLogin(memberVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberVO;
	}
	
//	Custom Validation ==============================================================
//	public boolean usernameCheckError(MemberVO memberVO, Errors errors) throws Exception {
//		boolean result = false;
//		// 기본 제공 검증 결과 담기
//		result = errors.hasErrors();
//		
//		// 1. username 중복 여부
//		
//		// 2. passowrd 일치 여부
//		
//		// 3. admin, administrator ID 안되게
//		
//
//		return result;
//	}
	
	public MemberVO getUsernameandemail(MemberVO memberVO)throws Exception{
		return memberMapper.getUsernameandemail(memberVO);
	}

}
