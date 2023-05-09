package com.language.user.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.language.user.model.User;

@SpringBootTest // spring 수행. 있어야만 수행됨.
class UserBOTest {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	UserBO userBO;
	
//	@Transactional // insert 후 다시 rollback   // db에는 안쌓이고 에러 나는지만 체크해줌. 중간에 하나가 어긋나도 아무일 없이 rollback 해줌 ( 코드 길 때 유용) 
//	@Test
//	void 회원가입() {
//		logger.info("#### 회원가입");
//		userBO.addUser("KO", "EN", "agggga", "AAaa1234!", "yuri@naver.com", "aaadfdfdfdfdfddfd", "adfdfdfdfdfdfaa", "https://cdn.pixabay.com/photo/2023/04/24/16/50/flowers-7948554_1280.jpg");
//	}
	
	
	
	
	
//	@Transactional
//	@Test
	void 로그인() {
		logger.info("##### 로그인 #####");
		userBO.getUserByLoginId("yuri");
	}
	
	
	
	
	//@Test
	void 유저가져오기() {
		User user = userBO.getUserById(3);
		assertNotNull(user); // 메소드 검색해서 사용! 
	}
	
	
	
	//@Test
	void test() {
		fail("Not yet implemented");
	}

}
