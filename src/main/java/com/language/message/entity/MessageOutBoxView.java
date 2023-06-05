package com.language.message.entity;

import com.language.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageOutBoxView {


	
	// 유저 정보 - 받는 사람
	private User sender;
	
	
}
