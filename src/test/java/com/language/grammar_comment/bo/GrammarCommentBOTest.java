package com.language.grammar_comment.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.language.community.bo.CommunityBO;
import com.language.community.model.CommunityView;
import com.language.grammar_comment.model.GrammarComment;
import com.language.grammar_comment.model.GrammarCommentView;


@SpringBootTest
class GrammarCommentBOTest {

Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	GrammarCommentBO grammarCommentBO;
	
	
	
	
	//@Transactional
	//@Test
	void 그래머댓글_쓰기() {
		logger.info("###### 그래머댓글쓰기");
		grammarCommentBO.addGrammarComment(5, 6, "sd", "sgddddddd");
	}
	
	
	
	
	//@Transactional
	//@Test
	void 그래머_가공_댓글리스트_가져오기() {
		logger.info("###### 그래머 가공 댓글리스트 가져오기");
		List<GrammarCommentView> grammarCommentView = grammarCommentBO.generateGrammarCommentList(12, 12);
		assertNotNull(grammarCommentView);
	}
	
	
	
	
	
	
	//@Transactional
	//@Test
	void 그래머댓글리스트_가져오기() {
		logger.info("####### 그래머댓글리스트 가져오기");
		List<GrammarComment> grammarComment = grammarCommentBO.getGrammarCommentList(12);
		assertNotNull(grammarComment);
	}

}




//
//@SpringBootTest
//class CommunityBOTest {
//
//Logger logger = LoggerFactory.getLogger(this.getClass());
//	
//	
//	@Autowired
//	CommunityBO communityBO;
//	
//	
//	
//	//@Transactional
//	//@Test
//	void 커뮤니티리스트가져오기() {
//		logger.info("##### 커뮤니티 리스트 가져오기");
//		List<CommunityView> communityView = communityBO.generateCommunityList(12);
//		assertNotNull(communityView);
//	}
//	
//	
//	
//	//@Transactional
//	//@Test
//	void 커뮤니티유저가져오기() {
//		logger.info("####### 커뮤니티 유저 가져오기");
//		CommunityView user = communityBO.generateCommunity("yuri");
//		assertNotNull(user);
//	}
//
//}
