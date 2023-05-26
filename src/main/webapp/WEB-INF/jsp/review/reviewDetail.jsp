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
				<div class="reviewBox mr-3">
					<img id="reviewImg" class=" review" alt="프로필 사진"
						src="${review.imagePath}" height="300" width="300">
				</div>
				<!-- 업데이트 아이콘 -->
				<c:if test="${review.userId eq userId}">
				<div class="reveiwCorrectIcon"><a href="/review/review_correct_view?reviewId=${review.id}"> 
					<img width="26" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/tools-icon.png" > 
					 </a>	
			    </div>	
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
												<a href="#" class="delete-btn" data-toggle="modal" data-target="#modal" data-comment-id="${comments.reviewComment.id}" >
												 <img class=" mr-3" width="20" height="20" alt="more-icon"
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
										<small class="font-weight-bold"></small>
										<small>We look forward to your comments.</small>
									</div>
								</div>
						</c:if>
						
						
						
					
					</div><%-- 댓글 목록 --%>
		
		</div>
</div>





<!-- Modal -->
<div class="modal fade" id="modal" >
	<%-- modal-dialog-centered : 모달 창을 수직 가운데 정렬 --%>
	<%-- modal-sm: small 모달 --%>
  	<div class="modal-dialog modal-dialog-centered modal-sm"> 
    	<div class="modal-content text-center">
      		<div class="py-3 border-bottom"> 
      			<a href="#" id="deletePostBtn" class="text-dark">Delete</a>
   			</div>
   			<div class="py-3">
   				<%-- data-dismiss="modal" => 모달창 닫힘 --%>
   				<a href="#" data-dismiss="modal" class="text-dark">Close</a>
   			</div>
    	</div>
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
		
		
		
		
		
		
		
		
		
		// 댓글 삭제
		$('.delete-btn').on('click',function(e){
			e.preventDefault();
			
			let commentId = $(this).data('comment-id');
			//alert(commentId);
			
			// 모달 태그에 (재활용 되는) data-post-id를 심어줌
			$('#modal').data('comment-id', commentId);  // setting - modal태그에 세팅한 것임. 내부적으로 commentId심어져있음 
			
		}); // more-btn
		
		
		
		
		
		
		
		// 모달 안에 있는 삭제하기 버튼 클릭 => 진짜 삭제
		$('#modal #deletePostBtn').on('click', function(e){   // modal 안에 있는 deletePostBtn  띄어쓰기. #modal 안써도 됨. 그냥 알아보기 쉬우라고..
			e.preventDefault();
			
		
			let commentId = $('#modal').data('comment-id');
			 //alert(commentId);
		
	
			
			// ajax 글 삭제 
			$.ajax({
				// request
				type : "DELETE",
				url : "/review_comment/delete",
				data : {
					"commentId" : commentId
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
				
				
			}); // ajax 
		});
		
		
	});  // ready

</script>
