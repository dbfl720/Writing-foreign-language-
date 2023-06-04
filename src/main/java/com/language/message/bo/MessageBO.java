package com.language.message.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.message.dao.MessageRepository;
import com.language.message.entity.MessageEntity;
import com.language.user.bo.UserBO;


@Service
public class MessageBO {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
    @Autowired
    private MessageRepository messageRepository;
    
    
    @Autowired
    private UserBO userBO;
    
    
    
 
    // insert - 메세지 보내기
    public MessageEntity addMessage(
    		int userId, int receiverId, String content) {
    	
    	return messageRepository.save(MessageEntity.builder()
    			.userId(userId)
    			.receiverId(receiverId)
    			.content(content)
    			.build());
    	
    }
    
    
    
    // select 
    public List<MessageEntity> getMessageListByUserId(int userId){
    	return messageRepository.findByUserId(userId);
    }
    
    
    // select - 메세지 리스트 유저 명단
//    public List<MessageEntity> getMessageList(){
//    	return messageRepository.findAllByOrderByIdDesc();
//    }
}
