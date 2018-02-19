package com.twiio.good.service.user.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.net.ssl.HttpsURLConnection;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.User;
import com.twiio.good.service.domain.UserEval;
import com.twiio.good.service.user.UserDao;

	//==> 회占쏙옙占쏙옙占쏙옙 DAO CRUD 占쏙옙占쏙옙
	@Repository("userDaoImpl")
	public class UserDaoImpl implements UserDao{
		
		///Field
		@Autowired
		@Qualifier("sqlSessionTemplate")
		private SqlSession sqlSession;
		
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}
			
		public UserDaoImpl() {
			System.out.println(this.getClass());
		}
	
		@Override
		public void addUser(User user) throws Exception {
			System.out.println("DAO");
			sqlSession.insert("UserMapper.addUser", user);
			System.out.println("DAOend");
		}
	
		@Override
		public User getUser(String userId) throws Exception {
			System.out.println("userId :: "+userId);
			return  sqlSession.selectOne("UserMapper.getUser", userId);
		}
	
		@Override
		public User getUserInNo(int userNo) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("UserMapper.getUserInNo", userNo);
		}

		@Override
		public List<User> listUser(Search search) throws Exception {
			return sqlSession.selectList("UserMapper.listUser", search);
		}
		
		@Override
		public List<User> listUserForSharedMainPlan(int mainPlanNo) throws Exception {
			return sqlSession.selectList("UserMapper.listUserForSharedMainPlan", mainPlanNo);
		}
		
		@Override
		public void updateUser(User user) throws Exception {
			sqlSession.update("UserMapper.updateUser", user);
		}
		
		@Override
		public void updateSharedPlan(Map<String, Object> map) throws Exception {
			sqlSession.update("UserMapper.updateSharedPlan", map);
		}
		
		
		@Override
		public void deleteUser(User user) throws Exception {
			sqlSession.update("UserMapper.deleteUser", user);
		}
	

		public String findId(User user) throws Exception {
			// TODO Auto-generated method stub
			return  sqlSession.selectOne("UserMapper.findId", user);
		}

		@Override
		public void findPassword(User user) throws Exception {
			sqlSession.update("UserMapper.findPassword", user);
			
		}		

		@Override
		public void addEvalUser(UserEval tagetUser) throws Exception {
			sqlSession.insert("UserMapper.addEvalUser", tagetUser);			
		}
		
		public int addEvalUserCheck(UserEval userEval) throws Exception{
			return sqlSession.selectOne("UserMapper.addEvalUserCheck", userEval);
		}
	
		@Override
		public List getStarEvalHost(User user) throws Exception {
			// TODO Auto-generated method stub
			return null;
		}
	
		@Override
		public List listBestHost(User user) throws Exception {
			// TODO Auto-generated method stub
			return null;
		}
	
		@Override
		public void addStarEvalHost(User user) throws Exception {
			// TODO Auto-generated method stub
			
		}
	
		@Override
		public User getEvalUser(int userNo) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("UserMapper.getEvalUser", userNo);
		}
	
		@Override
		public String getEvalHost(String userId) throws Exception {
			
			return null;
		}
	
		@Override
		public int getTotalCount(Search search) throws Exception {
			return sqlSession.selectOne("UserMapper.getTotalCount", search);
		}

		@Override
		public void sendMail(String email, String authNum) throws Exception {
			
			String host = "smtp.gmail.com";// smtp서버
	         String subject = "Twiio 인증번호 전송";
	         String fromName = "Twiio 관리자";
	         String from = "eunae10193@gmail.com";// 관리자 메일 주소
	         String to = email;// 인증번호 받을 유저의이메일
	         
	         System.out.println("메일메일"+email+"인증번호"+authNum);
	         
	         String content = "Twiio 이메일 인증 메일입니다. \n\n 인증번호[ " + authNum + " ]\n\n 인증번호를 정확히 입력해 주세요 :D" ;
			
			try {

				Properties props = new Properties();
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", host);
				props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.port", "465");
				props.put("mail.smtp.user", from);
				props.put("mail.smtp.auth", "true");

				Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("eunae10193@gmail.com", "eunae1019");
					}
				});
				Message msg = new MimeMessage(mailSession);
				msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));

				InternetAddress[] address1 = { new InternetAddress(to) };
				msg.setRecipients(Message.RecipientType.TO, address1);// 占쌨는삼옙占�
				msg.setSubject(subject);// 占쏙옙占쏙옙占쏙옙占쏙옙
				msg.setSentDate(new Date());// 占쏙옙占쏙옙占쏙옙 占쏙옙짜
				msg.setContent(content, "text/html;charset=euc-kr");// 占쏙옙占쏙옙 占쏙옙占쏙옙(HTML占쏙옙占쏙옙)

				Transport.send(msg);// 占쏙옙占싹븝옙占쏙옙占쏙옙
				
			} catch (MessagingException e) {
				e.printStackTrace();

			} catch (Exception e) {
				e.printStackTrace();
			}

 
			
		}
		
	
	}
