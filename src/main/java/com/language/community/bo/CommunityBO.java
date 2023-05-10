package com.language.community.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.user.bo.UserBO;

@Service
public class CommunityBO {

	@Autowired
	private UserBO userBO;
	
//	public List<CardUserView> generateCardList(Integer userId) {
//		
//		List<CardUserView> userList = new ArrayList<>();
//		
//		// user list 가져오기
//		List<User>
//	}
}
