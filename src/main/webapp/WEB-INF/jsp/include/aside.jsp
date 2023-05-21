<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex">
	<div class="asideMenu">
		<div class="communityText"><a href="/community/community_view" class="asideText"><img id="communityImg" alt="커뮤니티 이미지" width="50" height="50" src="https://icons.iconarchive.com/icons/handdrawngoods/busy/128/people-structure-2-icon.png" >
		Community</a></div>
		<div class="communityText"><a href="/grammar/grammar_list_view" class="asideText"><img id="communityImg" alt="커뮤니티 이미지" width="50" height="50" src="https://icons.iconarchive.com/icons/pixelkit/swanky-outlines/128/05-Bookmark-Book-icon.png" >
		Grammar</a></div>
		<div class="communityText"><a href="/review/review_list_view" class="asideText"><img id="communityImg" alt="커뮤니티 이미지" width="50" height="50" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png" >
		Review</a></div>
		<div class="communityText"><a href="#" class="asideText"><img id="communityImg" alt="커뮤니티 이미지" width="50" height="50" src="https://icons.iconarchive.com/icons/praveen/minimal-outline/128/microphone-icon.png" >
		Live</a></div>
		<c:choose>
			<c:when test="${empty userId}">
			<div class="communityText"><a href="/user/sign_up_view" class="asideText"><img id="communityImg" alt="커뮤니티 이미지" width="50" height="50" src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Internet-Smiley-icon.png" >
			Login</a></div>
			</c:when>
			<c:otherwise>
			<div class="communityText"><a href="/user/sign_out_view" class="asideText"><img id="communityImg" alt="커뮤니티 이미지" width="50" height="50" src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Internet-Smiley-icon.png" >
			Logout</a></div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class='v-line'></div>
</div>