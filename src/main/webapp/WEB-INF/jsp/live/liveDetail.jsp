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
	
	
  <c:if test="${not empty liveViewList}">
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
						 <c:if test="${card.user.id eq userId}">
							<a href="#" class="delete-btn" data-toggle="modal" data-target="#modal" data-live-id="${card.live.id}"> <img
								width="20" src="https://icons.iconarchive.com/icons/arturo-wibawa/akar/128/more-vertical-icon.png">
							</a>
						 </c:if>
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
					<div class=" liveLikeHeart d-flex">
						 <c:if test="${card.liveFilledLike == false}"> 
							<%-- 좋아요가 안눌러졌을 때, 비로그인 일 때.  (빈 하트) --%>
							<a href="#" class="LiveLike-btn" data-live-id="${card.live.id}">
								<img class="mt-4 mb-3 shadowToTalEffects" width="25px" height="25px" alt="empty heart"
								src="https://icons.iconarchive.com/icons/aniket-suvarna/box-regular/128/bx-like-icon.png">
							</a>
						 </c:if> 
						 <c:if test="${card.liveFilledLike == true}"> 
							<%-- 좋아요가 눌러졌을 때 (채워진 하트) --%>
							<a href="#" class="LiveLike-btn" data-live-id="${card.live.id}">
								<img class="mt-4 mb-3 shadowToTalEffects" width="25px" height="25px" alt="filled heart"
								src="https://icons.iconarchive.com/icons/aniket-suvarna/box/128/bxs-like-icon.png">
							</a>
					     </c:if> 
						<div class="liveLikeCounttext d-flex">
							<div class="liveLikeCountText222">${card.liveLikeCount}</div>
							<div class="liveLikeCountText333">people like it.</div>
						</div>
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
								<c:when test="${liveComments.liveComment.userId eq userId}"> 
									<div class="d-flex justify-content-between align-items-center">	
										<%-- 댓글 내용 --%>
										<div>
											<small class="font-weight-bold liveLoginIdText33">${liveComments.user.loginId}</small>
											<small class="liveContentText">${liveComments.liveComment.content}</small>
										</div>
										<%-- 댓글 삭제 버튼 --%>
											<div>
												<a href="#" data-comment-id="${liveComments.liveComment.id}" class="LiveDeleteBtn" >
												 <img class=" mr-3" width="15px" height="15px" alt="댓글 삭제 아이콘"
													src="https://icons.iconarchive.com/icons/custom-icon-design/mono-general-4/128/trash-icon.png">
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
									placeholder="Add your comment..." />
								<button  type="button" class="liveCommentBtn shadowToTalEffects commentBtn btn btn-light mt-2  col-2"
									data-live-id="${card.live.id}">save</button>
								<%-- id로하면 안됨. class로 해야됨. 계쏙 나오는 거라서.  --%>
							</div>
				
					</div>
					<%-- 댓글 목록 --%>
	
					</div>
				</div>
	
		</div>
		</c:forEach>
		</c:if>
		<%-- 타임라인 영역 끝 --%>
		
		
		
		
		
		<%-- empty 타임라인 시작. --%>
		<c:if test="${empty liveViewList}">
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
								<img class="reviewTopImgBox2 shadowToTalEffects" src="https://icons.iconarchive.com/icons/arturo-wibawa/akar/128/language-icon.png" 
								width="70" height="70">
								
								
								<%-- loginId --%>
								<div class="liveDetailTopBox444">
									<div  class="liveToploginIdText">
										<a href="#" data-user-id="" >
											<span class="liveTopFont">Ami</span>
										</a>
									</div>
									<div class="liveTopLanguage">
										<div class="liveTopLanguageText text-secondary">
										native language
										<img alt="화살표" height="14" width="14" src="https://icons.iconarchive.com/icons/bootstrap/bootstrap/128/Bootstrap-arrow-left-right-icon.png">
										foreign language</div>
									</div>
								</div>
							</div>
					</div>
					</div>
						<%-- 글 --%>
					<div class="liveContentBox shadowToTalEffects">
						<span class="liveContentText">We look forward to your writing !!</span>
					</div>
				
			
					

				
					<%-- 카드 이미지 --%>
					<div>
						<img class="w-100 shadowToTalEffects liveImageBox111"  height="300" alt="본문 이미지"
							src="https://cdn.pixabay.com/photo/2015/07/27/20/16/book-863418_1280.jpg">
					</div>



					<%-- 좋아요 --%>
					<div class=" liveLikeHeart d-flex">
							<%-- 좋아요가 안눌러졌을 때, 비로그인 일 때.  (빈 하트) --%>
							<a href="#">
								<img class="mt-4 mb-3 shadowToTalEffects" width="25px" height="25px" alt="empty heart"
								src="https://icons.iconarchive.com/icons/aniket-suvarna/box-regular/128/bx-like-icon.png">
							</a>
					
					</div>


				


					<%-- 댓글 --%>
					<div class="mb-2">
						<div>
							<div class="text-secondary liveCommentText4567">comment</div>
						</div>
					</div>


					<%-- 댓글 목록 --%>
					<div>
									<div class="d-flex justify-content-between align-items-center">	
										<%-- 댓글 내용 --%>
										<div>
											<small class="font-weight-bold liveEmptyLoginId">We look forward to your writing !!</small>
										</div>
									</div>
	
						
						
						<%-- 댓글 쓰기 --%>
				
							<div class="d-flex mt-2 justify-content-between">
								<%-- border-top: 윗부분 경계 --%>
								<input type="text" class="liveCommentInput shadowToTalEffects commentBox commentInput border-0 form-control mt-2 mr-2 col-10"
									placeholder="Add your comment..." />
								<button  type="button" class="shadowToTalEffects commentBtn btn btn-light mt-2  col-2"
									>save</button>
								<%-- id로하면 안됨. class로 해야됨. 계쏙 나오는 거라서.  --%>
							</div>
				
					</div>
					<%-- 댓글 목록 --%>
	
					</div>
				</div>
	
		</div>
		</c:if> <%-- empty 타임라인 끝. --%>
