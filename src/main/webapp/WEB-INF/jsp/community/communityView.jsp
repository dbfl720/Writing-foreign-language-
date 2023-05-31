<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- 커뮤니티  --%>
<div class="container">
	<div class="display-4 pt-5 pb-5 TopLogoEffects">
		<img alt="글쓴이 이모티콘" width="55" height="55" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png">
	Write your own Review!</div>
	
	<c:forEach items="${communityList}" var="communityLists">
		<div class="d-flex border-bottom rounded outer align-items-center communityTotal55">
			<div class="communityImg">
				<a href="/user/profile_view?userId=${communityLists.user.id}"><img class="profilePicture2" id="communityImg" alt="프로필 사진"
					src="${communityLists.user.imagePath}"
					height="200" width="200"></a>
			</div>
			<div class="infoCommunity">
				<div class="fontCommunity mb-3">
					<a class="loginIdFont" href="/user/profile_view?userId=${communityLists.user.id}"><img alt="유저 사진" width="30" height="30"
						src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user-2-icon.png">
					${communityLists.user.loginId}</a>
				</div>
				<div class="fontCommunity d-flex mb-3">
					<img class="languageMark" alt="언어 사진" width="30" height="30"
						src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">
					<div class="communityFont">${communityLists.user.nativeCategoryId}</div>
					<img  class="arrow" alt="화살표" height="30" width="30" src="https://icons.iconarchive.com/icons/pictogrammers/material-arrow/128/arrow-left-right-icon.png">
					<div class="communityFont">${communityLists.user.foreignCategoryId}</div>
				</div>
				<div class="fontCommunity mb-3">
					<img class="selfIntroMark" alt="자기소개 사진" width="30" height="30"
						src="https://icons.iconarchive.com/icons/icons8/ios7/128/User-Interface-Voice-Recognition-Scan-icon.png">
					${communityLists.user.selfIntroduction}
				</div>
			</div>
		</div>
	</c:forEach>
</div>
