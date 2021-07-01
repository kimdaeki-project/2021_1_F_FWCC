package com.fw.s1.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;

import com.fw.s1.address.AddressMapper;
import com.fw.s1.address.AddressService;
import com.fw.s1.address.AddressVO;
import com.fw.s1.board.qna.QnaMapper;
import com.fw.s1.board.qna.QnaVO;
import com.fw.s1.mileage.MileageMapper;
import com.fw.s1.mileage.MileageService;
import com.fw.s1.mileage.MileageVO;
import com.fw.s1.util.Mailer;

@Service
public class MemberService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private AddressMapper addressMapper;
	
	@Autowired
	private MileageService mileageService;
	
	@Autowired
	private MileageMapper mileageMapper;
	
	@Autowired
	private QnaMapper qnaMapper;
	
	@Autowired
	private Mailer mailer;
	
	@Transactional(rollbackFor = Exception.class)
	public int setJoin(MemberVO memberVO) throws Exception {
		// 1. password 암호화
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		// 2. 사용자 활성화
		memberVO.setEnabled(true);
		// 3. member table 저장
		int result = memberMapper.setJoin(memberVO);
		// 4. memberRole table 저장
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
		
		// 6. mileage table 저장
		MileageVO mileageVO = new MileageVO();
		mileageVO.setUsedMile(0L);
		mileageVO.setChangeMile(2000L);
		mileageVO.setUsername(memberVO.getUsername());
		mileageVO.setMileContents("신규회원 적립금");
		mileageVO.setEnabledMile(2000L);
		result = (int)mileageService.setMileAfterJoin(mileageVO).longValue();
		
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
	
	public MemberVO getMemberProfile(MemberVO memberVO) throws Exception {
		memberVO = memberMapper.getMemberProfile(memberVO);
		String phone = memberVO.getPhone();
		String[] phones = phone.split("-");
		memberVO.setPhone0(phones[0]);
		memberVO.setPhone1(phones[1]);
		memberVO.setPhone2(phones[2]);
		return memberVO;
	}
	
	public AddressVO getProfileAddress(MemberVO memberVO) throws Exception{
		return addressMapper.getProfileAddress(memberVO);
	}
	
	public boolean getPwCheck(MemberVO memberVO) throws Exception {
		String pwCheck = memberVO.getPasswordCheck();
		memberVO = memberMapper.getMemberProfile(memberVO);
		boolean check = passwordEncoder.matches(pwCheck, memberVO.getPassword());
		return check;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Long setMemberUpdate(MemberVO memberVO) throws Exception {
		long result = 0L;
		// 1. password 암호화
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		// 2. member Update
		result = memberMapper.setMemberUpdate(memberVO);
		// 3. address Update
		result = addressMapper.setProfileAddressUpdate(memberVO);
		
		return result;
	}
	
	public MemberVO getMember(MemberVO memberVO) throws Exception {
		if(memberVO.getEmail().equals("")) {
			memberVO.setPhone(memberVO.getPhone0()+"-"+memberVO.getPhone1()+"-"+memberVO.getPhone2());
		}
		return memberMapper.getMember(memberVO);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public long sendTempPw(MemberVO memberVO) throws Exception {
		// 1. 임시비밀번호 생성
		Random random = new Random();
		String tempPw = random.nextInt()+"";
		System.out.println("Temporary Password : "+tempPw);
		// 2. 임시비밀번호 인코딩
		memberVO.setPassword(passwordEncoder.encode(tempPw));
		// 3. DB에 임시비밀번호로 바꾸기
		long result = memberMapper.setPw(memberVO);
		System.out.println("SERVICE ---------> Password Change Complete");
		// 4. Mail로 임시비밀번호 보내기
		result = mailer.sendMail(memberVO, tempPw);
		
		return result;
	}
	
	public List<MileageVO> getMemberMileage(MemberVO memberVO) throws Exception {
		return mileageMapper.getMemberMileage(memberVO);
	}
	
	public MileageVO getRecentMemberMileage(MemberVO memberVO) throws Exception {
		return mileageMapper.getRecentMemberMileage(memberVO);
	}
	
	public List<QnaVO> getMemberBoardList(MemberVO memberVO) throws Exception {
		return qnaMapper.getMemberBoardList(memberVO);
	}
	
	public List<AddressVO> getMemberAddress(MemberVO memberVO) throws Exception {
		return addressMapper.getMemberAddress(memberVO);
	}
	
	public Long setMemberAddress(AddressVO addressVO) throws Exception {
		addressVO.setAddrPhone(addressVO.getAddrPhone1()+"-"+addressVO.getAddrPhone2()+"-"+addressVO.getAddrPhone3());
		return addressMapper.setMemberAddress(addressVO);
	}
	
	public AddressVO getAddressSelectOne(AddressVO addressVO) throws Exception {
		addressVO = addressMapper.getSelectOne(addressVO);
		addressVO.phoneSeperator();
		return addressVO;
	}
	
	public Long updateMemberAddress(AddressVO addressVO) throws Exception {
		addressVO.setAddrPhone(addressVO.getAddrPhone1()+"-"+addressVO.getAddrPhone2()+"-"+addressVO.getAddrPhone3());
		return addressMapper.updateMemberAddress(addressVO);
	}
	
	public Long deleteMemberAddress(AddressVO addressVO) throws Exception {
		return addressMapper.deleteMemberAddress(addressVO);
	}
	
	
// ======================================================================================
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
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
