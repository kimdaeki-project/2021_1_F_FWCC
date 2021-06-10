package com.fw.s1.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ProductFileManager {

	public String save(String name, MultipartFile multipartFile, HttpSession session) throws Exception{

		String path="/";
		ClassPathResource classPathResource = new ClassPathResource(path);
		File file = new File(classPathResource.getFile(), name);
		
		System.out.println(file.getAbsolutePath());
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		// 2. 저장할 파일명
		String fileName="";
		// a. 시간
//		Calendar ca = Calendar.getInstance();
//		long time = ca.getTimeInMillis();
//		fileName=time+"_"+multipartFile.getOriginalFilename();
		
		// b. API
		fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		// 3. HDD에 저장
		file = new File(file,fileName);
		
		// a. FileCopyUtils
//		FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		// b. MultipartFile
		multipartFile.transferTo(file);
		
		return fileName;
	}
	
	public boolean Delete(String name,String fileName, HttpSession session) throws Exception{
		//1. 경로 설정
		String path = session.getServletContext().getRealPath("resources/upload/"+name);
		File file = new File(path, fileName);
		boolean check = false;
		if(file.exists()) {
			check = file.delete();
		}
		return check;
	}
}
