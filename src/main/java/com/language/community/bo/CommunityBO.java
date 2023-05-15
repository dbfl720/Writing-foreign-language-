package com.language.community.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.community.model.CommunityView;
import com.language.user.bo.UserBO;
import com.language.user.model.User;

@Service
public class CommunityBO {

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
}
