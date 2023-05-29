package com.language.live.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Live {
	
	private int id;
	private int userId;
	private String content;
	private String ImagePath;
	private Date createdAt;
	private Date updatedAt;
}
