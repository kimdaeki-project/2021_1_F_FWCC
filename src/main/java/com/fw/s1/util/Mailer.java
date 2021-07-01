package com.fw.s1.util;

import java.util.Date;

import javax.mail.Message;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.fw.s1.member.MemberVO;

@Component
public class Mailer {
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	public void sendMail(MemberVO memberVO) throws Exception {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		mimeMessage.setSubject("[FrizmWORKS]"+memberVO.getName()+"임시 비밀번호가 생성되었습니다.");
		mimeMessage.setRecipients(Message.RecipientType.TO, memberVO.getEmail());
		mimeMessage.setText("testing email");
		mimeMessage.setSentDate(new Date());
		javaMailSender.send(mimeMessage);
	}
	
}
