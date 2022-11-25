package com.project.asc.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.MessageVO;
import com.project.asc.vo.TeamMemberVO;

@Repository("messageDAO")
public class MessageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<MessageVO> selectMessageList(int userSeq){
		ArrayList<MessageVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.message.selectMessageList",userSeq);
		
		return list;
	}
	
	public MessageVO selectMessageOne(int messageSeq) {
		MessageVO message = null;
		
		message = sqlSession.selectOne("mapper.message.selectMessageOne",messageSeq);
		
		int affectedCount = sqlSession.update("mapper.message.updateMessageReadCount",messageSeq);
		
		return message;
	}
	
	public boolean inviteProjectConfirm(MessageVO message) {
		boolean flag = false;
		
		
		//확인 메세지 전달
		sqlSession.insert("mapper.message.createInviteConfirmMessage",message);
		
		//팀 합류
		Map<String, String> map = new HashMap<String, String>();
		map.put("userSeq", String.valueOf(message.getFromUserSeq()));
		map.put("teamId", message.getTeamId());
		sqlSession.insert("mapper.teamMember.insertInviteUser",map);
		
		System.out.println("message_seq : "+ message.getMessageSeq());
		
		//기존 메세지 타입 변경
		sqlSession.update("mapper.message.updateMessageTypeConfirm",message.getMessageSeq());
		
		return flag;
	}
	
	public boolean inviteProjectReject(MessageVO message) {
		boolean flag = false;
		
		//거절 메세지 전달
		sqlSession.insert("mapper.message.createInviteRejectMessage",message);
					
		//기존 메세지 타입 변경
		sqlSession.update("mapper.message.updateMessageTypeReject",message.getMessageSeq());
		
		return flag;
	}
	
	/* 안 읽은 메세지 유무 */
	public boolean unReadingMessage(int userSeq) {
		boolean flag = false;
		
		int unReadingMessageCount = sqlSession.selectOne("mapper.message.unReadingMessageYn",userSeq);
		
		if(unReadingMessageCount > 0) {
			flag = true;
		}
		
		return flag;
	}
}
