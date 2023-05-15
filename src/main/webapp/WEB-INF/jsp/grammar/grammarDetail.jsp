<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="GrammarDetailTextBox">
				<div class="GrammarLeftInfo">
					<div class="d-flex">
						<img class="updateProfileIcon ml-3" alt="제목 이모티콘" width="35" height="35" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Science-Literature-icon.png">
						<div class="grammarDetailFont">${grammar.title}</div>
					</div>
					<div class="d-flex">
						<div class="d-flex"><img class="languageMark ml-3" alt="언어 이모티콘" width="35" height="35"
							src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">
							<div class="grammarDetailFontLang">${grammar.languageCategoryId}</div></div>
						<div class="d-flex grammarDateBox"><img class="dateMark ml-3" alt="날짜 이모티콘" width="35" height="35"
							src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Time-Tear-Off-Calendar-icon.png">
							<div class="grammarDetailFont"><fmt:formatDate value="${grammar.updatedAt}" pattern="dd-MM-yyyy" /></div>
						</div>
					</div>
					<div class="GrammarDetailTextBox2">
						<textarea id="content" class="GrammarDetailText" placeholder="Today is...">${grammar.content}</textarea>
					</div>
					
					<c:if test="${grammar.userId eq userId}">
						<div class="d-flex">
							<div class="GrammarSaveIcon">
								<a href="#" id="deleteGrammarBtn" data-grammar-id="${grammar.id}">
									<img class="updateProfileIcon" alt="글 삭제 이모티콘" width="35" height="35" src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Editing-Delete-icon.png">
								</a>
							</div>
						</div>	
					</c:if>
				</div>	
			</div>
</div>


<script>
	$(document).ready(function() {
		// 삭제 버튼 클릭
		$('#deleteGrammarBtn').on('click', function(){
			//alert("dd");
			
			let grammarId = $(this).data('grammar-id');
			
			
			$.ajax({
				type:"DELETE"
				, url:"/grammar/delete"
				, data: {"grammarId" : grammarId}
				, success: function(data) {
					if(data.code == 1) {
						swal("The post is deleted.");
						location.href="/grammar/grammar_list_view";
					} else {
						swal(data.errorMessage);
					}
				}
				, error : function(request, status, error) {
					swal("Failed to save information. Please contact the administrator.");
				}
				
				
				
				
			}); // ajax
		});
		
	});  // ready


</script>