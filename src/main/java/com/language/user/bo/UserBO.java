package com.language.user.bo;

import java.util.List;

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
	
	
	
	
	
	// select - 로그인
	public User getUserByLoginIdPassword(String loginId, String password) {	
		
		return userMapper.selectUserByLoginIdPassword(loginId, password);
	}
	
	

	
	
	// select -  id로 조회. 
	public User getUserById (Integer id) {
		return userMapper.selectUserById(id);
	}
	
	
	
	// insert - 회원가입
	public int addUser(
			String nativeCategoryId,
			String foreignCategoryId,
			String loginId,
			String password,
			String salt,
			String email,
			String selfIntroduction,
			String languageGoals,
			MultipartFile file) {
		
		String ImagePath = null;
		if (file != null) {
			ImagePath = fileManager.saveFile(loginId, file);
		
		}

		return userMapper.insertUser(nativeCategoryId, foreignCategoryId, loginId, password, salt, email, selfIntroduction, languageGoals, ImagePath);
	}
	
	
	

	
	
	// update - 프로필
	public void updateUser(
			MultipartFile file,
			String loginId,
			int userId) {
		
		// 기존 유저 정보 가져오기 (BO 메소드 부름.) 
		User user = getUserById(userId);
		

		String imagePath = null;
		if (file != null) {
			// 업로드
			imagePath = fileManager.saveFile(loginId, file);
			
			// 성공여부 체크 후 기존 이미지 제거 
			// -- imagePath가 null이 아닐 때 (성공) 그리고 기존 이미지가 있을 때 => 기존 이미지 삭제
			if (imagePath != null && user.getImagePath() != null) {
				// 이미지 제거
				fileManager.deleteFile(user.getImagePath()); // ** 기존 이미지  - post.getImagePaht() // x - imagePath (새로운 이미지)
			}
		}
		
		// db update
		userMapper.updateUserByUserId(userId, imagePath);
	
	}
	
	
	
	
	
	
	
	// community 유저 정보들
	public List<User> getCommunityUser() {
		
		//db select
		return userMapper.selectCommunityUser();
	}
	
	
	// grammar 유저 정보들
	public List<User> getGrammarUser() {
		
		return userMapper.selectGrammarUser();
	}

	
}
