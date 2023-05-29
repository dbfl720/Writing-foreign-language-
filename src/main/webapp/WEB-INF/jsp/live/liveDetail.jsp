<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container">
	
	<div class="display-4 pt-5 pb-5 d-flex TopLogoEffects">
			<img alt="글쓴이 이모티콘" width="55" height="55" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png">
			<div class="reviewTopGreatText display-4 ">Excellent Writer!!</div>
	</div>
	
	
	<%-- 언어 선택 --%>
	<div class="d-flex justify-content-start reviewTopSelectBox selectBox">
				<select onchange="if(this.value) location.href=(this.value);" name="id" id= ReviewlanguageId class="shadowToTalEffects select form-select form-select-sm form-control col-2 standardHeight">
						<option value="none" selected>language</option>
						<option value="/review/review_list_view?languageCategoryId=KO">KO</option>
						<option value="/review/review_list_view?languageCategoryId=EN">EN</option>
						<option value="/review/review_list_view?languageCategoryId=JP">JP</option>
						<option value="/review/review_list_view?languageCategoryId=CHN">CHN</option>
						<option value="/review/review_list_view?languageCategoryId=FRA">FRA</option>
						<option value="/review/review_list_view?languageCategoryId=SWE">SWE</option>
						<option value="/review/review_list_view?languageCategoryId=DEU">DEU</option>
						<option value="/review/review_list_view?languageCategoryId=VNM">VNM</option>
						<option value="/review/review_list_view?languageCategoryId=Others">Others</option>
				</select>
		</div>
	
	
	
	
	<div class="d-flex justify-content-center">
	<div class="contents-box">
	<c:forEach items="${liveViewList}" var="card">
			<%-- 타임라인 영역 --%>
			<div class="my-5 border-bottom">
				<%--y : y축 -> top , bottom --%>
				<div class=" rounded mt-2">
					<%-- 글쓴이,팔로잉 --%>
					<div class="p-2 d-flex justify-content-between LiveDetailTopBox333">	
						<%-- 사용자 프로필 사진 --%>
							<div class="d-flex">
								<img class="reviewTopImgBox2 shadowToTalEffects" src="${card.user.imagePath}" 
								width="70" height="70">
								
								
								<%-- loginId --%>
								<div class="liveDetailTopBox444">
									<div  class="liveToploginIdText">
										<a href="#" data-user-id="${card.user.id}" >
											<span class="liveTopFont">loginId</span>
										</a>
									</div>
									<div class="liveTopLanguage">
										<div class="liveTopLanguageText text-secondary">KO <-> EN</div>
									</div>
								</div>
							</div>
						<%-- 더보기, 삭제(내가 쓴 글일 때만 노출) --%>
						
							<a href="#" class="liveMoreBtn" data-toggle="modal" data-target="#modal" data-post-id=""> <img
								 width="20" src="https://icons.iconarchive.com/icons/arturo-wibawa/akar/128/more-vertical-icon.png">
							</a>
					</div>
					</div>
						<%-- 글 --%>
					<div class="liveContentBox">
						<span class="liveContentText">content</span>
					</div>
				
			
					

						
					






					<%-- 카드 이미지 --%>
					<div>
						<img class="w-100" height="300px" alt="본문 이미지"
							src="data:image/jpeg;base64,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">
					</div>



					<%-- 좋아요 --%>

					<div class="mt-3 mb-3">
					
							<%-- 좋아요가 안눌러졌을 때, 비로그인 일 때.  (빈 하트) --%>
							<a href="#" class="like-btn" data-post-id="${card.post.id}">
								<img width="18px" height="18px" alt="empty heart"
								src="/static/img/heart-icon.png">
							</a>
					
					
							<%-- 좋아요가 눌러졌을 때 (채워진 하트) --%>
							<a href="#" class="like-btn" data-post-id="${card.post.id}">
								<img width="18px" height="18px" alt="filled heart"
								src="/static/img/heart-icon (1).png">
							</a>
					
						<small>${card.likeCount}명이 좋아합니다.</small>
					</div>


				


					<%-- 댓글 --%>
					<div class="mb-2">
						<div>
							<div class="text-secondary">댓글</div>
						</div>
					</div>


					<%-- 댓글 목록 --%>
					<div>
					
									<div class="d-flex justify-content-between align-items-center">	
										<%-- 댓글 내용 --%>
										<div>
											<small class="font-weight-bold">loginId</small>
											<small>content</small>
										</div>
										<%-- 댓글 삭제 버튼 --%>
											<div>
												<a href="#" data-comment-id="${comments.comment.id}" class="deleteBtn" >
												 <img
													class=" mr-3" width="15px" height="15px" alt="x-icon"
													src="/static/img/x-icon.png">
												</a>
											</div>
									</div>
							
									<div class="d-flex justify-content-between align-items-center">	
										<%-- 댓글 내용 --%>
										<div>
											<small class="font-weight-bold">${comments.user.loginId}</small>
											<small>${comments.comment.content}</small>
										</div>
									</div>
						

						
						
						<%-- 댓글 쓰기 --%>
				
							<div class="d-flex mt-2 justify-content-between">
								<%-- border-top: 윗부분 경계 --%>
								<input type="text"
									class="commentBox commentInput border-0 form-control mt-2 mr-2 col-10"
									placeholder="댓글 달기..." />
								<button type="button" class="commentBtn btn btn-light mt-2"
									data-post-id="${card.post.id}">게시</button>
								<%-- id로하면 안됨. class로 해야됨. 계쏙 나오는 거라서.  --%>
							</div>
				
					</div>
					<%-- 댓글 목록 --%>

				</div>
				</c:forEach>
				<%-- 타임라인 영역 끝 --%>
			</div>

	</div>
</div>
	




<script>



</script>