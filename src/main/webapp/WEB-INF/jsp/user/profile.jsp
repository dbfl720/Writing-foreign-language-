<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 프로필 사진 --%>
<%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
<input type="file" id="file2" multiple='multiple' class="d-none"
					accept=".gif, .jpg, .png, .jpeg , .webp">
<div>
	<div class="d-flex">
		<div class="profileTotalBox">
			<div class=" profileBox mr-3">
				<img id="profileImg" class=" profile" alt="프로필 사진"
					src="https://cdn.pixabay.com/photo/2023/04/28/14/35/dog-7956828_640.jpg"
					height="500" width="500">
			</div>
			<a href="#" id="profileBtn">
			<img   alt="프로필 변경 이모티콘" width="45" height="45"	src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Photo-icon.png" >
			</a>
		</div>
		
		<%-- 유저 정보들 --%>
		<div class="my-box">
			<div class="profileTotalText">userId</div>
			<div class="profileTotalText">nativeLanguage
				<img alt="화살표" height="50" width="50" src="https://icons.iconarchive.com/icons/pictogrammers/material-arrow/128/arrow-left-right-icon.png">
				foreignLanguage
			</div>
			<div class="profileTotalText"><img alt="좋아요 하트" height="50" width="50" src="https://icons.iconarchive.com/icons/pictogrammers/material-light/128/heart-icon.png">
				Grammar heart 개수
			</div>	
			<div class="profileTotalText"><img alt="리뷰 하트" height="50" width="50" src="https://icons.iconarchive.com/icons/pictogrammers/material-light/128/heart-icon.png">
				Review heart 개수
			</div>	
			<div class="profileTotalText"><img alt="리뷰 하트" height="50" width="50" src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user2-edit-icon.png">
				Total Review 개수
			</div>	
		</div>
	</div> <%-- d-flex 끝. --%>
			<%-- 자기 소개 --%>
			<div class="secondMyBox">
				<div class="profileTotalText">Who are you?</div>
			</div>
			<%-- 언어 목표 --%>
			<div class="secondMyBox">
				<div class="profileTotalText">The purpose of writing</div>
			</div>
</div>
