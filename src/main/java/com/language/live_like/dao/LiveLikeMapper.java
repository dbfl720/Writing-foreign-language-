package com.language.live_like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.language.live.model.Live;

@Repository
public interface LiveLikeMapper {

	
	// select
	public int selectLiveLikeByLiveIdOrUserId(
			@Param("liveId") int liveId,
			@Param("userId") Integer userId);
	
	
	
	// select
	public int selectLiveLikeCountByUserId(int userId);
	
	
	
	// delete
	public int deleteLiveLikeByLiveIdUserId(
			@Param("liveId") int liveId,
			@Param("userId") int userId);
	
	
	// insert
	public void insertLiveLike(
			@Param("liveId") int liveId,
			@Param("userId") int userId);
}
