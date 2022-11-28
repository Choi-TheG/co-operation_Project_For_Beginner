package com.project.asc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.MessageDAO;
import com.project.asc.vo.MessageVO;

@Service("messageService")
public class MessageService {

	@Autowired
	private MessageDAO messageDAO;
	
	public ArrayList<MessageVO> selectMessageList(int userSeq){
		ArrayList<MessageVO> list = null;
		
		list = messageDAO.selectMessageList(userSeq);
		
		return list;
	}
	
	public MessageVO selectMessageOne(int messageSeq) {
		MessageVO message = null;
		
		message = messageDAO.selectMessageOne(messageSeq);
		
		return message;
	}
	
	public boolean inviteProjectConfirm(MessageVO message) {
		boolean flag = false;
		
		flag = messageDAO.inviteProjectConfirm(message);
		
		return flag;
	}
	
	public boolean inviteProjectReject(MessageVO message) {
		boolean flag = false;
		
		flag = messageDAO.inviteProjectReject(message);
		
		return flag;
	}
	
	/* 안 읽은 메세지 유무 */
	public boolean unReadingMessage(int userSeq) {
		boolean flag = false;
		
		flag = messageDAO.unReadingMessage(userSeq);
		
		return flag;
	}
}
