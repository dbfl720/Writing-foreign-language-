package com.language.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.language.review.bo.ReviewBO;
import com.language.review.model.Review;
import com.language.review.model.ReviewView;

@RequestMapping("/review")
@Controller
public class ReviewController {

	
	@Autowired
	private ReviewBO reviewBO;
	
	
	
	
	
	
	//localhost/review/review_list_view
	@GetMapping("/review_list_view")
	public String review_list_view(
			@RequestParam(value="languageCategoryId", defaultValue="EN") String languageCategoryId,
			@RequestParam(value="prevId", required=false) Integer prevIdParam, // 비필수
			@RequestParam(value="nextId", required=false) Integer nextIdParam, // 비필수
			Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");

		
		// db
		List<ReviewView> reviewViewList = reviewBO.generateReviewUserList(userId);
		List<Review> reviewList = reviewBO.getReviewListByLanguage(languageCategoryId, prevIdParam, nextIdParam);
		int prevId = 0;
		int nextId = 0;
		if (reviewList.isEmpty() == false) {  // postList가 비어있을 때 에러 방지
			// 리스트가 비어있지 않으면 처리
			prevId = reviewList.get(0).getId();   // 가져온 리스트의 가장 맨 앞 (큰 id)  // order by로 정렬 되어 있어서...
			nextId = reviewList.get(reviewList.size() - 1).getId();   // 가져온 리스트의 가장 끝 값(작은 id)
			
			// 이전 방향의 끝인가? 
			// prevId와 grammar 테이블의 가장 큰 id와 같다면 이전 페이지 없음.
			if (reviewBO.isPrevLastPage(languageCategoryId, prevId)) {
				prevId = 0;
				
			}
			// 다음 방향의 끝인가?
			// nextId와 grammar 테이블의 가장 작은 id와 같다면 다음 페이지 없음.
			if (reviewBO.isNextLastPage(languageCategoryId, nextId)) {
				nextId = 0;
			}
		}
		
		
		model.addAttribute("languageCategoryId", languageCategoryId);
		model.addAttribute("prevId", prevId);		
		model.addAttribute("nextId", nextId);
		model.addAttribute("reviewViewList", reviewViewList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("view", "review/reviewList");
		return "template/layout";
	}
	
	
	
	
	
	
	//localhost/review/review_writing_view
	@GetMapping("/review_writing_view")
	public String review_writing_view(
			Model model) {
		
		
		model.addAttribute("view", "review/reviewWriting");
		return "template/layout";
	}
	
	
	
	
	//localhost/review/review_detail_view
	@GetMapping("/review_detail_view")
	public String review_detail_view(
			Model model) {
		
		
		model.addAttribute("view", "review/reviewDetail");
		return "template/layout";
	}
}
