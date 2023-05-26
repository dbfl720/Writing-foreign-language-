package com.language.review.model;

import java.util.List;

import com.language.review_comment.model.ReviewCommentView;
import com.language.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewView {

	private Review review;
	
	private User user;
	
	private int reviewCount;
	
	private List<ReviewCommentView> reveiwCommentViewList;
}
