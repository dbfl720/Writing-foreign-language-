package com.language.grammar_like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.grammar_like.dao.GrammarLikeMapper;

@Service
public class GrammarLikeBO {

	
	@Autowired
	private GrammarLikeMapper grammarLikeMapper;
	
	// insert - 좋아요 추가, 삭제 
	public void likeToggle(int commentId, int userId) {
		// like 있는지 확인
		int likeCount = grammarLikeMapper.selectLikeCountByCommentIdOrUserId(commentId, userId);
		if(likeCount > 0) {  // 제거
			grammarLikeMapper.deleteLikeByUserIdCommentId(commentId, userId);
		} else { // 추가
			grammarLikeMapper.insertLike(commentId, userId);			
		}
	}
	
	
	
	// 좋아요 했는지 존재 여부.
	public boolean existLike(int commentId, Integer userId) {
		// 비로그인
		if (userId == null) {
			return false;
		}	
		// 로그인,   개수는 boolean이 될 수 없기 때문에 조건문 만들기. => 0보다 크면 ture.
		return grammarLikeMapper.selectLikeCountByCommentIdOrUserId(commentId, userId) > 0;
	}
	
	
	
	// select - 좋아요 개수
	public int getLikeCountByCommentId (int commentId) {
		return grammarLikeMapper.selectLikeCountByCommentIdOrUserId(commentId, null);
	}
	
	
	// select 좋아요 개수 (userId)
	public int getLikeCountByUserId(int userId) {
	return grammarLikeMapper.selectLikeCountByUserId(userId);
	}
}
