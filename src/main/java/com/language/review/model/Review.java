package com.language.review.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Review {
	
	private int id;
	private int userId;
	private String reviewCategoryId;
	private String languageCategoryId;
	private String title;
	private int rating;
	private String content;
	private String ImagePath;
	private Date createdAt;
	private Date updatedAt;
	
	 
}
