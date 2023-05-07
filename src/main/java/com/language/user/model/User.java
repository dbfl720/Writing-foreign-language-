package com.language.user.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
	
	private int id;
	private int nativeCategoryId;
	private int foreignCategoryId;
	private String loginId;
	private String password;
	private String salt;
	private String email;
	private String selfIntroduction;
	private String languageGoals;
	private String ImagePath;
	private Date createdAt;
	private Date updatedAt;
	
	
	
}
