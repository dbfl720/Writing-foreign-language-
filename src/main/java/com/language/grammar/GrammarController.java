package com.language.grammar;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.language.grammar.bo.GrammarBO;
import com.language.grammar.model.Grammar;
import com.language.grammar.model.GrammarView;

@RequestMapping("/grammar")
@Controller
public class GrammarController {

	
	@Autowired
	private GrammarBO grammarBO;
	
	
	
	
	// localhost/grammar/grammar_writing_view
	@GetMapping("/grammar_writing_view")
	public String grammarWritingView(Model model) {
		
		model.addAttribute("view", "grammar/grammarWriting");
		return "template/layout";
	}
	
	
	
	
	
	// localhost/grammar/grammar_detail_view?grammarId=9
	@GetMapping("/grammar_detail_view")
	public String grammarDetailView(
			@RequestParam(value="grammarId") int grammarId,
			Model model) {
		
		
		// select db 
		Grammar grammar = grammarBO.getGrammarByGrammarId(grammarId);
		List<GrammarView> grammarView = grammarBO.generateGrammarList(grammarId);
		
		model.addAttribute("grammarView", grammarView);
		model.addAttribute("grammar", grammar);
		model.addAttribute("view", "grammar/grammarDetail");
		return "template/layout";
	}
	
	
	
	
	
	
	// localhost/grammar/grammar_list_view
	@GetMapping("/grammar_list_view")
	public String grammarListView(
			@RequestParam(value="languageCategoryId", defaultValue="EN") String languageCategoryId,
			@RequestParam(value="prevId", required=false) Integer prevIdParam, // 비필수
			@RequestParam(value="nextId", required=false) Integer nextIdParam, // 비필수
			Model model) {
		
		
		// select db
		List<Grammar> grammarList = grammarBO.getGrammarListByLanguage(languageCategoryId, prevIdParam, nextIdParam);
		int prevId = 0;
		int nextId = 0;
		if (grammarList.isEmpty() == false) {  // postList가 비어있을 때 에러 방지
			// 리스트가 비어있지 않으면 처리
			prevId = grammarList.get(0).getId();   // 가져온 리스트의 가장 맨 앞 (큰 id)  // order by로 정렬 되어 있어서...
			nextId = grammarList.get(grammarList.size() - 1).getId();   // 가져온 리스트의 가장 끝 값(작은 id)
			
			// 이전 방향의 끝인가? 
			// prevId와 grammar 테이블의 가장 큰 id와 같다면 이전 페이지 없음.
			if (grammarBO.isPrevLastPage(languageCategoryId, prevId)) {
				prevId = 0;
				
			}
			// 다음 방향의 끝인가?
			// nextId와 grammar 테이블의 가장 작은 id와 같다면 다음 페이지 없음.
			if (grammarBO.isNextLastPage(languageCategoryId, nextId)) {
				nextId = 0;
			}
		}
		
		
		model.addAttribute("languageCategoryId", languageCategoryId);
		model.addAttribute("prevId", prevId);		
		model.addAttribute("nextId", nextId);	
		model.addAttribute("grammarList", grammarList);
		model.addAttribute("view", "grammar/grammarList");
		return "template/layout";
	}
	
	
	
}
