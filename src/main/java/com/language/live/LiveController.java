package com.language.live;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/live")
@Controller
public class LiveController {

	
	//localhost/live/live_writing_view
	@GetMapping("/live_writing_view")
	public String live_writing_view(
			Model model) {
		
		
		model.addAttribute("view", "live/liveWriting");
		return "template/layout";
	}
}
