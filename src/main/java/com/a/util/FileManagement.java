package com.a.util;

import java.io.IOException;
import java.util.ArrayList;
import com.amazonaws.services.s3.AmazonS3Client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileManagement {

	@Autowired
	private S3Uploader S3Uploader;
	
	public ArrayList FileUploader(MultipartFile[] files) throws IOException {
		ArrayList filelist = new ArrayList();
		String FileNames ="";
		  for (MultipartFile mf : files) {
			    
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);
	            S3Uploader.fileUpload("cookingcoding",originFileName,mf);
	            String safeFile =System.currentTimeMillis() + originFileName;
	            
	            FileNames = FileNames+","+safeFile; 
	            filelist.add(originFileName);
	            try {
	            //	File f1 = new File(filepath+safeFile);
	            //    mf.transferTo(f1);
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
		
		return filelist;
	}
	
}
