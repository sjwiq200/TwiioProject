package com.twiio.good.web.information;



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/travelwarning/*")
public class TravelWarning{
	/*
	 * 
	 * 
	 * imgURL2�� ������� amp;�� �پ ���� ��������� ��!
	 */

	public TravelWarning() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="/json/travelWarning")
	public void travelWarning() {
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1262000/TravelWarningService/getTravelWarningList"); /*URL*/
		String serviceKey = "1obW8Fd3%2Fa%2Fx6VMqcVXMXHHC1XdWUfZPz4rVrp6HEIS9gMQISnEEG5Sii3JDnIw%2BhJjKiE8tTCSOo6HmXg74mw%3D%3D";
		try {
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*�� ������ ��� ��*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*������ ��ȣ*/
        urlBuilder.append("&" + URLEncoder.encode("countryName","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*�ѱ� ������(ISO�����ڵ�� �ߺ���ȸ �� �� ����)*/
        urlBuilder.append("&" + URLEncoder.encode("countryEnName","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*���� ������(ISO�����ڵ�� �ߺ���ȸ �� �� ����)*/
        urlBuilder.append("&" + URLEncoder.encode("isoCode1","UTF-8") + "=" + URLEncoder.encode("MYS", "UTF-8")); /*ISO �����ڵ�*/
        urlBuilder.append("&" + URLEncoder.encode("IsoCode2","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*ISO �����ڵ�*/
        urlBuilder.append("&" + URLEncoder.encode("IsoCode3","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*ISO �����ڵ�*/
        urlBuilder.append("&" + URLEncoder.encode("IsoCode4","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*ISO �����ڵ�*/
        urlBuilder.append("&" + URLEncoder.encode("IsoCode5","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*ISO �����ڵ�*/
        urlBuilder.append("&" + URLEncoder.encode("IsoCode6","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*ISO �����ڵ�*/
        urlBuilder.append("&" + URLEncoder.encode("IsoCode7","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*ISO �����ڵ�*/
        urlBuilder.append("&" + URLEncoder.encode("IsoCode8","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*ISO �����ڵ�*/
        urlBuilder.append("&" + URLEncoder.encode("IsoCode9","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*ISO �����ڵ�*/
        urlBuilder.append("&" + URLEncoder.encode("IsoCode10","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*ISO �����ڵ�*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
    
	}

}
