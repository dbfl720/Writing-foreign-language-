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
	<div class="input-group d-flex ml-5 col-2">
		<input id="loginId" name="loginId" type="text" class="form-control " placeholder="홍유리를 검색해보세요.">
		<button class="btn btn-success h-30" type="submit" >검색</button>
	</div>
	</form>
	
	
	
	
	

	  <c:if test="${user.user.loginId eq loginId}">
		<div class="d-flex border-bottom rounded outer align-items-center communityTotal55 ">
			<div class="communityImg">
				<a href="/user/profile_view?userId=${user.user.id}"><img class="profilePicture2" id="communityImg" alt="프로필 사진"
					src="${user.user.imagePath}"
					height="200" width="200"></a>
			</div>
			
			<div class="infoCommunity">
				<div class="fontCommunity mb-3 loginIdFont d-flex">
				
					<div class="d-flex loginIdFont">
						<img  alt="유저 사진" width="23" height="23" src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user-2-icon.png">
						<div class="my_box ml-3 communityLogin23 loginIdFont">
							<a class="my_text loginIdFont" href="/user/profile_view?userId=${user.user.id}">${user.user.loginId}</a>
							<div class="my_img">
								<img alt="리뷰 하트" height="27" width="27" src="https://icons.iconarchive.com/icons/github/octicons/128/goal-24-icon.png">
								The purpose of writing : ${user.user.languageGoals}
							</div>
						</div>	
					</div>
				</div>
				<div class="fontCommunity d-flex mb-3">
					<img class="languageMark" alt="언어 사진" width="23" height="23"
						src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">
					<div class="communityFont">${user.user.nativeCategoryId}</div>
					<img  class="arrow mt-4" alt="화살표" height="15" width="15" src="https://icons.iconarchive.com/icons/bootstrap/bootstrap/128/Bootstrap-arrow-left-right-icon.png">
					<div class="communityFont">${user.user.foreignCategoryId}</div>
				</div>
				<div class="fontCommunity mb-3">
					<img class="selfIntroMark" alt="자기소개 사진" width="23" height="23"
						src="https://icons.iconarchive.com/icons/icons8/ios7/128/User-Interface-Voice-Recognition-Scan-icon.png">
					${user.user.selfIntroduction}
				</div>
			</div>
		</div>
	</c:if>
	
	
	<c:if test="${user.user.loginId ne loginId}">
	
	dfdfd
	</c:if>
</div>
