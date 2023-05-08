package com.language.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.language.user.model.User;

@Repository
public interface UserMapper {
	
	public User selectUserByLoginId(String loginId);
	
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	public User selectUserById (int id);

	
	public int insertUser(
			@Param("nativeCategoryId") String nativeCategoryId,
			@Param("foreignCategoryId") String foreignCategoryId,
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("email") String email,
			@Param("selfIntroduction") String selfIntroduction,
			@Param("languageGoals") String languageGoals,
			@Param("ImagePath") String ImagePath);
	
	
	
	
	
	
}
