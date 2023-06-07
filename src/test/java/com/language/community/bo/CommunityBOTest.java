package com.language.community.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.language.community.model.CommunityView;




@SpringBootTest
class CommunityBOTest {

Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	CommunityBO communityBO;
	
	
	
	//@Transactional
	//@Test
	void 커뮤니티리스트가져오기() {
		logger.info("##### 커뮤니티 리스트 가져오기");
		List<CommunityView> communityView = communityBO.generateCommunityList(12);
		assertNotNull(communityView);
	}
	
	
	
	//@Transactional
	//@Test
	void 커뮤니티유저가져오기() {
		logger.info("####### 커뮤니티 유저 가져오기");
		CommunityView user = communityBO.generateCommunity("yuri");
		assertNotNull(user);
	}

}