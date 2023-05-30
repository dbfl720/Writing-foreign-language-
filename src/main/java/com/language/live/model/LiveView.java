package com.language.live.model;

import java.util.List;

import com.language.live_comment.model.LiveCommentView;
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
		
		// 댓글들
		private List<LiveCommentView> liveCommentList;
		
}
