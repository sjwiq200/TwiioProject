package com.twiio.good.service.user.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.FaceAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;
import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Properties;
import com.twiio.good.service.domain.Transaction;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.domain.UserEval;
import com.twiio.good.service.transaction.TransactionDao;
import com.twiio.good.service.user.UserDao;
import com.twiio.good.service.user.UserService;



//==> 회원관리 서비스 구현
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}	
	
	@Autowired
	@Qualifier("transactionDaoImpl")
	private TransactionDao transactionDao;	
	public void setTransactionDao(TransactionDao transactionDao) {
		this.transactionDao = transactionDao;
	}

	@Value("#{apikeyProperties['googleAPPKey']}")
	String googleAPPKey;
	
	
	@Value("#{apikeyProperties['googleAPPSecretKey']}")
	String googleAPPSecretKey;
	
	////////사진 업로드////////
	@Value("#{commonProperties['path']}")
	String path;

	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.getUser(userId);
	}

	@Override
	public User getUserInNo(int userNo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.getUserInNo(userNo);
	}

	@Override
	public Map<String, Object> listUser(Search search) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> list = userDao.listUser(search);
		int totalCount = userDao.getTotalCount(search);
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.updateUser(user);
	}

	@Override
	public void deleteUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.deleteUser(user);
	}
	
	@Override
	public String findId(User user) throws Exception {
		// TODO Auto-generated method stub
		return userDao.findId(user);
	}


	@Override
	public void findPassword(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User kakaoLogin(String access_token) throws Exception {
		
		String getPersnalInfoUrl = "https://kapi.kakao.com/v1/user/me"; // 로그인후 사용자 정보 받아 오기위한 url

        String token_type = "token_type";
        HttpsURLConnection conn = null;
        OutputStreamWriter writer = null;
        BufferedReader reader = null;
        InputStreamReader isr= null;
        URL url = null;            

        url = new URL(getPersnalInfoUrl);

        conn = (HttpsURLConnection) url.openConnection();
        conn.setRequestProperty("Authorization", "Bearer "  +access_token.trim());
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setRequestProperty("charset", "utf-8");
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        writer = new OutputStreamWriter(conn.getOutputStream());
        writer.flush();

        int responseCodeResult = conn.getResponseCode();
        System.out.println("Sending 'POST' request to URL : " + getPersnalInfoUrl); // v1/user/me로 사용자 정보 요청 
        System.out.println("Response Code : " + responseCodeResult);

        InputStreamReader isr2= null;
        isr2 = new InputStreamReader(conn.getInputStream());
        reader = new BufferedReader(isr2);

        JSONObject jsonobj = (JSONObject)JSONValue.parse(reader);

        System.out.println("jsonobj Result : " + jsonobj);

        ObjectMapper objectMapper = new ObjectMapper();

		 	User user = objectMapper.readValue(jsonobj.toString(), User.class);

		 	JSONObject jsonobjProperties = (JSONObject) jsonobj.get("properties");

		 	Properties properties = objectMapper.readValue(jsonobjProperties.toString(), Properties.class);
		 	
		 	System.out.println(user);
		 	System.out.println(properties);
	 	
		 	String email = user.getKaccount_email();
		 	String id = user.getId();
		 	String name = properties.getNickname();   		 	
		 	
		 	User dbUser = new User();
		 	
        	if(userDao.getUser(id) == null) {
        		System.out.println("카카오톡 로그인 아이디 이력 없음");

        		//user = new User();
        		user.setUserId(id);
        		user.setUserEmail(email);
        		user.setUserName(name);            		
        		user.setUserRegisterType("K");
        		userDao.addUser(user);

        		dbUser = userDao.getUser(id);
        		
        		System.out.println(name+"님이 카카오톡을 통해 새로 가입하셨습니다. ");            		
        		
        	}else {     		
        		System.out.println(":: kakao Login ::");
    			
        		dbUser = userDao.getUser(id);
    			          		 
        	}            	


        writer.close();
        reader.close();
        isr2.close();
        conn.disconnect();
        
        return dbUser;	
	}


	@Override
	public User googleLogin(String code) throws Exception {
		// HTTP POST전송
		URL AccessTokenURL = new URL("https://accounts.google.com/o/oauth2/token");
		HttpURLConnection http = (HttpURLConnection) AccessTokenURL.openConnection();

		http.setDoOutput(true);
		http.setRequestProperty("Content-type", "application/x-www-form-urlencoded");

		String appKey = "733503970005-o1b49h0gsl2ajne6adkbph2ti7a5en3e.apps.googleusercontent.com";
		String appSecret = "QpCX0BN2dB4aiU846LtJLWEd";
		String redirect_url = "http://127.0.0.1:8080/user/googleLogin";

		StringBuffer buffer = new StringBuffer();
		buffer.append("grant_type=authorization_code&code=" + code + "&client_id=" + googleAPPKey + "&client_secret="
			+ googleAPPSecretKey + "&redirect_uri=" + redirect_url);

		// 데이터 전송
		OutputStreamWriter outStream = new OutputStreamWriter(http.getOutputStream(), "UTF-8");
		PrintWriter writer = new PrintWriter(outStream);
		writer.write(buffer.toString());
		writer.flush();

		// 결과값을 불러온다.
		InputStreamReader inputStream = new InputStreamReader(http.getInputStream(), "UTF-8");
		BufferedReader bufferReader = new BufferedReader(inputStream);
		StringBuilder builder = new StringBuilder();
		String str;
		while ((str = bufferReader.readLine()) != null) {
			builder.append(str + "\n");
		}

		String json_result = builder.toString();

		System.out.println("json_result : " + json_result);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(json_result);

		String access_token = (String) jsonObject.get("access_token");
		String id_token = (String) jsonObject.get("id_token");

		URL url = new URL("https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + access_token);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();

		BufferedReader br = null;

		if (responseCode == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}

		String jsonData = "";
		StringBuffer response1 = new StringBuffer();

		while ((jsonData = br.readLine()) != null) {
			response1.append(jsonData);
		}

		String reader = response1.toString();
		br.close();

		JSONObject jsonobj = (JSONObject) JSONValue.parse(reader);
		System.out.println("jsonobj : " + jsonobj);
		ObjectMapper objectMapper = new ObjectMapper();

		User googleUser = objectMapper.readValue(jsonobj.toString(), User.class);

		System.out.println("googleUser : " + googleUser);

		User dbUser = new User();
		if (userDao.getUser(googleUser.getId()) != null) {
			System.out.println(":: google Login ::");

			dbUser = userDao.getUser(googleUser.getId());
			//session.setAttribute("user", dbUser);
		} else {
			System.out.println("구글 로그인 아이디 이력 없음");
			
			googleUser.setUserId(googleUser.getId());
			googleUser.setUserEmail(googleUser.getEmail());
			googleUser.setUserName(googleUser.getFamily_name() + googleUser.getGiven_name());
			googleUser.setUserRegisterType("G");

			userDao.addUser(googleUser);
			dbUser = googleUser;
			//session.setAttribute("user", googleUser);
			System.out.println(googleUser.getUserName() + "님이 구글을 통해 새로 가입하셨습니다. ");
		}

		return dbUser;
	}		
	
	@Override
	public boolean detectFace(User user) throws Exception, IOException {

		System.out.println(":: detectFaces start!! :: ");
		boolean flag = false;
		System.out.println(user.getFile().getContentType());
		// System.out.println(file.getName());
		System.out.println("업로드시 파일 이름 :: "+user.getFile().getOriginalFilename());
		// System.out.println(file.toString());

		List<AnnotateImageRequest> requests = new ArrayList<AnnotateImageRequest>();
		//String fileName = file.getOriginalFilename();
		String fileName = user.getUserId()+user.getFile().getOriginalFilename();
		System.out.println("실제 저장 될 파일 이름 :: "+fileName);
		
		PrintStream out = System.out;
		// String filePath=file.getOriginalFilename();
		// File file02=new File("C:\\Users\\bitcamp\\Desktop\\pic\\", fileName);
		File file02 = new File(path, fileName);
		user.getFile().transferTo(file02);
		// ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(file02));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.TYPE_UNSPECIFIED.FACE_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				// System.out.println("[[[res]]]===================> :"+res);
				if (res.hasError()) {
					out.printf("Error: %s\n", res.getError().getMessage());
					flag = false;
				}
				System.out.println("오냐?");
				if (res.getFaceAnnotationsList().size() != 1) {
					// out.close();
					System.gc();
					System.runFinalization();
					if (file02.exists() == true) {
						boolean boo = file02.delete();
						System.out.println(boo);
					}

					System.out.println("파일삭제");
					flag = false;

				} else {

					// For full list of available annotations, see http://g.co/cloud/vision/docs
					for (FaceAnnotation annotation : res.getFaceAnnotationsList()) {
						System.out.println("오예");
						out.printf(
								// "anger: %s\njoy: %s\nsurprise: %s\nposition: %s",
								// annotation.getAngerLikelihood(),
								// annotation.getJoyLikelihood(),
								// annotation.getSurpriseLikelihood(),
								"position: %s",
								// annotation.getAllFields(),
								// annotation.getFdBoundingPoly(),
								// annotation.,
								annotation.getBoundingPoly());
					}
					// out.close();
					System.gc();
					System.out.println("업로드 성공");
					flag = true;
				}				

			}
			// System.out.println(responses);
			// System.out.println(responses.size());
			// if(responses.size())
		}
		System.out.println(":: detectFaces end ::");
		
		return flag;
	}	

	@Override
	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		User user=userDao.getUser(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}

	@Override
	public void addEvalUser(UserEval tagetUser, User evalUser, String scheduleNo) throws Exception {
		userDao.addEvalUser(tagetUser, evalUser, scheduleNo);
	}

	@Override
	public Map<String, Object> listStarEvalHost(Search search, int hostNo) throws Exception {
		String evalType="host";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("productNo", hostNo);
		map.put("evalType", evalType);
		List<Transaction> list = transactionDao.listStarEval(map);
		int totalCount = transactionDao.getTotalCount(map);
		
		//map.clear();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public List<Transaction> listBestHost(Search search) throws Exception {
		String evalType="host";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Search", search);
		map.put("evalType", evalType);
		
		return transactionDao.listBest(map);
	}

	@Override
	public String getEvalUser(String userId) throws Exception {
		return userDao.getEvalUser(userId);
	}

	@Override
	public Transaction getEvalHost(int hostNo) throws Exception {
		String evalType="host";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostNo", hostNo);
		map.put("evalType", evalType);
		return transactionDao.getEval(map);
	}

}
