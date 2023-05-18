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
}
