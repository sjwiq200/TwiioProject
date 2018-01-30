package com.twiio.good.service.mypage;

import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Community;
import com.twiio.good.service.domain.Message;

public interface MyPageService {
	public void addMessage(Message message) throws Exception;
	public Message getMessage(int messageNo) throws Exception;
	public void deleteMessage(int messageNo) throws Exception;
	public Map<String, Object> listMessage(Search search, int userNo) throws Exception;
}
