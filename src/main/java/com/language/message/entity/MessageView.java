package com.language.message.entity;

import com.language.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageView {
	
	
	
	private MessageEntity messageEntity;
	
	// 유저 정보
	private User user;
	
}
