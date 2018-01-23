package com.twiio.good.service.information.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.twiio.good.service.domain.Currency;
import com.twiio.good.service.information.InformationDao;


@Repository("informationDaoImpl")
public class InformationDaoImpl implements InformationDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public InformationDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<Currency> getCurrency() throws Exception {
		String key = "4RKuUFR6wEpqdppFDxmGS1RkUztGUN9W";
		String req = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey="+key+"&data=AP01&searchdate=20180119";
		
		URL url = new URL(req);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        
        int responseCode = con.getResponseCode();
		
        BufferedReader br = null;
        System.out.println(responseCode);
	        if(responseCode==200) { 
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
	        } else {  // 에러 발생
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
	        }
      //JSON Data 읽기
        String jsonData = "";
        JSONArray json = null;
        StringBuffer response = new StringBuffer();
        ObjectMapper objMapper = new ObjectMapper();
        List<Currency> returnList = new ArrayList<Currency>();
        
	        while ((jsonData = br.readLine()) != null) {
	            
	        	//json = (JSONArray)JSONValue.parse(jsonData+"\n");
	        	
	        	response.append(jsonData);
	        }
	        br.close();
	        //String jsonMany = objMapper.writeValueAsString(response);
	        returnList = objMapper.readValue(response.toString(),new TypeReference<List<Currency>>() {
			});
	        for(int i = 0; i<returnList.size(); i++) {
	        	sqlSession.update("InformationMapper.updateCurrency", returnList.get(i));
	        }
		return returnList;
	}

	@Override
	public List getFlight() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getHotel() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getUnsafeRegion() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getWeather() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List listNightLife() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getNightLifeDetail() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
