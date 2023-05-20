<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container d-flex">
	<!-- text 부분 -->
	<div class="GrammarDetailTextBox">
		<div class="GrammarLeftInfo">
			<div class="d-flex">
				<img class="updateProfileIcon ml-3" alt="제목 이모티콘" width="35"
					height="35"
					src="https://icons.iconarchive.com/icons/icons8/ios7/128/Science-Literature-icon.png">
				<div class="grammarDetailFont">${grammar.title}</div>
			</div>
			<div class="d-flex">
				<div class="d-flex">
					<img class="languageMark ml-3" alt="언어 이모티콘" width="35" height="35"
						src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">
					<div class="grammarDetailFontLang">${grammar.languageCategoryId}</div>
				</div>
				<div class="d-flex grammarDateBox">
					<img class="dateMark ml-3" alt="날짜 이모티콘" width="35" height="35"
						src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Time-Tear-Off-Calendar-icon.png">
					<div class="grammarDetailFont">
						<fmt:formatDate value="${grammar.updatedAt}" pattern="dd-MM-yyyy" />
					</div>
				</div>
			</div>
			<div class="GrammarDetailTextBox2">
				<textarea id="content" class="GrammarDetailText"
					placeholder="Today is...">${grammar.content}</textarea>
			</div>

			<c:if test="${grammar.userId eq userId}">
				<div class="d-flex">
					<div class="GrammarSaveIcon">
						<a href="#" id="deleteGrammarBtn" data-grammar-id="${grammar.id}">
							<img class="updateProfileIcon" alt="글 삭제 이모티콘" width="35"
							height="35"
							src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Editing-Delete-icon.png">
						</a>
					</div>
				</div>
			</c:if>
		</div>
	</div>

	<div class='v-line'></div>

	<!--오른쪽 댓글  -->
	<div class="GrammarDetailTextBox6666">
		<div class="GrammarLeftInfo">
			<div class="d-flex commentLangagugeIcon">
				<div class="d-flex">
					<img class="languageMark ml-3" alt="언어 이모티콘" width="35" height="35"
						src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">
					<div class="grammarDetailFontLang">${grammar.languageCategoryId}</div>
				</div>
				<div class="d-flex grammarDateBox">
					<img class="dateMark ml-3" alt="날짜 이모티콘" width="35" height="35"
						src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Time-Tear-Off-Calendar-icon.png">
					<div class="grammarDetailFont">
						<fmt:formatDate value="${grammar.updatedAt}" pattern="dd-MM-yyyy" />
					</div>
				</div>
				<div class="d-flex justify-content-end CommentSaveIcon">
					<div class="CommentSaveIcon">
						<a href="#" id="saveCommentIcon" data-grammar-id="${grammar.id}">
							<img class="saveCommentIcon" alt="댓글 저장 이모티콘" width="38"
							height="38"
							src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Programming-Save-As-icon.png">
						</a>
					</div>
				</div>
			</div>


			<!-- Comment -->
			<div class="GrammarDetailTextBox999999">
				<textarea id="oldContent" class="GrammarDetailComment"
					placeholder="OldText"></textarea>
				<textarea id="newContent" class="GrammarDetailComment"
					placeholder="NewText"></textarea>
			</div>
		</div>

		<!-- 댓글 뿌리기 -->
		<div class="commentsBoxIcon">
			<img alt="댓글 이모티콘" width="55" height="55"
				src="https://icons.iconarchive.com/icons/github/octicons/128/comment-discussion-24-icon.png">
		</div>
		<div class="commentTotalBox3333">
			<c:forEach items="${grammarView}" var="grammarViews">
				<!-- 여기다가 if문 만들어서 댓글 확인 -->
				<c:if test="${not empty grammarCommentView}">
					<c:forEach items="${grammarViews.grammarCommentViewList}" var="comments">
						<c:choose>
							<c:when test="${comments.grammarComment.grammarId eq grammarViews.grammar.id}">
								<div class="commentTotlaBox222">
									<!-- 댓글쓴이, 좋아요  -->
									<div class="d-flex justify-content-between	">
										<div class="d-flex">
											<img class="languageMark ml-3" alt="언어 이모티콘" width="35"
												height="35"
												src="https://icons.iconarchive.com/icons/icons8/ios7/128/Users-Talk-icon.png">
											<div class="commentsId mt-4 ml-2">${comments.user.loginId}</div>
										</div>
										<!-- 좋아요 빈하트(안눌러 졌을 때) -->
								
											<c:if test="${comments.filledLike == false}">
												<a href="#" class="like-btn"
													data-comment-id="${comments.grammarComment.id}"><img
													class="languageMark ml-3" alt="빈하트 이모티콘" width="35"
													height="35"
													src="https://icons.iconarchive.com/icons/pictogrammers/material-light/128/heart-icon.png"></a>
											</c:if>
											<!-- 좋아요 채워진 하트(눌러 졌을 때) -->
											<c:if test="${comments.filledLike == true}">
												<a href="#" class="like-btn"
													data-comment-id="${comments.grammarComment.id}"><img
													class="languageMark ml-3" alt="채워진 하트 이모티콘" width="35"
													height="35"
													src="https://icons.iconarchive.com/icons/pictogrammers/material/128/heart-icon.png"></a>
											</c:if>
										
										<!-- 좋아요 끝 -->
									</div>
									<div class="border-bottom oldContentArea d-flex">
										<div>
											<img class="languageMark ml-3 mb-2" alt="unchecked 이모티콘"
												width="30" height="30"
												src="https://icons.iconarchive.com/icons/icons8/windows-8/128/User-Interface-Unchecked-Checkbox-icon.png">
										</div>
										<div class="grammarOldContentText">${comments.grammarComment.oldContent}</div>
									</div>
									<div class="newContentArea d-flex">
										<div>
											<img class="languageMark ml-3 mb-2" alt="checked 이모티콘"
												width="30" height="30"
												src="https://icons.iconarchive.com/icons/colebemis/feather/128/check-square-icon.png">
										</div>
										<div class="grammarOldContentText">${comments.grammarComment.newContent}</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:if>

			</c:forEach>
			<c:if test="${empty grammarCommentView}">
				<div class="commentTotlaBox222">
					<!-- 댓글쓴이, 좋아요  -->
					<div class="d-flex justify-content-between	">
						<div class="d-flex">
							<img class="languageMark ml-3" alt="언어 이모티콘" width="35"
								height="35"
								src="https://icons.iconarchive.com/icons/icons8/ios7/128/Users-Talk-icon.png">
							<div class="commentsId mt-4 ml-2"></div>
						</div>
					</div>
					<div class="border-bottom oldContentArea d-flex">
						<div>
							<img class="languageMark ml-3 mb-2" alt="unchecked 이모티콘"
								width="30" height="30"
								src="https://icons.iconarchive.com/icons/icons8/windows-8/128/User-Interface-Unchecked-Checkbox-icon.png">
						</div>
						<div class="grammarOldContentText"></div>
					</div>
					<div class="newContentArea d-flex">
						<div>
							<img class="languageMark ml-3 mb-2" alt="checked 이모티콘" width="30"
								height="30"
								src="https://icons.iconarchive.com/icons/colebemis/feather/128/check-square-icon.png">
						</div>
						<div class="grammarOldContentText"></div>
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
						$('#deleteGrammarBtn')
								.on('click',function() {
											//alert("dd");

											let grammarId = $(this).data(
													'grammar-id');

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
														error : function(
																request,
																status, error) {
															swal("Failed to save information. Please contact the administrator.");
														}

													}); // ajax
										}); // deleteGrammarBtn

						// 댓글 쓰기
						$('#saveCommentIcon')
								.on(
										'click',
										function(e) {
											e.preventDefault(); // a태그 올라감 방지

											let grammarId = $(this).data(
													"grammar-id");
											let oldContent = $("#oldContent")
													.val();
											let newContent = $("#newContent")
													.val();

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
											$
													.ajax({
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
																location
																		.reload(true);
																swal(data.code);
															} else {
																swal(data.errorMessage);
															}
														},
														error : function(
																request,
																status, error) {
															swal("Failed to save information. Please contact the administrator.");
														}

													}); // ajax 
										}); // saveCommentIcon

						// 좋아요 / 해제
						$('.like-btn').on('click',function(e) {
											e.preventDefault(); // 올라감 방지

											let commentId = $(this).data(
													"comment-id");
											//alert(commentId);

											$.ajax({
														// request
														url : "/like/"
																+ commentId // /comment/13

														// response
														,
														success : function(data) {
															if (data.code == 1) {
																location
																		.reload();
															} else if (data.code == 300) {
																swal(data.errorMessage);
																// 비로그인 시 로그인 페이지로 이동
																location.href = "/user/sign_up_view";
															}
														},
														error : function(
																request,
																status, error) {
															swal("Failed to save your like. Please contact the administrator.");
														}

													}); // ajax

										}); // like-btn

					}); // ready
</script>