<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">

	<!-- Top 제목부분   -->
		<div class="grammarDetailTopText pt-5 pb-5 TopLogoEffects">
		<img alt="글쓴이 이모티콘" width="55" height="55" src="https://icons.iconarchive.com/icons/pixelkit/swanky-outlines/128/05-Bookmark-Book-icon.png">
			Click the magnifying glass and check the incorrect grammar !</div>
	



	<!--오른쪽 댓글  -->
	<div class="GrammarDetailTextBox6666">
		<div class="GrammarLeftInfo">
			<div class="d-flex  ReadingGlassesIcon">
				<!--유저 글정보 (내용)  -->
				 <a href="#" class="GrammarDetailWritingInfo ReviewMoreIcon"  data-grammar-id="${grammar.id}"> 
					<img class="shadowToTalEffects" src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Very-Basic-Search-icon.png" width="27"> 
				 </a>	
		
				<!--유저 글 정보들(제목,날짜..)  -->
				 <a href="#" class="GrammarDetailOthers shadowToTalEffects"  data-grammar-id="${grammar.id}"> 
				<img src="https://icons.iconarchive.com/icons/amitjakhu/drip/128/dots-3-icon.png" width="27"> 
				</a>
			</div>








			<!-- Comment -->
				<div class="d-flex mt-2 justify-content-between">
					<%-- border-top: 윗부분 경계 --%>
					<input  id="oldContent" type="text" class=" detailCommentBox commentInput border-0 form-control mt-2 mr-2 col-10" placeholder="After clicking the magnifying glass, write the sentence you want to correct...." />
					
				</div>
				<div class="d-flex mt-2 justify-content-between">
					<%-- border-top: 윗부분 경계 --%>
					<input  id="newContent" type="text" class=" detailCommentBox commentInput border-0 form-control mt-2 mr-2 col-10" placeholder="Please correct the grammatically incorrect sentence...." />
					<button  id="saveCommentIcon" data-grammar-id="${grammar.id}" type="button" class="detailCommentBox btn btn-light mt-2">save</button>
				</div>
	
			
			
			
			
	
		</div>

		<!-- 댓글 뿌리기 -->
			<div class="reviewDetailContentsBox22">
				<div class="text-secondary GrammarCommentBox666">comment</div>
			</div>
		<div class="commentTotalBox3333">
			<c:forEach items="${grammarView}" var="grammarViews">
				<!-- 여기다가 if문 만들어서 댓글 확인 -->
				<c:if test="${not empty grammarCommentView}">
					<c:forEach items="${grammarViews.grammarCommentViewList}" var="comments">
						<c:choose>
							<c:when test="${comments.grammarComment.grammarId eq grammarViews.grammar.id}">
								<div class="commentTotlaBox222 gmd gmd-2">
									<!-- 댓글쓴이, 좋아요  -->
									<div class="d-flex justify-content-between	">
										<div class="d-flex">
											<img class="languageMark ml-3" alt="언어 이모티콘" width="27"
												height="27"
												src="https://icons.iconarchive.com/icons/icons8/ios7/128/Users-Talk-icon.png">
											<div class="commentsId mt-3 ml-2 text-secondary">${comments.user.loginId}</div>
											
										</div>
										
										
										<div>
										 	<!--더보기  -->
											 <a href="#" class="more-btn"  data-comment-id="${comments.grammarComment.id}"> 
											<img class="mt-2 shadowToTalEffects" src="https://icons.iconarchive.com/icons/amitjakhu/drip/128/dots-3-icon.png" width="27" height="27"> 
											</a> 
								
										<!-- 좋아요 빈하트(안눌러 졌을 때) -->
											<c:if test="${comments.filledLike == false}">
												<a href="#" class="like-btn"
													data-comment-id="${comments.grammarComment.id}"><img
													class="languageMark ml-3 shadowToTalEffects" alt="빈하트 이모티콘" width="27"
													height="27"
													src="https://icons.iconarchive.com/icons/pictogrammers/material-light/128/heart-icon.png"></a>
											</c:if>
											<!-- 좋아요 채워진 하트(눌러 졌을 때) -->
											<c:if test="${comments.filledLike == true}">
												<a href="#" class="like-btn"
													data-comment-id="${comments.grammarComment.id}"><img
													class="languageMark ml-3 shadowToTalEffects" alt="채워진 하트 이모티콘" width="27"
													height="27"
													src="https://icons.iconarchive.com/icons/pictogrammers/material/128/heart-icon.png"></a>
											</c:if>
										</div>
										<!-- 좋아요 끝 -->
									</div>
									<div class="border-bottom oldContentArea d-flex">
										<div>
											<img class="languageMark ml-3 mb-2" alt="unchecked 이모티콘"
												width="23" height="23"
												src="https://icons.iconarchive.com/icons/icons8/windows-8/128/User-Interface-Unchecked-Checkbox-icon.png">
										</div>
										<div class="grammarOldContentText text-secondary">${comments.grammarComment.oldContent}</div>
									</div>
									<div class="newContentArea d-flex">
										<div>
											<img class="languageMark ml-3 mb-2" alt="checked 이모티콘"
												width="23" height="23"
												src="https://icons.iconarchive.com/icons/colebemis/feather/128/check-square-icon.png">
										</div>
										<div class="grammarOldContentText shadowToTalEffects">${comments.grammarComment.newContent}</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:if>

			</c:forEach>
			<c:if test="${empty grammarCommentView}">
				<div class="commentTotlaBox222 gmd gmd-2">
					<!-- 댓글쓴이, 좋아요  -->
					<div class="d-flex justify-content-between	">
						<div class="d-flex">
							<img class="languageMark ml-3" alt="언어 이모티콘" width="27"
								height="27"
								src="https://icons.iconarchive.com/icons/icons8/ios7/128/Users-Talk-icon.png">
							<div class="commentsId mt-4 ml-2"></div>
							
						</div>
						
					</div>
					<div class="border-bottom oldContentArea d-flex">
						<div>
							<img class="languageMark ml-3 mb-2" alt="unchecked 이모티콘"
								width="23" height="23"
								src="https://icons.iconarchive.com/icons/icons8/windows-8/128/User-Interface-Unchecked-Checkbox-icon.png">
						</div>
						<div class="grammarOldContentText"></div>
					</div>
					<div class="newContentArea d-flex">
						<div>
							<img class="languageMark ml-3 mb-2" alt="checked 이모티콘"
								width="23" height="23"
								src="https://icons.iconarchive.com/icons/colebemis/feather/128/check-square-icon.png">
						</div>
						<div class="grammarOldContentText shadowToTalEffects text-secondary"> We look forward to your comments.</div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<!-- 오른쪽 댓글  -->
