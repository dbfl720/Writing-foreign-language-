package com.language.grammar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/grammar")
@Controller
public class GrammarController {

	
	// localhost/grammar/grammar_writing_view
	@GetMapping("/grammar_writing_view")
	public String grammarWritingView(Model model) {
		
		model.addAttribute("view", "grammar/grammarWriting");
		return "template/layout";
	}
}
