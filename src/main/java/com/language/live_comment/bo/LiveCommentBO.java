package com.language.live_comment.bo;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.live_comment.dao.LiveCommentMapper;
import com.language.user.bo.UserBO;

@Service
public class LiveCommentBO {

	
	// logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	private LiveCommentMapper liveCommentMapper;
	

	
	/**
	 * 라이브 댓글 쓰기
	 * @param liveId
	 * @param userId
	 * @param content
	 * @return
	 */
	// insert
	public int addLiveComment(
			int liveId,
			int userId,
			String content) {
		
		
		return liveCommentMapper.insertLiveComment(liveId, userId, content);
	}
}
