package com.language.live.model;

import com.language.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LiveView {

	
		// 글 1개
		private Live live;
		
		// 글쓴이 정보
		private User user;
		
		
}
