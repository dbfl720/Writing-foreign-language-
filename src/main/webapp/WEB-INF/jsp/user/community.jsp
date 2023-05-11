<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- 커뮤니티  --%>
<div class="container">
	<c:forEach items="${listUser}" var="users">
		<div class="d-flex border rounded outer">
			<div class="communityImg">
				<a href="/user/profile_view"><img id="communityImg" alt="프로필 사진"
					src="${users.imagePath}"
					height="250" width="250"></a>
			</div>
			<div class="infoCommunity">
				<div class="fontCommunity mb-3">
					<a href="/user/profile_view"><img alt="유저 사진" width="30" height="30"
						src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Users-Name-icon.png">
					${users.loginId}</a>
				</div>
				<div class="fontCommunity d-flex mb-3">
					<img alt="언어 사진" width="30" height="30"
						src="https://icons.iconarchive.com/icons/fa-team/fontawesome/128/FontAwesome-Language-icon.png">
					<div class="communityFont">${users.nativeCategoryId}</div>
					<img  class="ml-2" alt="화살표" height="40" width="40" src="https://icons.iconarchive.com/icons/pictogrammers/material-arrow/128/arrow-left-right-icon.png">
					<div class="communityFont">${users.foreignCategoryId}</div>
				</div>
				<div class="fontCommunity mb-3">
					<img alt="자기소개 사진" width="30" height="30"
						src="https://icons.iconarchive.com/icons/icons8/ios7/128/User-Interface-Voice-Recognition-Scan-icon.png">
					${users.selfIntroduction}
				</div>
			</div>
		</div>
	</c:forEach>
</div>