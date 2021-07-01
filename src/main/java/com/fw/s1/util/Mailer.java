package com.fw.s1.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

import com.fw.s1.member.MemberVO;

@Component
public class Mailer {
	
	@Autowired
	JavaMailSender javaMailSender;
	
	// JavaMailSender configuration
	@Bean
	public JavaMailSender getJavaMailSender() {
	    JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	    mailSender.setHost("smtp.gmail.com");
	    mailSender.setPort(587);
	    
	    mailSender.setUsername("hyungsoolim0@gmail.com");
	    mailSender.setPassword("tgzljzythhboxuym");
	    
	    Properties props = mailSender.getJavaMailProperties();
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.debug", "true");
	    
	    return mailSender;
	}
	
	public long sendMail(MemberVO memberVO, String tempPw) throws Exception {
		long result = 0L;
		if(memberVO != null) {			
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			mimeMessage.setSubject("[FrizmWORKS]"+memberVO.getName()+"임시 비밀번호가 생성되었습니다.");
			mimeMessage.setRecipients(Message.RecipientType.TO, memberVO.getEmail());
			mimeMessage.setText("ID : "+memberVO.getUsername()+"\r"+"임시 비밀번호 : "+tempPw);
			mimeMessage.setSentDate(new Date());
			javaMailSender.send(mimeMessage);
			result = 1L;
		}
		
		return result;
	}
	
}
