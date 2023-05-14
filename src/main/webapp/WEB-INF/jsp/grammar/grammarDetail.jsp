<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">
	<div class="GrammarDetailTextBox">
				<div class="GrammarLeftInfo">
					<div>
						<img class="updateProfileIcon ml-3" alt="제목 이모티콘" width="35" height="35" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Science-Literature-icon.png">
					</div>
					<div>
					<img class="languageMark ml-3" alt="언어 이모티콘" width="35" height="35"
						src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">
					
					</div>
					<div class="GrammarDetailTextBox2">
						<textarea id="content" class="GrammarDetailText" placeholder="Today is..."></textarea>
					</div>
					<div class="d-flex">
						<div class="GrammarSaveIcon">
							<a href="#" id="saveGrammarBtn">
								<img class="updateProfileIcon" alt="저장 이모티콘" width="35" height="35" src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Programming-Save-icon.png">
							</a>
						</div>
						<div class="GrammarDeleteIcon">
							<a href="#" id="deleteGrammarBtn">
								<img class="updateProfileIcon mt-1" alt="삭제 이모티콘" width="50" height="50" src="https://icons.iconarchive.com/icons/github/octicons/128/x-16-icon.png">
							</a>
						</div>
					</div>	
				</div>	
			</div>
</div>