package com.language.grammar_comment.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

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
	
	
	
	
	
	
	@Transactional
	@Test
	void 그래머댓글리스트_가져오기() {
		logger.info("####### 그래머댓글리스트 가져오기");
		
	}

}
