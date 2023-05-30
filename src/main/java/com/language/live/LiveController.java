package com.language.live;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.language.live.bo.LiveBO;
import com.language.live.model.LiveView;

@RequestMapping("/live")
@Controller
public class LiveController {

	
	
	
	@Autowired
	private LiveBO liveBO;
	
	
	
	
	
	//localhost/live/live_writing_view
	@GetMapping("/live_writing_view")
	public String live_writing_view(
			Model model) {
		
		
		model.addAttribute("view", "live/liveWriting");
		return "template/layout";
	}
	
	
	
	
	
	
	
	// localhost/live/live_view
	@GetMapping("/live_view")
	public String live_view(
			@RequestParam(value="languageCategoryId",defaultValue="EN") String languageCategoryId,
			Model model, HttpSession session) {
		
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		
		// db
		List<LiveView> liveViewList = liveBO.generateCardList(languageCategoryId, userId);
		
		
		model.addAttribute("liveViewList", liveViewList);
		model.addAttribute("view", "live/liveDetail");
		return "template/layout";
	}
}
