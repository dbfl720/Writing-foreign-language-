package com.language.live_like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.live_like.dao.LiveLikeMapper;

@Service
public class LiveLikeBO {

	@Autowired
	private LiveLikeMapper liveLikeMapper;
	
	// 좋아요 존재 여부
	public boolean existLiveLike(int liveId, Integer userId) {
		// 비로그인
		if (userId == null) {
			return false;
		}

		// 로그인  // 개수는 boolean이 될 수 없기 때문에 조건문 만들기. => 0보다 크면 ture.
		return liveLikeMapper.selectLiveLikeByLiveIdOrUserId(liveId, userId) > 0;
	}
	
	
	
	// delete
	public int deleteLikeByLiveIdUserId(
			int liveId, int userId) {
		return liveLikeMapper.deleteLiveLikeByLiveIdUserId(liveId, userId);
	}
	
	
	
	
	// insert
	public void liveLikeToggle(int liveId, int userId) {
		// like 있는지 확인
		int likeCount = liveLikeMapper.selectLiveLikeByLiveIdOrUserId(liveId, userId);
		if(likeCount > 0) { // 있으면 제거
			liveLikeMapper.deleteLiveLikeByLiveIdUserId(liveId, userId);
		} else { // 없으면 추가
			liveLikeMapper.insertLiveLike(liveId, userId);
		}
	}
	
	
	
	// select
	public int getLiveLikeCountByLiveId (int liveId) {
		return liveLikeMapper.selectLiveLikeByLiveIdOrUserId(liveId, null);
	}
}
