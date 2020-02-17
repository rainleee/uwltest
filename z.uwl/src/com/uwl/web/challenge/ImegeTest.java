package com.uwl.web.challenge;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ImegeTest {

	public ImegeTest() {
		// TODO Auto-generated constructor stub
	}
	
	//private static String URL = "https://www.google.com/search?q=%EB%B9%A8%EA%B0%84%EC%98%B7&newwindow=1&gbv=2&source=lnms&tbm=isch&sa=X&ved=2ahUKEwift6a57dHnAhULfd4KHZyIDyYQ_AUoAXoECAwQAw&biw=1600&bih=757";
	//private static String URL = "https://search.naver.com/search.naver?where=nexearch&query=3%ED%98%B8%EC%84%A0&sm=top_lve.agallgrpmamsi0en0sp0&ie=utf8";
	private static String URL = "https://search.naver.com/search.naver?where=image&sm=tab_jum&query=%EB%B9%A8%EA%B0%84%EC%98%B7";
	public static void main(String[] args) throws Exception {
		
		String category = "닮은꼴";
		String concept = "강아지상";
		String name = "";
		 Document doc = Jsoup.connect(URL).get();
	        String folder = doc.title();
	        System.out.println("folder : " + folder);
	        //Element element = doc.select(".img_area img").get(0);
	       // System.out.println("element : " + element);
	        Elements img = doc.select(".img_area img");
	        //System.out.println("img : " + img);
	       // System.out.println("===========================");
	        int page = 0;
	        int i = 0;
	        for (Element e : img) {
	            //String url = e.getElementsByAttribute("src").attr("src");
	            String url2 = e.getElementsByAttribute("src").attr("data-source");
	            String result = url2.substring(0,url2.lastIndexOf("&"));
	            
	            //System.out.println("result " + (++i) + ": "+ result);
//	            System.out.println("=====================================");
	            
	            URL imgUrl = new URL(result);
	            BufferedImage jpg = ImageIO.read(imgUrl);
	           // System.out.println("jpg : " + jpg);
	            File file = new File("C:\\Users\\user\\Desktop\\image\\"+category+"\\"+concept, name + (++i) + ".jpg");
	            System.out.println("file : " + file);
//	            File file = new File("https://search.pstatic.net/common/?src="+result+"\\"+page+".jpg");
	            ImageIO.write(jpg, "jpg", file);
	           // System.out.println("여기까지오냐 : " + ImageIO.write(jpg, "jpg", file));
	         //   page+=1;

	}
	        
	}
	
 }
