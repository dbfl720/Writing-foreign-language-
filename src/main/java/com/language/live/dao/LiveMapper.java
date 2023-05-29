package com.language.live.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LiveMapper {
	
	public int insertLive(
			@Param("userId") int userId,
			@Param("content") String content,
			@Param("ImagePath") String ImagePath);
}
