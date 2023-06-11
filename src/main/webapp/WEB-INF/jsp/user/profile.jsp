<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<%-- 프로필 사진 --%>
	<%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
	<input type="file" id="file" multiple='multiple' class="d-none"
						accept=".gif, .jpg, .png, .jpeg , .webp">
	<div class="profileTotal55 container">
	
	<!-- Top 제목부분   -->
		<div class="grammarDetailTopText pt-5 pb-5 TopLogoEffects">
		<img alt="글쓴이 이모티콘" width="60" height="60" src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Profile-icon.png">
			Profile</div>
			
			
		<div class="d-flex profileTotalBox4444">
			<div class="profileTotalBox">
				<%-- 수정 아이콘 --%>
				<c:if test="${user.id eq userId}">
				<a href="#" id="updateProfileBtn">
				<img class="updateProfileIcon shadowToTalEffects" alt="업데이트 이모티콘" width="25" height="25" src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Programming-Save-icon.png">
				</a>
				</c:if>
				<div class="reviewBox mr-3">
					<img id="profileImg" class=" " alt="프로필 사진"
						src="${user.ImagePath}"
						height="250" width=250">
				</div>
				<c:if test="${user.id eq userId}">
					<a href="#" id="profileBtn">
					<img class="shadowToTalEffects" alt="프로필 변경 이모티콘" width="25" height="25"	src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Photo-icon.png" >
					</a>
				
					<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
					<div id="fileName" class="text-secondary ml-2 mt-2"></div>
				</c:if>	
					
			</div>
			
			
			

				
					<%-- 유저 정보들 --%>	
				<c:if test="${user.id eq userId}">
				<div class="LiveDetailTextBox effect5 text-center">
					<div class="profileLoginIdText d-flex justify-content-center">
					<img alt="유저 사진" width="27" height="27"
						src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user-2-icon.png">		
					<div class="profileLoginId">${user.loginId}</div>
					</div>
					<div class="profileTotalText d-flex justify-content-center">
						<img class="text-center" alt="언어 사진" width="27" height="27"
							src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">					
						<div class="profileNativeText">${user.nativeCategoryId}</div>
							<img class="profileArrowImg" alt="화살표" height="16" width="16" src="https://icons.iconarchive.com/icons/bootstrap/bootstrap/128/Bootstrap-arrow-left-right-icon.png">
						<div class="profileForeignText">${user.foreignCategoryId}</div>
					</div>
					<div class="profileTotalText"><img alt="좋아요 하트" height="27" width="27" src="https://icons.iconarchive.com/icons/pixelkit/swanky-outlines/128/05-Bookmark-Book-icon.png">
						${grammarLikeCount} Hearts
					</div>	
					<div class="profileTotalText"><img alt="리뷰 하트" height="27" width="27" src="https://icons.iconarchive.com/icons/praveen/minimal-outline/128/microphone-icon.png">
						 ${liveLikeCount} Hearts
					</div>	
					<div class="profileTotalText"><img alt="리뷰 하트" height="27" width="27" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png">
						${reviewLikeCount} Total Review
					</div>	
				</div>
				</c:if>
				
				
				
				<c:if test="${user.id ne userId}"> 
					<div class="LiveDetailTextBox effect5 text-center">
					<div class="profileLoginIdText d-flex justify-content-center">
					<img class="mt-3" alt="유저 사진" width="27" height="27"
						src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user-2-icon.png">		
					<div class="profileLoginId mt-3">${user.loginId}</div>
					<!--쪽지 보내기 -->
					<a href="#"><img data-toggle="modal" data-target="#exampleModal" data-receiver-id="${user.id}" class="profileSendMessages ml-4  simpleEffectILike" alt="쪽지 사진" width="38" height="36"
						src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Paper-Plane-icon.png"></a>
					</div> 
					
					<div class="profileTotalText d-flex justify-content-center">
						<img class="text-center" alt="언어 사진" width="27" height="27"
							src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">					
						<div class="profileNativeText">${user.nativeCategoryId}</div>
							<img class="profileArrowImg" alt="화살표" height="16" width="16" src="https://icons.iconarchive.com/icons/bootstrap/bootstrap/128/Bootstrap-arrow-left-right-icon.png">
						<div class="profileForeignText">${user.foreignCategoryId}</div>
					</div>
					<div class="profileTotalText"><img alt="좋아요 하트" height="27" width="27" src="https://icons.iconarchive.com/icons/pixelkit/swanky-outlines/128/05-Bookmark-Book-icon.png">
						${grammarLikeCount} Hearts
					</div>	
					<div class="profileTotalText"><img alt="리뷰 하트" height="27" width="27" src="https://icons.iconarchive.com/icons/praveen/minimal-outline/128/microphone-icon.png">
						 ${liveLikeCount} Hearts
					</div>	
					<div class="profileTotalText"><img alt="리뷰 하트" height="27" width="27" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png">
						${reviewLikeCount} Total Review
					</div>	
				</div>
				</c:if>
				
			</div> <%-- d-flex 끝. --%>
			
			
					<%-- 자기소개 --%>
					<div class="totalSecondMyBox">
						<div class="d-flex">
							<div class="selfTitle text-secondary"><img alt="리뷰 하트" height="27" width="27" src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user-info-icon.png">
							Who are you?</div>
							
							<!--더보기  -->
							<div class="profileMoreBtn11">
							 <a href="#" class="profileBtn11 ReviewMoreIcon"  data-user-id="${user.id}"> 
								<img class="shadowToTalEffects" src="https://icons.iconarchive.com/icons/amitjakhu/drip/128/dots-3-icon.png" width="23"> 
							 </a>	
							</div>
						</div>	
							<div class="secondMyBox">
								<div id="selfIntroduction" class="profileSelfIntrText567 shadowToTalEffects" >
								${user.selfIntroduction}</div>
							</div>
					</div>
					
					
					
					<div class="totalSecondMyBox22">
						<div class="d-flex">
							<div class="selfTitle22 text-secondary"><img alt="리뷰 하트" height="27" width="27" src="https://icons.iconarchive.com/icons/github/octicons/128/goal-24-icon.png">
							The purpose of writing</div>
							
						<!--더보기  -->
							<div class="profileMoreBtn22">
							 <a href="#" class="profileBtn22 ReviewMoreIcon"  data-user-id="${user.id}"> 
								<img class="shadowToTalEffects" src="https://icons.iconarchive.com/icons/amitjakhu/drip/128/dots-3-icon.png" width="23"> 
							 </a>	
							</div>
						</div>	
						
							<div class="secondMyBox22">
								<div id="languageGoals" class="profileTextArea shadowToTalEffects">
								${user.languageGoals}</div>
							</div>
					</div>
					
			
	</div>





