package com.uwl.web.challenge;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import javax.imageio.ImageIO;

public class ImageURLDownloader {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
    
		String imageUrl = "http://cfile30.uf.tistory.com/image/2730E64758D9FF711CAD83";
		String savePath = "C:\\test\\";
		String saveFileName = "test.png";
		String fileFormat = "png";
		
		System.out.println(" IMAGE URL ::: " + imageUrl);
		System.out.println(" SAVE PATH ::: " + savePath);
		System.out.println(" SAVE FILE NAME ::: " + saveFileName);
		System.out.println(" FILE FORMAT ::: " + fileFormat);
		
		File saveFile = new File(savePath + saveFileName);

		saveImage(imageUrl, saveFile, fileFormat);		
	}
	
	public static void saveImage(String imageUrl, File saveFile, String fileFormat) {
		    
		URL url = null;
		BufferedImage bi = null;
		
		try {
			url = new URL(imageUrl); // 다운로드 할 이미지 URL
			bi = ImageIO.read(url);
			ImageIO.write(bi, fileFormat, saveFile); // 저장할 파일 형식, 저장할 파일명
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}