package com.language.grammar.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface GrammarMapper {

	public List<Map<String, Object>> selectGrammarList();
}
