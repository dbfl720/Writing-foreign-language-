<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="GrammarTotalOutline"> 
	<div class="display-4 pt-5 pb-5 TopLogoEffects">
		<img alt="글쓴이 이모티콘" width="55" height="55" src="https://icons.iconarchive.com/icons/pixelkit/swanky-outlines/128/05-Bookmark-Book-icon.png">
			Write what you want to be corrected !</div>
		<div class="d-flex  GrammarBox">
			<input  id="title"  type="text" class=" GrammarTitleInput shadowToTalEffects" placeholder="title">
				<select id="languageCategoryId" class="GrammarSelective shadowToTalEffects" name="languageCategoryId">
					<%-- name은 필드명과 같아야 한다. --%>
					<option value="none" selected>language</option>
					<option value="KO">KO</option>
					<option value="EN">EN</option>
					<option value="JP">JP</option>
					<option value="CHN">CHN</option>
					<option value="FRA">FRA</option>
					<option value="SWE">SWE</option>
					<option value="DEU">DEU</option>
					<option value="VNM">VNM</option>
					<option value="Others">Others</option>
				</select>
		</div>
			<div class="GrammarTextBox">
					<div class="GrammarTextBox2">
						<textarea id="content" class="GrammarText shadowToTalEffects" placeholder="Today is..."></textarea>
					</div>
					<div class="d-flex">
						<div class="GrammarSaveIcon">
							<a href="#" id="saveGrammarBtn">
								<img class="shadowToTalEffects updateProfileIcon" alt="저장 이모티콘" width="30" height="30" src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Programming-Save-icon.png">
							</a>
						</div>
						<div class="GrammarDeleteIcon">
							<a href="#" id="deleteGrammarBtn">
								<img class="shadowToTalEffects updateProfileIcon mt-3" alt="삭제 이모티콘" width="30" height="30" src="https://icons.iconarchive.com/icons/github/octicons/128/x-16-icon.png">
							</a>
						</div>
						<div class="GrammarListIcon6666">
							<a href="/grammar/grammar_list_view">
								<img class="shadowToTalEffects" alt="목록 이모티콘" width="30" height="30" src="https://icons.iconarchive.com/icons/github/octicons/128/list-unordered-24-icon.png">
							</a>
						</div>
					</div>		
			</div>
	</div>
</div>





<script>
$(document).ready(function() {
	// 그래머 저장
	$('#saveGrammarBtn').on('click', function() {
		let title = $('#title').val();
		let content = $('#content').val();
		var selectLanguage = document.getElementById('languageCategoryId');
		var selectLanguageIndex = document.getElementById('languageCategoryId').options.selectedIndex;
		var selectLanguageValue = selectLanguage.options[selectLanguageIndex].value;
		
		
		// validation
		if (!title) {
			swal("Please enter a title.");
			return;
		}
		
		
		if (selectLanguageValue == 'none') {
			swal("Please select one foreign language.");
			return;
		}
		
		
		if (!content) {
			swal("Please enter your content.");
			return;
		}
		
		
		if (content.length < 10) {
			swal("Please write at least 10 characters.");
			return;
		}
		
		
		
	
		
		
		
		
		// AJAX 전송
		$.ajax({
			// request
			type: "post"
			, url: "/grammar/create"
			, data: {"selectLanguageValue" : selectLanguageValue
					, "title" : title
					, "content": content}
			
			
			// response
			, success : function(data) {
				if (data.code == 1) {
					//location.reload();
					swal(data.result);
				} else {
					swal(data.errorMessage);
				}
				
			}
			, error : function(request, status, error) {
				swal("Failed to save information. Please contact the administrator.");
			}
				
		});   // ajax
		
		
	}); // saveGrammarBtn
	
	
	
	
	
	
	// 모두 지우기 버튼
	$('#deleteGrammarBtn').on('click', function(e){
		e.preventDefault();
		
		let title = $('').val();
		let content = $('').val();
		location.reload(true);
		
	}); // deleteGrammarBtn
	
	
}); // ready


</script>
