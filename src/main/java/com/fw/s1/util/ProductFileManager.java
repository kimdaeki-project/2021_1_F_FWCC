package com.fw.s1.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.mortennobel.imagescaling.MultiStepRescaleOp;
import com.mortennobel.imagescaling.AdvancedResizeOp;

@Component
public class ProductFileManager {
	
	
	
	public String[] thumbNailSave(String name, MultipartFile multipartFile,HttpSession session) throws Exception{
// 임시파일 저장
		String[] array=new String[2];
		String path=session.getServletContext().getRealPath("resources/images/product"+name);
		File file = new File(path);
		
		System.out.println(file.getAbsolutePath());
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		// 2. 저장할 파일명
		String fileName="";
		
		// b. API
		fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		// 3. HDD에 저장
		file = new File(file,fileName);
		
		// a. FileCopyUtils
//		FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		// b. MultipartFile
		
		multipartFile.transferTo(file);
// 본파일 저장
		File file2 = new File(path,fileName);
//		System.out.println("f2A : "+file2.getAbsolutePath());
//		System.out.println("f2 : "+file2);
//		
		String ori=multipartFile.getOriginalFilename();
	      String exp=ori.substring(ori.lastIndexOf(".")+1);
	      String Oname=ori.substring(0,ori.lastIndexOf("."));
	      System.out.println("ori :"+ori);
	      System.out.println("exp :"+exp);
	      System.out.println("name :"+Oname);

	      BufferedImage originalImage = ImageIO.read(file.getAbsoluteFile());

//	      crop
	      int ow = originalImage.getWidth();
	      int oh = originalImage.getHeight();
	      int nw = 0;
	      int nh = 0;
	      String mName="";
	      if(ow>oh) {
	    	  nw=oh;
	    	  nh=oh;
	    	  originalImage = Scalr.crop(originalImage, (ow-oh)/2, 0, nw, nh);
	    	   mName = "M_"+UUID.randomUUID().toString()+"_"+ori;
	    	   file = new File(path+"/"+mName);
	  	     ImageIO.write(originalImage, exp, file);
	      }else if(oh>ow) {
	    	  nw=ow;
	    	  nh=ow;
	    	  originalImage = Scalr.crop(originalImage,0, (oh-ow)/2, nw, nh);
	    	   mName = "M_"+UUID.randomUUID().toString()+"_"+ori;
	    	   file = new File(path+"/"+mName);
	  	     ImageIO.write(originalImage, exp, file);
	      }else {
	    	   mName = "M_"+UUID.randomUUID().toString()+"_"+ori;
	    	   file = new File(path+"/"+mName);
	  	     ImageIO.write(originalImage, exp, file);
	    	  
	      }
	     
	      array[0]=mName;
	      
	      
	      MultiStepRescaleOp rescale = new MultiStepRescaleOp(100, 100);

	      rescale.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);      

	      BufferedImage thumbImage = rescale.filter(originalImage, null);
	      
	      String finalName = "T_"+UUID.randomUUID().toString()+"_"+ori;
	      file = new File(path+"/"+finalName);
	      ImageIO.write(thumbImage, exp, file);
	      array[1]=finalName;

		
		// 임시파일 삭제
	      boolean check = file2.delete();
	      System.out.println("delete : "+check);
		return array;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	public String save(String name, MultipartFile multipartFile, HttpSession session) throws Exception{

		String path=session.getServletContext().getRealPath("resources/images/product"+name);
		File file = new File(path);
		
		System.out.println(path);
		
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
		String path=session.getServletContext().getRealPath("resources/images/product"+name);
		File file = new File(path, fileName);
		boolean check = false;
		if(file.exists()) {
			check = file.delete();
		}
		return check;
	}
}
