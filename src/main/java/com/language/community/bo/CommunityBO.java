package com.language.community.bo;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.community.model.CommunityView;
import com.language.user.bo.UserBO;
import com.language.user.model.User;

@Service
public class CommunityBO {
	
	
	// *** logger 
	private Logger logger = LoggerFactory.getLogger(this.getClass());  
	

	@Autowired
	private UserBO userBO;
	
	 
	
	public List<CommunityView> generateCommunityList(Integer userId) {
		
		List<CommunityView> communityList = new ArrayList<>();
		
		// user list 가져오기
		List<User> userList = userBO.getCommunityUser();
		
		for(User userOne : userList) {
			CommunityView community = new CommunityView();
			
			// *** 유저 정보들 
			User user = userBO.getUserByLoginId(userOne.getLoginId());
			community.setUser(user);
			
			// 리스트 채우기
			communityList.add(community);
		
		}
		return communityList;
	}
	
	
	
    // search
	public CommunityView generateCommunity (String loginId) {
		
		CommunityView communityView = new CommunityView();
		
		// user
		User user = userBO.getUserByLoginId(loginId);
		communityView.setUser(user);
		if (user == null) {
			logger.warn("[유저 정보] 유저 정보 is null. loginId:{} ");
		} 
		
		return communityView;
				
	}
}
