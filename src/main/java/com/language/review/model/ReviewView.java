package com.language.review.model;

import com.language.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewView {

	private Review review;
	
	private User user;
	
	private int reviewCount;
}
