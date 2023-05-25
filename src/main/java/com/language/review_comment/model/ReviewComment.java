package com.language.review_comment.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewComment {
	
	private int id;
	private int reviewId;
	private int userId;
	private String content;
	private Date createdAt;
	private Date updatedAt;
}
