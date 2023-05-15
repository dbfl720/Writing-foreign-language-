package com.language.grammar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.language.grammar.model.Grammar;

@Repository
public interface GrammarMapper {

	 //public List<Map<String, Object>> selectGrammarList();
	
	
	// insert
	public int insertGrammar(
			@Param ("userId") int userId, // Mybatis의 SQL 문장에 다수의 파라미터를 전달할 때는 전달되는 변수들에 꼭 @Param 어노테이션을 붙여줘야한다.
			@Param ("languageCategoryId") String languageCategoryId, 
			@Param ("title") String title, 
			@Param ("content") String content);
	
	
	
	// select
	public List<Grammar> selectGrammarListByUserId();
	
	

	// select 
	public List<Grammar> selectGrammarList();
}
