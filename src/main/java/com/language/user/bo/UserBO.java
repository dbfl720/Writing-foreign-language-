package com.language.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.user.dao.UserMapper;
import com.language.user.model.User;

@Service
public class UserBO {

	@Autowired UserMapper userMapper;
	
	// select - 중복체크
	public User getUserByLoginId(String loginId) {
		return userMapper.selectUserByLoginId(loginId);
	}
}
