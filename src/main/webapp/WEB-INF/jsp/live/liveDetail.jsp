<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container">
	
	<div class=" d-flex TopLogoEffects justify-content-between TopLogoMain">
			<div class="d-flex LiveTopLogo56">
				<img alt="글쓴이 이모티콘" width="65" height="65" src="https://icons.iconarchive.com/icons/praveen/minimal-outline/128/microphone-icon.png">
				<div class="liveTopText">Talk about your day with people !</div>
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
				
				<!-- 리뷰쓰기 아이콘 -->
			<div class="ReviewPencilIcon ">
				<a href="/live/live_writing_view"> <img class="shadowToTalEffects" alt="연필 이모티콘"
					width="33" height="33"
					src="https://icons.iconarchive.com/icons/iconka/business-outline/128/pencil-icon.png">
				</a>
			</div>
		</div>
	</div>
	
	
	
	<c:forEach items="${liveViewList}" var="card">
	<div class="d-flex justify-content-center">
	<div>
			<%-- 타임라인 영역 --%>
			<div class="my-5 border-bottom contents-box">
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
										<div class="liveTopLanguageText text-secondary">
										${card.user.nativeCategoryId}
										<img alt="화살표" height="14" width="14" src="https://icons.iconarchive.com/icons/bootstrap/bootstrap/128/Bootstrap-arrow-left-right-icon.png">
										 ${card.user.foreignCategoryId}</div>
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
					<div class="liveContentBox shadowToTalEffects">
						<span class="liveContentText">${card.live.content}</span>
					</div>
				
			
					

				
					<%-- 카드 이미지 --%>
					<div>
						<img class="w-100 shadowToTalEffects liveImageBox111"  height="300" alt="본문 이미지"
							src="${card.live.imagePath}">
					</div>



					<%-- 좋아요 --%>
					<div class="mt-3 mb-3">
					
							<%-- 좋아요가 안눌러졌을 때, 비로그인 일 때.  (빈 하트) --%>
							<a href="#" class="like-btn" data-post-id="">
								<img width="18px" height="18px" alt="empty heart"
								src="">
							</a>
					
					
							<%-- 좋아요가 눌러졌을 때 (채워진 하트) --%>
							<a href="#" class="like-btn" data-post-id="">
								<img width="18px" height="18px" alt="filled heart"
								src="">
							</a>
					
						<small>명이 좋아합니다.</small>
					</div>


				


					<%-- 댓글 --%>
					<div class="mb-2">
						<div>
							<div class="text-secondary liveCommentText4567">comment</div>
						</div>
					</div>


					<%-- 댓글 목록 --%>
					<div>
						 <c:forEach items="${card.liveCommentList}" var="liveComments"> 
							 <c:choose>
								<c:when test="${comments.liveComment.userId eq userId}"> 
									<div class="d-flex justify-content-between align-items-center">	
										<%-- 댓글 내용 --%>
										<div>
											<small class="font-weight-bold liveLoginIdText33">${liveComments.user.loginId}</small>
											<small class="liveContentText">${liveComments.liveComment.content}</small>
										</div>
										<%-- 댓글 삭제 버튼 --%>
											<div>
												<a href="#" data-comment-id="" class="deleteBtn" >
												 <img
													class=" mr-3" width="15px" height="15px" alt="x-icon"
													src="">
												</a>
											</div>
									</div>
								 	 </c:when> 
									<c:otherwise> 
									<div class="d-flex justify-content-between align-items-center">	
										<%-- 댓글 내용 --%>
										<div>
											<small class="font-weight-bold">${liveComments.user.loginId}</small>
											<small>${liveComments.liveComment.content}</small>
										</div>
									</div>
								 </c:otherwise>
							</c:choose> 
						</c:forEach> 

						
						
						<%-- 댓글 쓰기 --%>
				
							<div class="d-flex mt-2 justify-content-between">
								<%-- border-top: 윗부분 경계 --%>
								<input type="text" class="liveCommentInput shadowToTalEffects commentBox commentInput border-0 form-control mt-2 mr-2 col-10"
									placeholder="댓글 달기..." />
								<button  type="button" class="liveCommentBtn shadowToTalEffects commentBtn btn btn-light mt-2 col-2"
									data-live-id="${card.live.id}">게시</button>
								<%-- id로하면 안됨. class로 해야됨. 계쏙 나오는 거라서.  --%>
							</div>
				
					</div>
					<%-- 댓글 목록 --%>
	
					</div>
				</div>
	
		</div>
		</c:forEach>
		<%-- 타임라인 영역 끝 --%>
</div>
	




<script>
$(document).ready(function() {
	
	// 댓글 쓰기 
	$('.liveCommentBtn').on('click', function(e){  // 글이 여러개 이기 때문에 class로 liveCommentBtn만들어야 됨.
		e.preventDefault();
		
		let liveId = $(this).data("live-id");
		let content = $(this).siblings("input").val();  // *** jquery .siblings() 문법 - 형제중에 input태그 가져온다. 
		
		//alert(content);
		
		// validation
		if (!content) {
			swal("Please write your comment.");
			return;
		}
		
		
		// ajax
		$.ajax({
			
			// request
			type : "POST"
			, url : "/live_comment/create"
			, data : {
				"liveId" : liveId
				,"content" : content
			}
		
		
		
			// response
			, success : function(data) {
				if (data.code = 1) {
					location.reload(true);
					swal(data.result);
				} else {
					swal(data.errorMessage);
				}
			},
			error : function(request, status, error) {
				swal("Failed to save information. Please contact the administrator.");
			}
			
			
			
		}); // ajax
		
	});  // liveCommentBtn
	
	
});  // ready


</script>