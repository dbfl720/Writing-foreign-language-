package com.language.community.model;

import com.language.user.model.User;

import lombok.Getter;
import lombok.Setter;

// View용 객체 - db부화 막을 수 있음. - mvc modle 아님    // 즉, 가공하는 객체) // 데이터를 여기에 담음.
//글 1개와 매핑됨, 즉 카드 하나 .
@Getter
@Setter
public class CommunityView {
	
	// 글쓴이 정보
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
