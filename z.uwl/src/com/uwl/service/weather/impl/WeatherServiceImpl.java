package com.uwl.service.weather.impl;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.uwl.service.domain.Weather;
import com.uwl.service.weather.WeatherService;

import java.io.BufferedReader;

@Service
public class WeatherServiceImpl implements WeatherService {

	@Value("#{apiProperties['weatherKey']}")
	String weatherKey;

	public WeatherServiceImpl() {
		super();
	}

	@Override
	public Map getWeather(Weather weather) throws Exception {

		String x = "60";	//weather.getX;
		String y = "127";

//		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst"); /*URL*/
//        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "serviceKey"); /*Service Key*/
//        urlBuilder.append("=" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + weatherKey);
//        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
//        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode("date", "UTF-8")); 
//        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("time", "UTF-8")); /*05시 발표*/
//        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("x", "UTF-8")); /*예보지점 X 좌표값*/
//        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("y", "UTF-8")); /*예보지점의 Y 좌표값*/
//        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-ddHH", Locale.KOREA);

		Date currentTime = new Date();

		String mTime = mSimpleDateFormat.format(currentTime);
		System.out.println(mTime);

		String time = mTime.replaceAll("-", "");
		System.out.println(time);

		String date = time.substring(0, 8);

		String result = time.substring(time.length() - 2, time.length());
		System.out.println(result);

		String to = result;

		if (Integer.parseInt(to) >= 2 && Integer.parseInt(to) < 5) {
			to = "02";
			System.out.println("02 = " + to);
		} else if (Integer.parseInt(to) >= 5 && Integer.parseInt(to) < 8) {
			to = "05";
			System.out.println("05 = " + to);
		} else if (Integer.parseInt(to) >= 8 && Integer.parseInt(to) < 11) {
			to = "08";
			System.out.println("08 = " + to);
		} else if (Integer.parseInt(to) >= 11 && Integer.parseInt(to) < 14) {
			to = "11";
			System.out.println("11 = " + to);
		} else if (Integer.parseInt(to) >= 14 && Integer.parseInt(to) < 17) {
			to = "14";
			System.out.println("14 = " + to);
		} else if (Integer.parseInt(to) >= 17 && Integer.parseInt(to) < 20) {
			to = "17";
			System.out.println("17 = " + to);
		} else if (Integer.parseInt(to) >= 20 && Integer.parseInt(to) < 23) {
			to = "20";
			System.out.println("20 = " + to);
		} else {
			to = "23";
			System.out.println("23 = " + to);
		}

		System.out.println("날짜 = " + date + "\n시간 = " + to + "00" + "\nX = " + x + "\nY = " + y);

		try {

			String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?serviceKey=" + weatherKey
					+ "&numOfRows=10&pageNo=1&base_date=" + date + "&base_time=" + to + "00&nx=" + x + "&ny=" + y
					+ "&dataType=json";

			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));

			JSONObject json = (JSONObject) JSONValue.parse(in);
			System.out.println("json   ::::    " + json);
			System.out.println("url = " + url);

			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> map = objectMapper.readValue(json.get("response").toString(),
					new TypeReference<Map<String, Object>>() {
					});

			System.out.println(map);

			Map<String, Object> jsonMap = (Map) ((Map) map.get("body")).get("items");
			System.out.println(jsonMap);

			List responseList = (List) jsonMap.get("item");
			Map<String, Object> map1 = new HashMap<String, Object>();
			Map<String, Object> returnMap = new HashMap<String, Object>();

			for (int i = 0; i < responseList.size(); i++) {

				map1 = (Map) (responseList.get(i));
				System.out.println(map1.get("category") + "\t" + map1.get("fcstValue"));

				if (map1.get("category").equals("SKY")) {
					returnMap.put("SKY", (String) map1.get("fcstValue"));
				} else if (map1.get("category").equals("PTY")) {
					returnMap.put("PTY", (String) map1.get("fcstValue"));
				}
			}

			System.out.println("returnMap : \t" + returnMap);
			return returnMap;
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("\n");
		return null;
	}
}
