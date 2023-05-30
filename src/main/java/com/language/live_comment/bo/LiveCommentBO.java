package com.language.live_comment.bo;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.live_comment.dao.LiveCommentMapper;
import com.language.live_comment.model.LiveComment;
import com.language.live_comment.model.LiveCommentView;
import com.language.user.bo.UserBO;
import com.language.user.model.User;

@Service
public class LiveCommentBO {

	
	// logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	private LiveCommentMapper liveCommentMapper;
	

	
	@Autowired
	private UserBO userBO;
	
	
	
	
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
	
	
	
	
	
	
	// select - 댓글쓴이를 알기 위해서 
	public List<LiveCommentView> generateLiveCommentViewList(int liveId){
		
		// 결과 리스트
		List<LiveCommentView> liveCommentViewList = new ArrayList<>();
		
		// 댓글 가져오기 
		List<LiveComment> liveCommentList = liveCommentMapper.selectLiveCommentListByLiveId(liveId);
		
		// LiveComment => LiveCommentView
		for(LiveComment liveComment : liveCommentList) {
			
			// LiveComment => LiveCommentView
			LiveCommentView liveCommentView = new LiveCommentView();
			
			// 댓글 하나
			liveCommentView.setLiveComment(liveComment);
			
			// 댓글쓴이
			User user = userBO.getUserById(liveComment.getUserId()); // liveComment에 해당하는 유저아이디
			liveCommentView.setUser(user);
			
			// 댓글 정보를 list에 담기
			liveCommentViewList.add(liveCommentView);
			
		}
		
		return liveCommentViewList;
	}
	
	
	
	
	// delete
	public int deleteLiveComment(int commentId) {
		 return liveCommentMapper.deleteLiveComment(commentId);
	}
}