</div> <!-- container -->
	




<!-- Modal -->
<div class="modal fade" id="modal" >
	<%-- modal-dialog-centered : 모달 창을 수직 가운데 정렬 --%>
	<%-- modal-sm: small 모달 --%>
  	<div class="modal-dialog modal-dialog-centered modal-sm"> 
    	<div class="modal-content text-center">
      		<div class="py-3 border-bottom"> 
      			<a href="#" id="deletePostBtn" class="deletePostFont text-dark">Delete</a>
   			</div>
   			<div class="py-3">
   				<%-- data-dismiss="modal" => 모달창 닫힘 --%>
   				<a href="#" data-dismiss="modal" class="deletePostFont text-dark">Close</a>
   			</div>
    	</div>
  </div>
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
	
	
	
	
	
	
	// 댓글 삭제
	$('.LiveDeleteBtn').on('click', function(e) {
		e.preventDefault();
		
		let commentId = $(this).data("comment-id");
		//alert(commentId);
		
		
		
		$.ajax({
			// request
			type : "POST"
			, url : "/live_comment/delete"
			, data : {"commentId" : commentId}
			
			
		
			// response
			, success : function(data) { // jquery ajax 함수가 json string을 object로 파싱해줌
				if (data.code == 1) {
					swal(data.result);
					location.reload();
				} else {
					swal(data.errorMessage);
				}
			}
			,error : function(request, status, error) {
				alert("요청에 실패했습니다. 관리자에게 문의해주세요.");
			}
			
		}); // ajax
		
	});  // LiveDeleteBtn
	
	
	
	
	
	
	
	// 좋아요 / 해제
	$('.LiveLike-btn').on('click', function(e){
		e.preventDefault();
		
		let liveId = $(this).data("live-id");
		//alert(liveId);
		
		
		$.ajax({
			// request
			url : "/liveLike/" + liveId   

			
			// response
			,success : function(data) {
				if (data.code == 1) {
					location.reload();
				} else if (data.code == 300) {
					alert(data.errorMessage);
					// 비로그인 시 로그인 페이지로 이동
					location.href = "/user/sign_in_view";
				}
			},
			error : function(request, status, error) {
				alert("Failed to save your like. Please contact the administrator.");
			}
			
		});  //ajax
		
	});  // LiveLike-btn
	
	
	
	
	
	
	

	// 글 삭제
	$('.delete-btn').on('click', function(e){
		e.preventDefault();
		
		let liveId = $(this).data('live-id');
		//alert(liveId);
		
		// 모달 태그에 data-live-id 심기
		$('#modal').data('live-id', liveId);
	}); // delete-btn
		
		
	
	
	
	// 모달 안에 있는 delete 버튼
	$('#modal #deletePostBtn').on ('click', function(e) {  // modal 안에 있는 deletePostBtn  띄어쓰기. #modal 안써도 됨.
	
		let liveId = $('#modal').data('live-id');
		//alert(liveId);
	
		// ajax
		$.ajax({
			// request
			type : "DELETE"
			, url : "/live/delete"
			, data : {
				"liveId" : liveId
			}
			
			
			// response
			,success : function(data) {
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
		
			
		});  // ajax
		
	});    //deletePostBtn
	
	
	
});  // ready


</script>