package com.language.live_comment.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LiveComment {

	private int id;
	private int liveId;
	private int userId;
	private String content;
	private Date createdAt;
	private Date updatedAt;
}
