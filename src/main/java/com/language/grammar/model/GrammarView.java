package com.language.grammar.model;

import java.util.List;

import com.language.grammar_comment.model.GrammarCommentView;
import com.language.user.model.User;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class GrammarView {

		private Grammar grammar;
		
		private User user;
		
		// 댓글들
		private List<GrammarCommentView> grammarCommentViewList;
		
		
}
