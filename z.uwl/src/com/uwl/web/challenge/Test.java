package com.uwl.web.challenge;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test {

	public Test() {
		// TODO Auto-generated constructor stub
	}
	
	private static String URL = "http://www.jobkorea.co.kr/recruit/joblist?"; 
			
	
	public static void main(String[] args) throws Exception {
		
		//.get()을 해야 가져옴
		Document doc = Jsoup.connect(URL + getparameter(1)).get();
		
		//System.out.println("" + doc.toString());
		
		Elements elements = doc.select(".titBx a");
		Elements title = doc.select(".tplCo a");
		
		int i = 0;
		for (Element element : title) {
			//System.out.println( ++i + " ::" + element.toString());
			System.out.println( ++i + " ::" + element.text());
		}
		
		System.out.println("=================================");
		for (Element element : elements) {
			//System.out.println( ++i + " ::" + element.toString());
			System.out.println( ++i + " ::" + element.text());
		}
		
		

	}

	public static String getparameter(int PAGE) {
		
		String params = "menucode=local&local=I000#anchorHRCnt_1"+
						"page=" + PAGE + "&condition%5Blocal%5D=I000&condition%5Bmenucode%5D=local&direct=0&order=2&hrpagesize=10&tabindex=0&fulltime=0&confirm=0\r\n";
				
		return params;
	}
}
