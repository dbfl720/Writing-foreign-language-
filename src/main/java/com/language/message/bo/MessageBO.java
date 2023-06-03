package com.language.message.bo;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.language.message.dao.MessageRepository;
import com.language.message.entity.MessageEntity;
import com.language.user.model.User;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor //final이 붙거나 @NotNull 이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
@Service
public class MessageBO {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final MessageRepository messageRepository;    // final : 필드는 더 이상 수정이 불가능
    private final User user;
    
 
    // insert - 메세지 보내기
    @Transactional
    public MessageEntity addMessage(
    		int userId, int receiverId, String title, String content) {
    	
    	return messageRepository.save(MessageEntity.builder()
    			.userId(userId)
    			.receiverId(receiverId)
    			.title(title)
    			.content(content)
    			.build());
    	
    }
    
    
    
}
