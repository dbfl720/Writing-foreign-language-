package com.language.grammar.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.grammar.dao.GrammarMapper;


@Service
public class GrammarBO {

	@Autowired 
	private GrammarMapper grammarMapper;
	
	// insert
	public int addGrammar(int userId, String languageCategoryId, String title, String content) {
		
		return grammarMapper.insertGrammar(userId, languageCategoryId, title, content);
	}
}