<!-- modal  -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><img alt="글쓴이 이모티콘" width="25" height="25" src="https://icons.iconarchive.com/icons/github/octicons/128/x-24-icon.png"></span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="modalMessageText col-form-label">content</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="messageCloseBtn btn btn-white" data-dismiss="modal">Close</button>
        <button id="profileSendMessage22" type="button" class="profileSendMessage22 btn btn-white">Send message</button>
      </div>
    </div>
  </div>
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
					swal("You can only upload image files.");
					$("#file").val(""); // 파일 태그에 파일 제거
					$("#fileName").text(""); // 파일 이름 비우기
					return;
				}
		
				// 유효성 통과한 이미지는 상자에 업로드 된 파일 이름 노출
				$("#fileName").text(fileName); // 태그 사이에 글자를 넣는 함수 : text()  
			}); // file
			
			
			
			
			
			
			// 프로필 수정
			$("#updateProfileBtn").on('click', function() {
				// validation
				let file = $('#file').val();
			/* 	let selfIntroduction = $('#selfIntroduction').val();
				let languageGoals = $('#languageGoals').val(); */
				
				
				 if (file == '') {
					swal("Please upload the file.");
					return;
				} 
				
				
				
				// 파일이 업로드 된 경우에만 확장자 체크 
				let ext = file.split(".").pop().toLowerCase();
				
				// 확장자만 뽑아서 소문자로 변경한다.
				if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif', 'webp']) == -1) {  //배열에 값이있으면 return 해당 index return 값이 없으면 -1
					swal("You can only upload image files.");
					$('#file').val('');     // 파일을 비운다.
					return;
				}
				
				
				
			/* 	if (selfIntroduction.length < 10) {
					swal("Please write at least 10 characters.");
					return;
				}
				
				if (languageGoals.length < 10) {
					swal("Please write at least 10 characters.");
					return;
				} */
				
				
				
				// form 태그를 자바스크립트에서 만들기.
				let formData = new FormData();
				formData.append("file", $('#file')[0].files[0]);
				
				
				// AJAX 전송
				$.ajax({
					// request
					type: "PUT"
					, url : "/user/update"
					, data : formData
					, encType : "multipart/form-data" // 파일 업로드를 위한 필수 설정
					, processData : false // 파일 업로드를 위한 필수 설정//json으로 가는거 방지. 
					, contentType : false // 파일 업로드를 위한 필수 설정
					
					
					// response
					, success: function(data) {  // jquery ajax 함수가 json string을 object로 파싱해줌
						if (data.code == 1) {
							location.reload();
						} else {
							swal(data.errorMessage);
						}
					}
					, error : function(request, status, error) {
						swal("Failed to save information. Please contact the administrator.");
					}
						
					
				});    // ajax
				
				
			}); // 프로필 수정
			

			
			
			
			// 더보기
			$('.profileBtn11').on('click', function(e){
				e.preventDefault();
				
				let userId = $(this).data("user-id");
				//alert(userId);
				
				$.ajax({
					type : "GET"
					, url : "/user/getIntro"
					, data : {"userId" : userId}
					, success : function(data) {
						if (data.join == "There are no profile written.") {
							swal("Please log in.");
						} else {		
							swal("Who are you ? : " + data.user.selfIntroduction);
							
						}
					}
					,error : function(request, status, error) {
						swal("Failed to save information. Please contact the administrator.");
					}
					
					
					
				}); // ajax
			}); // profileBtn11	
				
				
				
			// 더보기 2
			$('.profileBtn22').on('click', function(e){
				e.preventDefault();
				
				let userId = $(this).data("user-id");
				//alert(userId);
				
				$.ajax({
					type : "GET"
					, url : "/user/getGoals"
					, data : {"userId" : userId}
					, success : function(data) {
						if (data.join == "There are no profile written.") {
							swal("Please log in.");
						} else {		
							swal("The purpose of writing : " + data.user.languageGoals);
							
						}
					}
					,error : function(request, status, error) {
						swal("Failed to save information. Please contact the administrator.");
					}
					
	
				}); // ajax
			}); // profileBtn11
			
			
			
			
			
			
			
			// 메세지 보내기
			$('.profileSendMessages').on('click', function(e){
				e.preventDefault();
				
				let receiverId = $(this).data("receiver-id");
				//alert(receiverId);
				
				// 모달 태그에 data-live-id 심기
				$('#exampleModal').data('receiver-id', receiverId);
				
			});  // profileSendMessage
			
			
			
			
			
			
			// modal 안에 있는 메세지 보내기 버튼
			$('#exampleModal #profileSendMessage22').on('click', function(e){
				e.preventDefault();
				
				let receiverId = $('#exampleModal').data("receiver-id");
				//alert(receiverId);
				
				let content = $('#message-text').val();
				//alert(content);
				
				
				// validation
				if (!content) {
					swal("Please enter your content.");
					return;
				}
				
				
				
				if (content.length < 10) {
					swal("Please write at least 10 characters.");
					return;
				}
				
				
				$.ajax({
					// request
					type : "POST"
					, url : "/message/create"
					, data : {"receiverId" : receiverId,
							  "content" : content}
				
					
				 	// response
				 	, success : function(data) {
				 		if (data.code == 1) {
							swal(data.result);
						
						} else {
							swal(data.errorMessage);
						}
					}
					,error : function(request, status, error) {
						swal("Failed to save information. Please contact the administrator.");
					}
				 	
					
				}); // ajax
				
			}); // profileSendMessage22
			
});// ready

</script>