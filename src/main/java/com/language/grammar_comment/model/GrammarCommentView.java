package com.language.grammar_comment.model;

import com.language.user.model.User;

import lombok.Getter;
import lombok.Setter;

// 댓글 하나
@Getter
@Setter
public class GrammarCommentView {

	private GrammarComment grammarComment;
	
	
	private User user;
	
	// 좋아요 개수
	private int likeCount;
	
	// 내가 좋아요 한지 여부 boolean
	private boolean filledLike; // 기본값 false 
}
