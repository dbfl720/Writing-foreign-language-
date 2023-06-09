<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="header">
	<div class="d-flex justify-content-between">
		<a href="/community/community_view" class="headerAmi126"><div class="ami TopLogoEffects brigthEffect headerAmi">Ami</div></a>
		<%-- 프로필 사진 --%>
		<%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
		<c:if test="${not empty userId}">
			<input type="file" id="file2" multiple='multiple' class="d-none"
				accept=".gif, .jpg, .png, .jpeg , .webp">
			<div class=" headerBox d-flex align-items-center TopLogoEffects">
				<div class="nameHeader ">Hello__</div>
				<div class="ml-3 headerProfileText">${loginId}</div>
				<div class="nameHeader "> _?</div>
				<a href="/user/profile_view?userId=${userId}" class="ml-5 "><img
					alt="프로필 이모티콘" height="30" width="30" class="shadowToTalEffects"
					src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user-setting-icon.png"></a>
			
				<a href="#" class="headerInfomation" data-toggle="modal" data-target="#staticBackdrop" data-live-id=""> <img
					 class="myinfoImg3344 shadowToTalEffects" width="25" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Holidays-Jingle-Bell-icon.png">
				</a>
				
				
				 <!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel" class="headerMyInfoFont">Copyright@2023 YURI. All Rights Reserved.</h5>
				        <button type="button" class="close headerMyInfoFont" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true"><img alt="글쓴이 이모티콘" width="25" height="25" src="https://icons.iconarchive.com/icons/github/octicons/128/x-24-icon.png"></span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <div class="headerMyInfoFont">Project name :Writing-foreign-language program</div>
				        <div class="headerMyInfoFont">Project period : 1st May.2023 ~ 7th June.2023</div>
				        <div class="headerMyInfoFont">Creator : 홍유리 (YURI HONG)</div>
				        <div class="headerMyInfoFont">Blog : dbfl720.tistory.com</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-white closeMyInfoFont mr-5 mb-2" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
	
			
			</div>
		</c:if>

		<c:if test="${empty userId}">
			<div class="headerLoginIcon"><a href="/user/sign_up_view" class="asideText"><img id="communityImg" alt="커뮤니티 이미지" width="50" height="50" src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Internet-Smiley-icon.png" >
			Login</a></div>
		</c:if>
	</div>
</div>