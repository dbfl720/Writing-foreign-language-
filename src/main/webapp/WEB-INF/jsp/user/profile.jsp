<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 프로필 사진 --%>
<%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
<input type="file" id="file" multiple='multiple' class="d-none"
					accept=".gif, .jpg, .png, .jpeg , .webp">
<div>
	<div class="d-flex">
		<div class="profileTotalBox">
			<div class=" profileBox mr-3">
				<img id="profileImg" class=" profile" alt="프로필 사진"
					src="${user.imagePath}"
					height="500" width="500">
			</div>
			<a href="#" id="profileBtn">
			<img   alt="프로필 변경 이모티콘" width="45" height="45"	src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Photo-icon.png" >
			</a>
		</div>
		
		<%-- 유저 정보들 --%>
		<div class="my-box">
			<div class="profileTotalText">${user.loginId}</div>
			<div class="profileTotalText">${user.nativeCategoryId}
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
			<%-- <div class="secondMyBox">
				<div class="profileTotalText">${user.selfIntroduction}</div>
			</div>
			언어 목표
			<div class="secondMyBox">
				<div class="profileTotalText">${user.languageGoals}</div>
			</div> --%>
			
		</div>	
			<div class="secondMyBox">
				<textarea id="selfIntroduction" class="signUpWhoBox" rows = "3" cols = "48" name = "selfIntroduction" onfocus="labelUp(this)" onblur="labelDown(this)" required ></textarea>
			</div>

			<div class="secondMyBox">
				<textarea id="languageGoals" class="signUpPurposeBox" rows = "3" cols = "48" name = "languageGoals" onfocus="labelUp(this)" onblur="labelDown(this)" required ></textarea>
			</div>
			<%-- 수정 아이콘 --%>
			<a href="#" id="updateProfileIcon">
			<img class="updateProfileIcon" alt="업데이트 이모티콘" width="45" height="45" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Very-Basic-Settings-Wrench-icon.png">
			</a>
			<%-- 저장 아이콘 --%>
			<a href="#" id="saveProfileIcon">
			<img class="saveProfileIcon" alt="업데이트 이모티콘" width="45" height="45"	src="https://icons.iconarchive.com/icons/pictogrammers/material-light/128/content-save-icon.png">
			</a>
</div>



<script>
$(document).ready(function() {
			// 파일업로드 이미지 클릭 => 숨겨져 있는 file 태그를 동작 시킨다.
			$("#profileBtn").on('click', function(e) { // e객체 꼭 있어야함.
				e.preventDefault(); // a 태그의 스크롤이 올라가는 현상 방지
				$('#file').click(); // input file을 클릭한 것과 같은 효과
			});

			
			// 사용자가 이미지를 선택했을 때 유효성 확인 및 업로드 된 파일명 노출
			$("#file").on('change', function(e) { // e가 파일객체들고 있음.
						let fileName = e.target.files[0].name; // amsterdam-7917858_1280.jpg  // target = this 같음. 즉, #file 가리킴.
						console.log(fileName);

				// 확장자 유효성 확인
				let ext = fileName.split(".").pop().toLowerCase();
				if (ext != "jpg" && ext != "png" && ext != "jpeg"
						&& ext != "gif" && ext != "webp") {
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$("#file").val(""); // 파일 태그에 파일 제거
					$("#fileName").text(""); // 파일 이름 비우기
					return;
				}
		
				// 유효성 통과한 이미지는 상자에 업로드 된 파일 이름 노출
				$("#fileName").text(fileName); // 태그 사이에 글자를 넣는 함수 : text()  
			}); // file

});// ready

</script>