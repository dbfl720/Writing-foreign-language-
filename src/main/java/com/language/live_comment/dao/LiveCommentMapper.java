package com.language.live_comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LiveCommentMapper {

	// insert
	public int insertLiveComment(
			@Param("liveId") int liveId,
			@Param("userId") int userId,
			@Param("content") String content);
}
