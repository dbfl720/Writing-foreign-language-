<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container"> 

	<div class="display-4 pt-5 pb-5">
		<img alt="글쓴이 이모티콘" width="55" height="55" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png">
			How do you like this article?</div>
			
	<%-- 프로필 사진 --%>
	<%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
	<input type="file" id="file" multiple='multiple' class="d-none"
						accept=".gif, .jpg, .png, .jpeg , .webp">
	<div class="reviewTotal55">
		<div class="d-flex">
			<div class="reviewDetailBox">
				<%-- 수정 아이콘 --%>
				<c:if test="${user.id eq userId}">
				<a href="#" id="updateProfileBtn">
				<img class="updateProfileIcon" alt="업데이트 이모티콘" width="36" height="36" src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Programming-Save-icon.png">
				</a>
				</c:if>
				
				<div class="reviewBox mr-3">
					<img id="reviewImg" class=" review" alt="프로필 사진"
						src="https://cdn.pixabay.com/photo/2023/04/29/18/12/goslings-7959052_1280.jpg" height="300" width="300">
				</div>
				
				
				<c:if test="${user.id eq userId}">
					<a href="#" id="profileBtn">
					<img alt="프로필 변경 이모티콘" width="36" height="36"	src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Photo-icon.png" >
					</a>
				
					<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
					<div id="fileName" class="text-secondary ml-2 mt-2"></div>
				</c:if>	
					
			</div>
		
			<div class="d-flex justify-content-center">
			<textarea name="description" type="text" id= "ReviewDetailText" class="form-control mt-3"></textarea>
			</div>
	
		</div> <!-- d-flex  -->
					<%-- 유저 정보들 --%>	
				<div class="ReviewUserInfo border-right">
					<div class="profileLoginIdText">
					<img alt="유저 사진" width="32" height="32"
						src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user-2-icon.png">
						${user.loginId}</div>
					<div class="profileTotalText">
					<img class="languageMark" alt="언어 사진" width="32" height="32"
						src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">
					${user.nativeCategoryId}
						<img alt="화살표" height="32" width="32" src="https://icons.iconarchive.com/icons/pictogrammers/material-arrow/128/arrow-left-right-icon.png">
						${user.foreignCategoryId}
					</div>
					<div class="profileTotalText"><img alt="타입 이미지" height="32" width="32" src="data:image/png;base64,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">
						Type
					</div>	
					<div class="profileTotalText"><img alt="주제 이미지" height="32" width="32" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Science-Literature-icon.png">
						Title
					</div>	
					<div class="profileTotalText"><img alt="별 이미지" height="50" width="50" src="data:image/png;base64,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">
						Total Review 개수
					</div>	
				</div>
	
	
	
		</div> <!-- reviewTotal55 끝 -->
</div>

