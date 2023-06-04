package com.language.message.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.language.message.entity.MessageEntity;


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
	void 메시지조회ByUserId() {
		logger.info("###### 메시지 조회하기");
		List<MessageEntity> message = messageBO.getMessageListByReceiverId(1);
		assertNotNull(message);
		
	}
	
	
	//@Test
	void test() {
		fail("Not yet implemented");
	}

}
