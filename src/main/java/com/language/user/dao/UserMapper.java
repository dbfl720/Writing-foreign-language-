package com.language.user.dao;

import org.springframework.stereotype.Repository;

import com.language.user.model.User;

@Repository
public interface UserMapper {
	
	public User selectUserByLoginId(String loginId);
}
