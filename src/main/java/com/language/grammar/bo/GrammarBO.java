package com.language.grammar.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.grammar.dao.GrammarMapper;
import com.language.grammar.model.Grammar;


@Service
public class GrammarBO {

	@Autowired 
	private GrammarMapper grammarMapper;
	
	
	
	// insert
	public int addGrammar(String loginId, String languageCategoryId, String title, String content) {
		
		return grammarMapper.insertGrammar(loginId, languageCategoryId, title, content);
	}
	
	
	
	
	// select - grammar 글들
	public List<Grammar> getGrammarList() {
		
		return grammarMapper.selectGrammarList();
		
	}
	
	
	public Grammar getGrammarById (int id) {
		return grammarMapper;
	}
}
