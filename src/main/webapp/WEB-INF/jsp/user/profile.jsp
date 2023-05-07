<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 프로필 사진 --%>
<%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
<input type="file" id="file2" multiple='multiple' class="d-none"
					accept=".gif, .jpg, .png, .jpeg , .webp">

<div class="parents" >
	<div class=" profileBox mr-3 child">
		<img id="profileImg" class=" profile" alt="프로필 사진"
			src="https://cdn.pixabay.com/photo/2023/04/28/14/35/dog-7956828_640.jpg"
			height="250" width="300">
	</div>
	<a href="#" id="profileBtn" class="child">
	<img   alt="프로필 변경 이모티콘" width="45" height="45"	src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Photo-icon.png" >
	</a>
</div>