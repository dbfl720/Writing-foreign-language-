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
//	@GetMapping("/grammar_detail_view")
//	public String grammarDetailView(
//			@RequestParam(value="grammarId") int grammarId,
//			Model model) {
//		
//		
//		
//		// select db 
//		Grammar grammar = grammarBO.getGrammarByGrammarId(grammarId);
//		
//		model.addAttribute("grammar", grammar);
//		model.addAttribute("view", "grammar/grammarDetail");
//		return "template/layout";
//	}
	
	
	
	
	
	
	// localhost/grammar/grammar_list_view
	@GetMapping("/grammar_list_view")
	public String grammarListView(Model model) {
		
		// select db
		List<GrammarView> grammarList = grammarBO.generateGrammarList();
		
		
		model.addAttribute("grammarList", grammarList);
		model.addAttribute("view", "grammar/grammarList");
		return "template/layout";
	}
	
	
	
	
//	// localhost/grammar/grammar_list_view?languageCategoryId=KO    http://localhost/grammar/grammar_list_view?languageCategoryId=CHN#
//	@GetMapping("/grammar_list_view")
//	public String grammarListView(
//			@RequestParam(value="languageCategoryId") String languageCategoryId,
//			Model model) {
//		
//		// select db
//		List<GrammarView> grammarList = grammarBO.generateGrammarList();
//		
//		
//		model.addAttribute("grammarList", grammarList);
//		model.addAttribute("view", "grammar/grammarList");
//		return "template/layout";
//	}
	
	
	
}
