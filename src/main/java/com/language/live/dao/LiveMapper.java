package com.language.live.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.language.live.model.Live;

@Repository
public interface LiveMapper {
	
	// insert
	public int insertLive(
			@Param("userId") int userId,
			@Param("languageCategoryId") String languageCategoryId,
			@Param("content") String content,
			@Param("ImagePath") String ImagePath);
	
	
	// select
	public List<Live> selectLiveListByLanguage(
			@Param("languageCategoryId") String languageCategoryId);

	
	
	// select
	public Live selectLiveByLiveIdUserId(
			@Param("liveId") int liveId,
			@Param("userId") int userId);

	
	
	// delete
	public int deleteLiveByLiveIdUserId(
			@Param("liveId") int liveId,
			@Param("userId") int userId);
}
