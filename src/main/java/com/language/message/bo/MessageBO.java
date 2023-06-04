package com.language.message.bo;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.message.dao.MessageRepository;
import com.language.message.entity.MessageEntity;
import com.language.message.entity.MessageView;
import com.language.user.bo.UserBO;
import com.language.user.model.User;


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
    
    
    
    // select - 유저 명단
    public List<MessageEntity> getMessageListByReceiverId(int receiverId){
    	return messageRepository.findByReceiverId(receiverId);
    }
    
    
    
    
    // select - 가공 메세지
    public List<MessageView> generateMessageList(int receiverId) {
    	
    	List<MessageView> messageViewList = new ArrayList<>(); // []
    	
    	// message들
    	List<MessageEntity> messageList = messageRepository.findByReceiverId(receiverId);
    	
    	// MessageEntity => MessageView
    	for(MessageEntity message : messageList) {
    		MessageView card = new MessageView();
    		
		// message 하나 
        card.setMessageEntity(message);
    	
    	// 유저 정보
    	User user = userBO.getUserById(message.getReceiverId());  // 유저 정보는 메세지 안에 들어있기 때문
    	card.setUser(user);
    	
    	// 카드 리스트 채우기
    	messageViewList.add(card);
    	
    	}
    	
    	return messageViewList;
    }
    
    

}
