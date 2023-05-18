package com.language.grammar_comment.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GrammarComment {

	private int id;
	private int grammarId;
	private int userId;
	private String oldContent;
	private String newContent;
	private Date createdAt;
	private Date updatedAt;
}
