package com.a.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import com.amazonaws.services.s3.AmazonS3Client;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.MultipartFilter;

@Controller
public class FileManagement {

	@Autowired
	private S3Uploader S3Uploader;
	
	private static String getUuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
	
	public String FileUploader(MultipartFile multipartFile) throws IOException {
		String FileNames ="";
		
		S3Uploader.S3Uploader();
		
		String originFileName = multipartFile.getOriginalFilename(); // 원본 파일 명
        long fileSize = multipartFile.getSize(); // 파일 사이즈

        System.out.println("originFileName : " + originFileName);
        System.out.println("fileSize : " + fileSize);
        // 확장자를 찾기 위한 코드
        final String ext = originFileName.substring(originFileName.lastIndexOf('.'));
        // 파일이름 암호화
        final String saveFileName = getUuid() + ext;
        System.out.println("saveFileName : " + saveFileName);
        S3Uploader.fileUpload("livelybucket",saveFileName,multipartFile);
        
        try {
        //	File f1 = new File(filepath+safeFile);
        //    mf.transferTo(f1);
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
		return saveFileName;
	}
	
}
