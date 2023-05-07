package com.language.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.language.common.FileManagerService;
import com.language.user.dao.UserMapper;
import com.language.user.model.User;

@Service
public class UserBO {

	@Autowired UserMapper userMapper;
	
	@Autowired FileManagerService fileManager;
	
	// select - 중복체크
	public User getUserByLoginId(String loginId) {
		return userMapper.selectUserByLoginId(loginId);
	}
	
	
	// insert - 회원가입
	public int addUser(
			String nativeCategoryId,
			String foreignCategoryId,
			String loginId,
			String password,
			String email,
			String selfIntroduction,
			String languageGoals,
			MultipartFile file) {
		
		String ImagePath = null;
		if (file != null) {
			ImagePath = fileManager.saveFile(loginId, file);
		}
		
		
		return userMapper.insertUser(nativeCategoryId, foreignCategoryId, loginId, password, email, selfIntroduction, languageGoals, ImagePath);
	}
}
