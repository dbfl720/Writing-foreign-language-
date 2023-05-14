package com.language.grammar.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Grammar {
	
	private int id;
	private String loginId;
	private String languageCategoryId;
	private String title;
	private String content;
	private Date createdAt;
	private Date updatedAt;
}
