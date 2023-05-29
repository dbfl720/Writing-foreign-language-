<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container">
	
	<div class=" d-flex TopLogoEffects justify-content-between TopLogoMain">
			<div class="d-flex LiveTopLogo56">
				<img alt="글쓴이 이모티콘" width="55" height="55" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png">
				<div class="liveTopText">Excellent Writer!!</div>
			</div>
	
	
	<%-- 언어 선택 --%>
	<div class="d-flex">
				<select onchange="if(this.value) location.href=(this.value);" name="id" id= livelanguageId class="shadowToTalEffects select form-select form-select-sm form-control standardHeight">
						<option value="none" selected>language</option>
						<option value="/live/live_view?languageCategoryId=KO">KO</option>
						<option value="/live/live_view?languageCategoryId=EN">EN</option>
						<option value="/live/live_view?languageCategoryId=JP">JP</option>
						<option value="/live/live_view?languageCategoryId=CHN">CHN</option>
						<option value="/live/live_view?languageCategoryId=FRA">FRA</option>
						<option value="/live/live_view?languageCategoryId=SWE">SWE</option>
						<option value="/live/live_view?languageCategoryId=DEU">DEU</option>
						<option value="/live/live_view?languageCategoryId=VNM">VNM</option>
						<option value="/live/live_view?languageCategoryId=Others">Others</option>
				</select>
		</div>
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
											<span class="liveTopFont">${card.user.loginId}</span>
										</a>
									</div>
									<div class="liveTopLanguage">
										<div class="liveTopLanguageText text-secondary">${card.user.nativeCategoryId} <-> ${card.user.foreignCategoryId}</div>
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
						<span class="liveContentText">${card.live.content}</span>
					</div>
				
			
					

				
					<%-- 카드 이미지 --%>
					<div>
						<img class="w-100" height="300px" alt="본문 이미지"
							src="${card.live.imagePath}">
					</div>



					<%-- 좋아요 --%>
					<div class="mt-3 mb-3">
					
							<%-- 좋아요가 안눌러졌을 때, 비로그인 일 때.  (빈 하트) --%>
							<a href="#" class="like-btn" data-post-id="">
								<img width="18px" height="18px" alt="empty heart"
								src="/static/img/heart-icon.png">
							</a>
					
					
							<%-- 좋아요가 눌러졌을 때 (채워진 하트) --%>
							<a href="#" class="like-btn" data-post-id="">
								<img width="18px" height="18px" alt="filled heart"
								src="/static/img/heart-icon (1).png">
							</a>
					
						<small>명이 좋아합니다.</small>
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
												<a href="#" data-comment-id="" class="deleteBtn" >
												 <img
													class=" mr-3" width="15px" height="15px" alt="x-icon"
													src="/static/img/x-icon.png">
												</a>
											</div>
									</div>
							
									<div class="d-flex justify-content-between align-items-center">	
										<%-- 댓글 내용 --%>
										<div>
											<small class="font-weight-bold"></small>
											<small></small>
										</div>
									</div>
						

						
						
						<%-- 댓글 쓰기 --%>
				
							<div class="d-flex mt-2 justify-content-between">
								<%-- border-top: 윗부분 경계 --%>
								<input type="text"
									class="commentBox commentInput border-0 form-control mt-2 mr-2 col-10"
									placeholder="댓글 달기..." />
								<button type="button" class="commentBtn btn btn-light mt-2"
									data-post-id="">게시</button>
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