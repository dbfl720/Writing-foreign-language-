<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container"> 

	<div class="display-4 pt-5 pb-5 TopLogoEffects">
		<img alt="글쓴이 이모티콘" width="55" height="55" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png">
			How do you like this article?</div>
			
	
		
			
	<%-- 프로필 사진 --%>
	<%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
	<input type="file" id="file" multiple='multiple' class="d-none"
						accept=".gif, .jpg, .png, .jpeg , .webp">
	<div class="reviewTotal55">
		<div class="d-flex ReveiwTopBot">
				<!--더보기  -->
				 <a href="#" class="more-btn ReviewMoreIcon"  data-review-id="${review.id}"> 
					<img src="https://icons.iconarchive.com/icons/amitjakhu/drip/128/dots-3-icon.png" width="30"> 
				 </a>	

			<div class="reviewDetailBox">	
				<%-- 수정 아이콘 --%>
				<c:if test="${user.id eq userId}">
				<a href="#" id="updateProfileBtn">
				<img class="updateProfileIcon" alt="업데이트 이모티콘" width="36" height="36" src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Programming-Save-icon.png">
				</a>
				</c:if>
				
				<div class="reviewBox mr-3">
					<img id="reviewImg" class=" review" alt="프로필 사진"
						src="${review.imagePath}" height="300" width="300">
				</div>
				
				
				<c:if test="${user.id eq userId}">
					<a href="#" id="profileBtn">
					<img alt="프로필 변경 이모티콘" width="36" height="36"	src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Photo-icon.png" >
					</a>
				
					<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
					<div id="fileName" class="text-secondary ml-2 mt-2"></div>
				</c:if>	
					
			</div>
		
			<!-- 쓰기  -->
			<div class="ReviewDetailTextBox effect5">
				<div class="reviewDetailTitle">${review.title}</div>
				<div class="reviewDetailContent">${review.content}</div>
			</div>
				
		</div> <!-- d-flex  -->
		</div> <!-- reviewTotal55 끝 -->
		
		
		
		<!-- 댓글 -->
			<div>
			
				<%-- 댓글 쓰기 --%>
						<c:if test="${not empty userId}">
							<div class="d-flex mt-2 justify-content-between">
								<%-- border-top: 윗부분 경계 --%>
								<input  id="reviewCommentInput" type="text" class=" detailCommentBox commentInput border-0 form-control mt-2 mr-2 col-10" placeholder="Add your comment..." />
								<button  id="reviewCommentBtn" type="button" class="detailCommentBox btn btn-light mt-2"
								 data-review-id="${review.id}">save</button>
								<%-- id로하면 안됨. class로 해야됨. 계쏙 나오는 거라서.  --%>
							</div>
						</c:if>
						
						
					
						<div class="reviewDetailContentsBox22">
							<div class="text-secondary DetailCommentBox666">comment</div>
						</div>
				

					<%-- 댓글 목록 --%>
					<div>
							<c:if test="${not empty reviewCommentView}">
							 <c:forEach items="${reviewCommentView}" var="comments"> 
					 	 	 <c:choose> 
								 <c:when test="${comments.reviewComment.userId eq userId}">
									<div class="reviewDetailContentsBox22 d-flex justify-content-between align-items-center">	
										<!-- 댓글 내용 -->
										<div class="ReviewDetailCommentContents">
											<small class="font-weight-bold">${comments.user.loginId}</small>
											<small id="reviewCommentContentId">${comments.reviewComment.content}</small>
										</div>
										<!-- 댓글 삭제 버튼 -->
											<div>
												<a href="#" data-comment-id="${comments.reviewComment.id}" class="deleteBtn" >
												 <img
													class=" mr-3" width="20" height="20" alt="more-icon"
													src="https://icons.iconarchive.com/icons/colebemis/feather/128/more-horizontal-icon.png">
												</a>
											</div>
									</div>
								 </c:when>
								 <c:otherwise>
								 	<!-- 댓글 내용 -->
								 		<div class="reviewDetailContentsBox22 d-flex justify-content-between align-items-center">	
											<div class="ReviewDetailCommentContents">
												<small class="reviewDetailLoginId">${comments.user.loginId}</small>
												<small id="reviewCommentContentId">${comments.reviewComment.content}</small>
											</div>
										</div>
								 </c:otherwise>
							 </c:choose>  
							</c:forEach>
							</c:if> 
						

						
						
						<c:if test="${empty reviewCommentView}">
								<div class="reviewDetailContentsBox22 d-flex justify-content-between align-items-center">	
									<%-- 댓글 내용 --%>
									<div class="ReviewDetailCommentContents">
										<small class="font-weight-bold">d</small>
										<small>d</small>
									</div>
								</div>
						</c:if>
						
						
						
					
					</div><%-- 댓글 목록 --%>
		
		</div>
</div>




<script>
	$(document).ready(function(){
		
		// 더보기
		$('.more-btn').on('click', function(e){
			e.preventDefault();
			
			let reviewId = $(this).data("review-id");
			//alert(reviewId);
			
			$.ajax({
				type: "GET"
				, url : "/review/get"
				, data : {"reviewId" : reviewId}
				, success : function(data) {
					if (data.join == "There are no review written.") {
							swal("Please log in.");
						} else {
							//data.booking.name
							swal(
									"Language : " + data.review.languageCategoryId
									+ "\nType : " + data.review.reviewCategoryId
									+ "\nTitle : " + data.review.title
									+ "\nRating( 5 out of 5 ) : " + data.review.rating
								);
							
						}
					}
				,error : function(request, status, error) {
					swal("Failed to save information. Please contact the administrator.");
				}
				
				
				
			}); // ajax
			
			
		}); // more-btn
		
		
		
		
		
		
		// 댓글 쓰기
		$('#reviewCommentBtn').on('click',function(e){
			e.preventDefault();
			
			let reviewId = $(this).data("review-id");
			let content = $("#reviewCommentInput").val();
			//alert(reviewId);
			
			// validation
			if (!content){
				swal("Please write your comment.");
				return;
			}
			
			
			
			
			// ajax
			$.ajax({
				// request
				type : "POST"
				, url : "/review_comment/create"
				, data : {
					"reviewId" : reviewId
					,"content" : content
				}
			
			
				// response
				,success : function(data) {
					if (data.code = 1) {
						location.reload(true);
						swal(data.code);
					} else {
						swal(data.errorMessage);
					}
				},
				error : function(request, status, error) {
					swal("Failed to save information. Please contact the administrator.");
				}
				
				
			}); // ajax
			
		}); // reviewCommentid
		
	});  // ready

</script>
