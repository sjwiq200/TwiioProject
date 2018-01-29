package com.twiio.good.service.mypage;

import java.util.List;
import java.util.Map;

import com.twiio.good.common.Search;
import com.twiio.good.service.domain.Community;
import com.twiio.good.service.domain.Message;

public interface MyPageDao {
	public void addMessage(Message message) throws Exception;
	public Message getMessage(int messageNo) throws Exception;
	public void deleteMessage(int messageNo) throws Exception;
	public List<Message> listMessage(Search search, int userNo) throws Exception;
	public int getTotalCountMessage(int userNo) throws Exception;
}
