package com.language.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.language.user.model.User;

@Repository
public interface UserMapper {
	
	public User selectUserByLoginId(String loginId);
	
	
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId, 
			@Param("password")String password);
	
	
	public User selectUserById (Integer id);
	
	
	public int insertUser(
			@Param("nativeCategoryId") String nativeCategoryId,
			@Param("foreignCategoryId") String foreignCategoryId,
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("salt") String salt,
			@Param("email") String email,
			@Param("selfIntroduction") String selfIntroduction,
			@Param("languageGoals") String languageGoals,
			@Param("ImagePath") String ImagePath);
	
	
	public void updateUserByUserId(
			@Param("userId") int userId,
			@Param("ImagePath") String ImagePath,
			@Param("selfIntroduction") String selfIntroduction,
			@Param("languageGoals") String languageGoals);
	
	
	
	public List<User> selectCommunityUser();
	
	
	
	public List<User> selectGrammarUser();
}
