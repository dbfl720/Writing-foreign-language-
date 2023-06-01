<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex aside">
	<div class="asideMenu">
	
		<div class="d-flex menuAmi">
		<img id="communityImg" alt="커뮤니티 이미지" width="38" height="38" src="https://icons.iconarchive.com/icons/handdrawngoods/busy/128/people-structure-2-icon.png" >
		 <button class="custom-btn btn-12" onclick="location.href='/community/community_view'" class="custom-btn btn-12"><span class="communtiFont">Click!</span><span class="communtiFont">Community</span></button>
		 </div>
		 
		 
		<div class="d-flex menuAmi">
		<img id="communityImg" alt="커뮤니티 이미지" width="38" height="38" src="https://icons.iconarchive.com/icons/pixelkit/swanky-outlines/128/05-Bookmark-Book-icon.png" >
		 <button class="custom-btn btn-12" onclick="location.href='/grammar/grammar_list_view'" class="custom-btn btn-12"><span class="communtiFont">Click!</span><span class="communtiFont">Grammar</span></button>
		 </div>
		 
		 <div class="d-flex menuAmi">
		 <img id="communityImg" alt="커뮤니티 이미지" width="38" height="38" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png" >
		  <button class="custom-btn btn-12" onclick="location.href='/review/review_list_view'" class="custom-btn btn-12"><span class="communtiFont">Click!</span><span class="communtiFont">Review</span></button>
		 </div>
		 
		 <div class="d-flex menuAmi">
		 <img id="communityImg" alt="커뮤니티 이미지" width="38" height="38" src="https://icons.iconarchive.com/icons/praveen/minimal-outline/128/microphone-icon.png" >
		   <button class="custom-btn btn-12" onclick="location.href='/live/live_view'" class="custom-btn btn-12"><span class="communtiFont">Click!</span><span class="communtiFont">Live</span></button>
		 </div>

		<c:choose>
			<c:when test="${empty userId}">
			 <div class="d-flex menuAmi">  
			 <img id="communityImg" alt="커뮤니티 이미지" width="38" height="38" src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Internet-Smiley-icon.png" >
		    <button class="custom-btn btn-12" onclick="location.href='/user/sign_up_view'" class="custom-btn btn-12"><span class="communtiFont">Click!</span><span class="communtiFont">Login</span></button>
			</div>
			</c:when>
			<c:otherwise>		
			 <div class="d-flex menuAmi">  
			 <img id="communityImg" alt="커뮤니티 이미지" width="38" height="38" src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Internet-Smiley-icon.png" >
		    <button class="custom-btn btn-12" onclick="location.href='/user/sign_out_view'" class="custom-btn btn-12"><span class="communtiFont">Click!</span><span class="communtiFont">Logout</span></button>
			</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class='v-line'></div>
</div>