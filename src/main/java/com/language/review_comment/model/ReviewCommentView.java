package com.language.review_comment.model;

import java.util.List;

import com.language.live_comment.model.LiveCommentView;
import com.language.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewCommentView {

	private ReviewComment reviewComment;
	
	private User user;
	

	
	
}
