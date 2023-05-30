package com.language.live_comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.language.live_comment.model.LiveComment;

@Repository
public interface LiveCommentMapper {

	// insert
	public int insertLiveComment(
			@Param("liveId") int liveId,
			@Param("userId") int userId,
			@Param("content") String content);
	
	
	
	// select
	public List<LiveComment> selectLiveCommentListByLiveId(int liveId);
	
	
	
	
	// delete
	public int deleteLiveComment(int commentId);
}
