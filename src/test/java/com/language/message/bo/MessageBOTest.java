package com.language.message.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.language.message.entity.MessageEntity;
import com.language.message.entity.MessageView;


@SpringBootTest
class MessageBOTest {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	MessageBO messageBO;
	
	
	
	//@Transactional // insert 후 다시 rollback
	//@Test
	void 메세지보내기() {
		logger.info("########### 메세지 보내기 ");
		messageBO.addMessage(7, 7, "content");
	}
	
	
	
	
	//@Transactional
	//@Test
	void 메시지리스트조회ByUserId() {
		logger.info("###### 메시지 리스트 조회하기");
		List<MessageEntity> message = messageBO.getMessageListByUserId(3);
		assertNotNull(message);
		
	}
	
	
	//@Transactional
	//@Test
	void 받는_편지함_가공메세지() {
		logger.info("######## 가공 메세지 받는 편지함리스트 By receiverId");
		List<MessageView> messageView = messageBO.generateMessageList(3);
		assertNotNull(messageView);
	}
	
	
	
	
	//@Transactional
	//@Test
	void 보낸_편지함_가공메세지() {
		logger.info("######## 가공 메세지 보낸 편지함리스트 By receiverId");
		List<MessageView> messageView = messageBO.generateOutBoxMessageList(9);
		assertNotNull(messageView);
	}
	
	
	
	
	//@Transactional
	//@Test
	void 메시지_삭제() {
		logger.info("########### 메세지 삭제");
		messageBO.deleteMessageById(3);
	}
	
	
	
	//@Test
	void test() {
		fail("Not yet implemented");
	}

}
