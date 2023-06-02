package com.language.message.bo;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.language.message.dao.MessageRepository;
import com.language.message.dto.MessageDto;
import com.language.message.entity.MessageEntity;
import com.language.userJPA.dao.UserRepository;
import com.language.userJPA.entity.UserEntity;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor //final이 붙거나 @NotNull 이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
@Service
public class MessageBO {

	private final MessageRepository messageRepository;
    private final UserRepository userRepository;
    
    @Transactional //@Transactional이 붙은 메서드는 메서드가 포함하고 있는 작업 중에 하나라도 실패할 경우 전체 작업을 취소한다.
    public MessageDto write(MessageDto messageDto) {
        UserEntity receiver = userRepository.findByName(messageDto.getReceiverName());
        UserEntity sender = userRepository.findByName(messageDto.getSenderName());

        MessageEntity message = new MessageEntity();
        message.setReceiver(receiver);
        message.setSender(sender);

        message.setTitle(messageDto.getTitle());
        message.setContent(messageDto.getContent());
        message.setDeletedByReceiver(false);
        message.setDeletedBySender(false);
        messageRepository.save(message);

        return MessageDto.toDto(message);
    }
}
