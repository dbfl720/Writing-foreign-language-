package com.language.grammar.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.language.grammar.model.Grammar;

@SpringBootTest
class GrammarBOTest {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	GrammarBO grammarBO;
	
	
	
	
	//@Transactional  // insert 후 다시 rollback   // db에는 안쌓이고 에러 나는지만 체크해 줌.
	//@Test
	void 그래머추가() {   
		logger.info("###### 그래머 글 추가");
		grammarBO.addGrammar(2, "EN", "nn", "sdfds");
	}

	
	
	
	
	//@Transactional
	//@Test
	void 그래머리스트가져오기() {
		logger.info("###### 그래머 글 리스트 가져오기");
		List<Grammar> grammar = grammarBO.getGrammarListByLanguage("EN",3,3);
		
	}
	
	
	
	
	//@Transactional
	//@Test
	void 그래머가져오기_By_그래머아이디() {
		logger.info("###### 그래머 뷰 리스트 가져오기");
		Grammar grammar = grammarBO.getGrammarByGrammarId(12);
		assertNotNull(grammar); // null이 아님을 시험하기 위해 assertNotNull 메소드
	}
	
	
	
	
	//@Transactional
	//@Test
	void 그래머삭제하기_by_그래머아이디유저아이디() {
		logger.info("######## 그래머 삭제하기 ");
		 grammarBO.deleteGrammarByGrammarIdUserId(12, 12);
		
	}
	
}
