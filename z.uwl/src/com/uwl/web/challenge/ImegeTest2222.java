package com.uwl.web.challenge;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ImegeTest2222 {

	public ImegeTest2222() {
		// TODO Auto-generated constructor stub
	}
	
	private static String URL = "https://search.daum.net/search?nil_suggest=btn&w=img&DA=SBC&q=%EB%B9%A8%EA%B0%84+%ED%8B%B0%EC%85%94%EC%B8%A0";
	public static void main(String[] args) throws Exception {
		
		 Document doc = Jsoup.connect(URL).get();
	        String folder = doc.title();
	        System.out.println("folder : " + folder);
	        Elements img = doc.select(".wrap_thumb img");
	        int page = 0;
	        System.out.println("aaaas");
	        for (Element element : img) {
	            String url = element.getElementsByAttribute("src").attr("src");
	            
	            URL imgUrl = new URL(URL);
	            BufferedImage jpg = ImageIO.read(imgUrl);
	            System.out.println("jpg ; " + jpg);
	            File file = new File("C:\\Users\\user\\Desktop\\image"+folder+"\\"+page+".jpg");
	            ImageIO.write(jpg, "jpg", file);
	            page+=1;
	            System.out.println("되냐?");

	}
	        
	}
	
}
