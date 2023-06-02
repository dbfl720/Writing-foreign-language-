package com.language.message.dto;

import com.language.message.entity.MessageEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessageDto {
	   private String title;
	    private String content;
	    private String senderName;
	    private String receiverName;

	    public static MessageDto toDto(MessageEntity messageEntity) {
	        return new MessageDto(
	        		messageEntity.getTitle(),
	        		messageEntity.getContent(),
	        		messageEntity.getSender().getName(),
	        		messageEntity.getReceiver().getName()
	        );
	    }
}
