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
import java.net.URLDecoder;
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



//==> ȸ������ ���� ����
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
	
	////////���� ���ε�////////
	@Value("#{commonProperties['userFaceFilePath']}")
	String userFaceFilePath;

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
	public List<User> listUserForSharedMainPlan(int mainPlanNo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.listUserForSharedMainPlan(mainPlanNo);
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
		
		String getPersnalInfoUrl = "https://kapi.kakao.com/v1/user/me"; // �α����� ����� ���� �޾� �������� url

        String token_type = "token_type";
        HttpsURLConnection conn = null;
        OutputStreamWriter writer = null;
        BufferedReader reader = null;
        InputStreamReader isr= null;
        URL url = null;            

        url = new URL(getPersnalInfoUrl);

        conn = (HttpsURLConnection) url.openConnection();
        conn.setRequestProperty("Authorization", "Bearer "  +access_token.trim());
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("charset", "utf-8");
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        writer = new OutputStreamWriter(conn.getOutputStream(),"UTF-8");
        writer.flush();

        int responseCodeResult = conn.getResponseCode();
        System.out.println("Sending 'POST' request to URL : " + getPersnalInfoUrl); // v1/user/me�� ����� ���� ��û 
        System.out.println("Response Code : " + responseCodeResult);

        InputStreamReader isr2= null;
        isr2 = new InputStreamReader(conn.getInputStream(),"UTF-8");
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
        		System.out.println("īī���� �α��� ���̵� �̷� ����");

        		//user = new User();
        		user.setUserId(id);
        		user.setUserEmail(email);
        		user.setUserName(name);            		
        		user.setUserRegisterType("K");
        		userDao.addUser(user);

        		dbUser = userDao.getUser(id);
        		
        		System.out.println(name+"���� īī������ ���� ���� �����ϼ̽��ϴ�. ");            		
        		
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
		// HTTP POST����
		URL AccessTokenURL = new URL("https://accounts.google.com/o/oauth2/token");
		HttpURLConnection http = (HttpURLConnection) AccessTokenURL.openConnection();

		http.setDoOutput(true);
		http.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//String appKey = "733503970005-o1b49h0gsl2ajne6adkbph2ti7a5en3e.apps.googleusercontent.com";
		//String appSecret = "QpCX0BN2dB4aiU846LtJLWEd";
		String redirect_url = "http://127.0.0.1:8080/user/googleLogin";

		StringBuffer buffer = new StringBuffer();
		buffer.append("grant_type=authorization_code&code=" + code + "&client_id=" + googleAPPKey + "&client_secret="
			+ googleAPPSecretKey + "&redirect_uri=" + redirect_url);

		// ������ ����
		OutputStreamWriter outStream = new OutputStreamWriter(http.getOutputStream(), "UTF-8");
		PrintWriter writer = new PrintWriter(outStream);
		writer.write(buffer.toString());
		writer.flush();

		// ������� �ҷ��´�.
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
			System.out.println("���� �α��� ���̵� �̷� ����");
			
			googleUser.setUserId(googleUser.getId());
			googleUser.setUserEmail(googleUser.getEmail());
			googleUser.setUserName(googleUser.getFamily_name() + googleUser.getGiven_name());
			googleUser.setUserRegisterType("G");

			userDao.addUser(googleUser);
			dbUser = googleUser;
			//session.setAttribute("user", googleUser);
			System.out.println(googleUser.getUserName() + "���� ������ ���� ���� �����ϼ̽��ϴ�. ");
		}

		return dbUser;
	}		
	
	@Override
	public Map<String, Object> detectFace(User user) throws Exception, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(":: detectFaces start!! :: ");
		String face = "";
		System.out.println(user.getFile().getContentType());
		// System.out.println(file.getName());
		System.out.println("���ε�� ���� �̸� :: "+user.getFile().getOriginalFilename());
		// System.out.println(file.toString());

		List<AnnotateImageRequest> requests = new ArrayList<AnnotateImageRequest>();
		//String fileName = user.getFile().getOriginalFilename();
		String fileName = user.getUserId()+"test.jpg";
		System.out.println("���� ���� �� ���� �̸� :: "+fileName);
		System.out.println("11111");
		PrintStream out = System.out;
		System.out.println("22222");
		// String filePath=file.getOriginalFilename();
		// File file02=new File("C:\\Users\\bitcamp\\Desktop\\pic\\", fileName);
		File file02 = new File(userFaceFilePath, fileName);
		System.out.println("33333");
		user.getFile().transferTo(file02);
		System.out.println(user.getFile());
		System.out.println(file02);
		System.out.println("44444");
		// ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(file02));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.TYPE_UNSPECIFIED.FACE_DETECTION).build();
		System.out.println("55555");
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		System.out.println("66666");
		requests.add(request);
		System.out.println("77777");
		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			System.out.println("00000");
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			System.out.println("88888");
			List<AnnotateImageResponse> responses = response.getResponsesList();
			System.out.println("99999");
			for (AnnotateImageResponse res : responses) {
				// System.out.println("[[[res]]]===================> :"+res);
				if (res.hasError()) {
					out.printf("Error: %s\n", res.getError().getMessage());
					face = user.getUserImage();
					map.put("face", face);
					map.put("flag", "0");
				}
				System.out.println("����?");
				if (res.getFaceAnnotationsList().size() != 1) {
					// out.close();
					
					/*if(user.getUserNo()!=null) {
						if(userDao.getUserInNo(user.getUserNo()).getUserImage()!=null) {
							
						}
					}*/
					System.gc();
					System.runFinalization();
					if (file02.exists() == true) {
						boolean boo = file02.delete();
						System.out.println(boo);
					}

					System.out.println("���ϻ���");
					face = user.getUserImage();
					map.put("face", face);
					map.put("flag", "0");

				} else {

					// For full list of available annotations, see http://g.co/cloud/vision/docs
					for (FaceAnnotation annotation : res.getFaceAnnotationsList()) {
						System.out.println("����");
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
					System.gc();
					System.runFinalization();
					if (file02.exists() == true) {
						boolean boo = file02.delete();
						System.out.println(boo);
						System.out.println("test ���ϻ���");
					}
					
					String realName = user.getUserId()+".jpg";
					File file03 = new File(userFaceFilePath, realName);
					user.getFile().transferTo(file03);
					// out.close();
					//System.gc();
					System.out.println("���ε� ����");
					face = realName;
					map.put("face", face);
					map.put("flag", "1");
				}				

			}
			// System.out.println(responses);
			// System.out.println(responses.size());
			// if(responses.size())
		}
		System.out.println(":: detectFaces end ::");
		
		return map;
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
	public void addEvalUser(UserEval tagetUser) throws Exception {
		userDao.addEvalUser(tagetUser);
	}
	public int addEvalUserCheck(UserEval userEval) throws Exception{
		return userDao.addEvalUserCheck(userEval);
	}

	@Override
	public Map<String, Object> listStarEvalHost(Search search, int hostNo) throws Exception {
		String evalType="host";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("hostNo", hostNo);
		map.put("evalType", evalType);
		User user = new User();
		user.setUserType("0");
		map.put("user", user);
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
	public User getEvalUser(int userNo) throws Exception {
		return userDao.getEvalUser(userNo);
	}

	@Override
	public Transaction getEvalHost(int hostNo) throws Exception {
		String evalType="host";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hostNo", hostNo);
		map.put("evalType", evalType);
		return transactionDao.getEval(map);
	}

	@Override
	public void sendMail(String emai, String authNum) throws Exception {
		 userDao.sendMail(emai, authNum);
	}

	@Override
	public void updateSharedPlan(int userNo,String mainPlanNo) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userNo", userNo);
		map.put("mainPlanNoShared", mainPlanNo);
		userDao.updateSharedPlan(map);
		
	}
}
