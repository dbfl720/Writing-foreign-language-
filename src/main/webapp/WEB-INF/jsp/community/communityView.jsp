<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- 커뮤니티  --%>
<div class="container">
	<div class="display-4 pt-5 pb-5 TopLogoEffects">
		<img alt="글쓴이 이모티콘" width="60" height="60" src="https://icons.iconarchive.com/icons/handdrawngoods/busy/128/people-structure-2-icon.png">
	New Writers !</div>
	
		<!-- 검색 -->
	<form method = "get" action="/community/search"> <!-- 검색은 주소에 정보 보여도 상관없어서 get. -->
	<div class="input-group d-flex  communitySearchBtn">
		<input id="loginId" name="loginId" type="text" class= "form-control communitySearchInput" placeholder="Search for a writer's name..">
		<button class=" btn btn-secondary h-30 communitySearchButton" type="submit" >search</button>
	</div>
	</form>
	

	
	
	<c:forEach items="${communityList}" var="communityLists">
		<div class="d-flex border-bottom rounded outer align-items-center communityTotal55 ">
			<div class="communityImg">
				<a href="/user/profile_view?userId=${communityLists.user.id}"><img class="profilePicture2" id="communityImg" alt="프로필 사진"
					src="${communityLists.user.ImagePath}"
					height="200" width="200"></a>
			</div>
			
			<div class="infoCommunity">
				<div class="fontCommunity mb-3 loginIdFont d-flex">
				
					<div class="d-flex loginIdFont">
						<img  alt="유저 사진" width="23" height="23" src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user-2-icon.png">
						<div class="my_box ml-3 communityLogin23 loginIdFont">
							<a class="my_text loginIdFont" href="/user/profile_view?userId=${communityLists.user.id}">${communityLists.user.loginId}</a>
							<div class="my_img">
								<img alt="리뷰 하트" height="27" width="27" src="https://icons.iconarchive.com/icons/github/octicons/128/goal-24-icon.png">
								The purpose of writing : ${communityLists.user.languageGoals}
							</div>
						</div>	
					</div>
				</div>
				<div class="fontCommunity d-flex mb-3">
					<img class="languageMark" alt="언어 사진" width="23" height="23"
						src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">
					<div class="communityFont">${communityLists.user.nativeCategoryId}</div>
					<img  class="arrow mt-4" alt="화살표" height="15" width="15" src="https://icons.iconarchive.com/icons/bootstrap/bootstrap/128/Bootstrap-arrow-left-right-icon.png">
					<div class="communityFont">${communityLists.user.foreignCategoryId}</div>
				</div>
				<div class="fontCommunity mb-3">
					<img class="selfIntroMark" alt="자기소개 사진" width="23" height="23"
						src="https://icons.iconarchive.com/icons/icons8/ios7/128/User-Interface-Voice-Recognition-Scan-icon.png">
					${communityLists.user.selfIntroduction}
				</div>
			</div>
		</div>
	</c:forEach>
	
</div>