</div>
<!-- text 부분 -->








<script>
	$(document).ready(function() {
		// 삭제 버튼 클릭
		$('#deleteGrammarBtn').on('click',function() {
							//alert("dd");

							let grammarId = $(this).data('grammar-id');

							$.ajax({
										type : "DELETE",
										url : "/grammar/delete",
										data : {
											"grammarId" : grammarId
										},
										success : function(data) {
											if (data.code == 1) {
												swal("The post is deleted.");
												location.href = "/grammar/grammar_list_view";
											} else {
												swal(data.errorMessage);
											}
										},
										error : function(request, status, error) {
											swal("Failed to save information. Please contact the administrator.");
										}

									}); // ajax
						}); // deleteGrammarBtn
						
						
						

		// 댓글 쓰기
		$('#saveCommentIcon').on('click',function(e) {
							e.preventDefault(); // a태그 올라감 방지

							let grammarId = $(this).data("grammar-id");
							let oldContent = $("#oldContent").val();
							let newContent = $("#newContent").val();

							// validation
							if (!oldContent) {
								swal("Please write the sentence to be corrected.");
								return;
							}

							if (!newContent) {
								swal("Please write the sentence to be corrected.");
								return;
							}

							// ajax
							$.ajax({
										// request
										type : "POST",
										url : "/grammar_comment/create",
										data : {
											"grammarId" : grammarId,
											"oldContent" : oldContent,
											"newContent" : newContent
										}

										// response
										,
										success : function(data) { // jquery ajax 함수가 json string을 object로 파싱해줌
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
						}); // saveCommentIcon

						
						
						
						
		// 좋아요 / 해제
		$('.like-btn').on('click',function(e) {
							e.preventDefault(); // 올라감 방지

							let commentId = $(this).data("comment-id");
							//alert(commentId);

							$.ajax({
										// request
										url : "/like/" + commentId // /comment/13

										// response
										,
										success : function(data) {
											if (data.code == 1) {
												location.reload();
											} else if (data.code == 300) {
												swal(data.errorMessage);
												// 비로그인 시 로그인 페이지로 이동
												location.href = "/user/sign_up_view";
											}
										},
										error : function(request, status, error) {
											swal("Failed to save your like. Please contact the administrator.");
										}

								}); // ajax

			}); // like-btn
			
			
			
			
			
			
			
			// 더보기 
		 	$('.more-btn').on('click', function(e){
				e.preventDefault();
				
				let commentId = $(this).data("comment-id");
				
		 	
		 	
		 	 
				$.ajax({
					type: "GET"
					, url : "/grammar_comment/get"
					, data : {"commentId" : commentId}
					, success : function(data) { // jquery ajax 함수가 json string을 object로 파싱해줌
						if (data.join == "There are no comments written.") {
							swal("Please log in.");
						} else {
							//data.booking.name
							swal("Corrected sentence : " + data.grammarComment.newContent);
							
						}
					}
					,error : function(request, status, error) {
						swal("Failed to save information. Please contact the administrator.");
					}
					
				}); // ajax 
			}); // more-btn 
			
							
							
							
			
			
			
		//  유저 글 내용 정보 더보기 
		$('.GrammarDetailWritingInfo').on('click', function(e){
			e.preventDefault();
			
			//alert("d");
			
			let grammarId = $(this).data("grammar-id");
			//alert(grammarId);
			
			$.ajax({
				type: "GET"
				, url : "/grammar/get"
				, data : {"grammarId" : grammarId}
				, success : function(data) {
					if (data.join == "There are no review written.") {
							swal("Please log in.");
						} else {
							//data.booking.name
							swal( "\nContent : " + data.grammar.content
								);						
						}
					}
				,error : function(request, status, error) {
					swal("Failed to save information. Please contact the administrator.");
				}
		
			}); // ajax
							
		}); // GrammarDetailWritingInfo
		
		
		
		
		
	
		
	//  유저 글 정보들  더보기 
		$('.GrammarDetailOthers').on('click', function(e){
			e.preventDefault();
			
			//alert("d");
			
			let grammarId = $(this).data("grammar-id");
			//alert(grammarId);
			
			$.ajax({
				type: "GET"
				, url : "/grammar/getOthers"
				, data : {"grammarId" : grammarId}
				, success : function(data) {
					if (data.join == "There are no review written.") {
							swal("Please log in.");
						} else {
							//data.booking.name
							swal(
									"Title : " + data.grammar.title
									+ "\nLangauge : " + data.grammar.languageCategoryId
									+ "\nDate of creation : " + data.grammar.updatedAt.slice(0,10)
								);						
						}
					}
				,error : function(request, status, error) {
					swal("Failed to save information. Please contact the administrator.");
				}
		
			}); // ajax
							
		}); // GrammarDetailOthers
		
		
		
		
		
		
	

	}); // ready
</script>