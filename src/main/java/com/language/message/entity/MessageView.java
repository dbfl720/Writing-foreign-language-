package com.language.message.entity;

import com.language.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageView {
	
	
	// TO do : 메세지들로 바꾸기. 
	private MessageEntity messageEntity;
	
	// 유저 정보
	private User user;
	
}
