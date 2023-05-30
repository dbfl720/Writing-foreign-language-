package com.language.live.bo;

import java.util.ArrayList;
import java.util.List;

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
	
}
