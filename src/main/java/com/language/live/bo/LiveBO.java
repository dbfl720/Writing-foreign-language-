package com.language.live.bo;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.language.common.FileManagerService;
import com.language.live.dao.LiveMapper;
import com.language.live.model.Live;
import com.language.live.model.LiveView;
import com.language.live_comment.bo.LiveCommentBO;
import com.language.live_comment.model.LiveCommentView;
import com.language.live_like.bo.LiveLikeBO;
import com.language.user.bo.UserBO;
import com.language.user.model.User;

@Service
public class LiveBO {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private LiveMapper liveMapper;
	
	@Autowired
	private FileManagerService fileManager;
	
	
	@Autowired
	private UserBO userBO;
	
	
	@Autowired
	private LiveCommentBO liveCommentBO;
	
	
	@Autowired
	private LiveLikeBO liveLikeBO;
	
	
	
	
	// insert
	public int addLive(
			int userId,
			String languageCategoryId,
			String content,
			MultipartFile file) {
		
		
		String ImagePath = null;
		if (file != null) {
			ImagePath = fileManager.saveFile(ImagePath, file);
		}
		
		return liveMapper.insertLive(userId, languageCategoryId, content, ImagePath);
	}
	
	
	
	
	
	// select - 가공 라이브
	public List<LiveView> generateCardList(String Language, Integer userId) {
		
		
		List<LiveView> liveViewList = new ArrayList<>();  // []
		
		// Live 글들
		List<Live> liveList = liveMapper.selectLiveListByLanguage(Language);
		
		
		// Live => LiveView
		for(Live live : liveList) {
			LiveView card = new LiveView(); // 비어있는 카드 1개 생성.
			
		// 글
		card.setLive(live);
		
		// 글쓴이 정보
		User user = userBO.getUserById(live.getUserId()); //글쓴이 정보는 글 안에 들어있기 때문
		card.setUser(user); // 지금 가져온 user정보를 카드에 넣기.
		
		// 댓글들
		List<LiveCommentView> liveCommentList = liveCommentBO.generateLiveCommentViewList(live.getId());
		card.setLiveCommentList(liveCommentList);
		
		
		// 좋아요  개수
		card.setLiveLikeCount(liveLikeBO.getLiveLikeCountByLiveId(live.getId()));
		
		
		// 좋아요 눌렀는지 여부
		card.setLiveFilledLike(liveLikeBO.existLiveLike(live.getId(), userId));
		
		// 카드 리스트 채우기 *
		liveViewList.add(card);
				
		}
		
		return liveViewList;
	}
	
	
	
	
	// select 
	public List<Live> getLiveListByLanguage(String Language){
		return liveMapper.selectLiveListByLanguage(Language);
		
	}
	
	
	
	
	// select
	public Live getLiveByLiveIdUserId(int liveId, int userId) {
		return liveMapper.selectLiveByLiveIdUserId(liveId, userId);
	}
	
	
	
	// delete
	public int deleteLiveByLiveIdUserId(int liveId, int userId) {
		
		// 기존글 가져오기
		Live live = getLiveByLiveIdUserId(liveId, userId); // * breakpoint
		if (live == null) {
			logger.error("[########delete live] liveId:{}, userId:{}", liveId, userId);
			return 0;
		}
		
		// 댓글
		liveCommentBO.deleteLiveComment(userId);
		
		// 좋아요
		liveLikeBO.deleteLikeByLiveIdUserId(liveId, userId);
		
		// 사진
		fileManager.deleteFile(live.getImagePath());
		
		return liveMapper.deleteLiveByLiveIdUserId(liveId, userId);
	}
	
}
