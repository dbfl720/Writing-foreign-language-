<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="header">
	<div class="d-flex justify-content-between">
		<div class="ami">Ami</div>

		<%-- 프로필 사진 --%>
		<%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
		<c:if test="${not empty userId}">
			<input type="file" id="file2" multiple='multiple' class="d-none"
				accept=".gif, .jpg, .png, .jpeg , .webp">
			<div class=" headerBox d-flex align-items-center">
				<img id="headerImg" alt="프로필 사진" src="${ImagePath}" height="35"
					width="35">
				<div class="ml-3 headerProfileText ">${loginId}</div>
				<a href="/user/profile_view?loginId=${loginId}" class="ml-5 mr-5"><img
					alt="프로필 이모티콘" height="40" width="40"
					src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user-setting-icon.png"></a>
			</div>
		</c:if>

		<c:if test="${empty userId}">
		
		</c:if>
	</div>
</div>