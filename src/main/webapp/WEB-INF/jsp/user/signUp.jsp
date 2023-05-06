<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<div class="container outer_container accounts_container">
			<div class="row h-100">
				<div
					class="col col-sm-12 col-md-12 col-lg-8 m-0 p-0 w-100 h-100 accounts_col">
					<div class="accounts_image w-100 h-100">
						<img
							src="https://img.freepik.com/free-photo/social-media-instagram-digital-marketing-concept-3d-rendering_106244-1717.jpg?t=st=1647414398~exp=1647414998~hmac=2c478ef6affd973ccd71ea4d394d9283db4a0c6c4c686ba0b9f6091c8a56e5a1&w=1480"
							alt="accounts_image" class="img-fluid w-100 h-100" />
					</div>
					<!--accounts_image-->
				</div>
				<!--account_col-->
				<div class="col col-sm-12 col-md-12 col-lg-4 m-0 p-0 accounts_col">
					<div class="accounts_forms signup_form w-100 h-100" id="signup">
						<div class="title mt-4 p-4 w-100">
							<h1>Sign Up</h1>
							<p class="mt-3">Share your writing with people in the world.
							</p>
						</div>
						<%-- 프로필 사진 --%>
				<%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
				<div class="d-flex signUpProfileBox justify-content-center">
					<input type="file" id="file" multiple='multiple' class="d-none"
										accept=".gif, .jpg, .png, .jpeg , .webp">
					<a href="#" id="fileUploadBtn">
					<img   alt="프로필 변경 이모티콘" width="30" height="30"	src="data:image/png;base64,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" >
					</a>
					
					<!-- 프로필 이미지 -->
					<div class=" profileBox">
						<img id="profileImg" class=" profile" alt="프로필 사진"
							src=""
							height="250" width="300">
					</div>
				</div>
						<!--SignUp-->
						<form id="signUpFrom" method="post"  action="/user/sign_up" name="form" class="form w-100 p-4">
							<div class="row">
								<div class="col col-sm-12 col-md-12 col-lg-11 m-0">
									<div class="form-group d-flex">
										<label for="fname">Id</label> <input id="loginId" type="text" name="fname"
											class="form-control signUpInputPadding"  onfocus="labelUp(this)"
											onblur="labelDown(this)" required />
										<button type="button" id="loginIdCheckBtn" class="duplicatedCheck btn btn-secondary  ">duplicate check</button>
									</div>
								</div>
								 <%-- 아이디 체크 결과 --%> <%-- d-none 클래스: display none (보이지 않게) --%>
									<div id="idCheckLength" class="duplicatedText text-danger d-none">Please enter at least 4 characters.</div>
									<div id="idCheckDuplicated" class="duplicatedText text-danger d-none">already Id in use.</div>
									<div id="idCheckOk" class="duplicatedText text-success d-none">It's possible to use.</div>
										
										
								<div class="col col-sm-12 col-md-12 col-lg-12 m-0">
									<div class="form-group">
										<label for="signup_password">Password</label> <i
											class="fa fa-eye-slash " id="eye_icon_signup"></i> <input
											type="password" name="signup_password" class="form-control signUpInputPadding"
											id="signup_password" onfocus="labelUp(this)"
											onblur="labelDown(this)" required />
									</div>
									<div class="form-group">
										<label for="cpass">Confirm Password</label> <input
											type="password" name="confirmPassword" class="form-control signUpInputPadding" id="confirmPassword"
											onfocus="labelUp(this)" onblur="labelDown(this)" required />
									</div>
									<div class="form-group">
										<label for="email">Email</label> <input type="email"
											name="email" class="form-control signUpInputPadding" id="email"
											onfocus="labelUp(this)" onblur="labelDown(this)" required />
									</div>
								</div>


								<!-- select : native language, foreign language -->
								<div class="d-flex">
									<select name="selectNative" id="selectNative">
										<%-- name은 필드명과 같아야 한다. --%>
										<option value="none" selected>native language</option>
										<option value="KO">KO</option>
										<option value="EN">EN</option>
										<option value="JP">JP</option>
										<option value="CHN">CHN</option>
										<option value="FRA">FRA</option>
										<option value="SWE">SWE</option>
										<option value="DEU">DEU</option>
										<option value="VNM">VNM</option>
										<option value="Others">Others</option>
									</select> <select name="selectLanguage" id="selectLanguage">
										<%-- name은 필드명과 같아야 한다. --%>
										<option value="none" selected>foreign language</option>
										<option value="KO">KO</option>
										<option value="EN">EN</option>
										<option value="JP">JP</option>
										<option value="CHN">CHN</option>
										<option value="FRA">FRA</option>
										<option value="SWE">SWE</option>
										<option value="DEU">DEU</option>
										<option value="VNM">VNM</option>
										<option value="Others">Others</option>
									</select>
								</div>

								<div class="col col-sm-12 col-md-12 col-lg-12 m-0">
									<div class="form-group ">
										<label for="lname">Who are you?</label> 
											<textarea id="selfIntroduction" class="signUpWhoBox" rows = "3" cols = "48" name = "selfIntroduction" onfocus="labelUp(this)" onblur="labelDown(this)" required ></textarea>
									</div>
								</div>
							</div>
							
							<div class="  signUpPurposeBox">
								<div class="form-group ">
									<label for="lname">Purpose of writing</label> 
										<textarea id="languageGoals" class="signUpPurposeBox" rows = "3" cols = "48" name = "languageGoals" onfocus="labelUp(this)" onblur="labelDown(this)" required ></textarea>
								</div>
							</div>
								 
							
							<!--form-row-->
							<div class="form-group">
								<button id="signUpBtn" name="signUpBtn" type="button" class="btn btn-primary register_btn w-100">Sign
									Up</button>
							</div>
						</form>

						<div class="already_member_box">
							<p class="text-center" id="to_login">I am already member</p>
						</div>
					</div>
					
					
					
					
					<!--signIn-->
					<div class="accounts_forms  w-100 h-100" id="login">
						<div class="title  mt-4 p-4 w-100">
							<h1>Sign In</h1>
							<p class="mt-3">Share your writing with people in the world.
							</p>
						</div>
						<!--title-->
						<form method="post" name="form" class="form  w-100 p-4" id="form">
							<div class="form-group">
								<label for="fname">Id</label> <input type="text" name="fname"
									class="form-control signUpInputPadding" id="fname" onfocus="labelUp(this)"
									onblur="labelDown(this)" required />
							</div>
							<div class="form-group">
								<label for="login_password">Password</label> <i
									class="fa fa-eye-slash" id="eye_icon_login"></i> <input
									type="password" name="pass" class="form-control signUpInputPadding"
									id="login_password" onfocus="labelUp(this)"
									onblur="labelDown(this)" required />
							</div>

	

							
							
							
							
							
							<div class="form-group mb-0">
								<button type="button" class="btn btn-primary register_btn w-100">Sign
									In</button>
							</div>
						</form>

						<div
							class="already_member_box d-flex justify-content-between px-4">
							<span class="text-center" id="to_signup">Create an
								account?</span> <span class="text-center">Forgot password</span>
						</div>
					</div>
					<!--accounts_forms-->
				</div>
				<!--account_col-->
			</div>
			<!--row-->
		</div>
	
	







<script>
	
	// Chnage Label Position

	// call when focus on input
	function labelUp(input){
	    input.parentElement.children[0].setAttribute("class", "change_label");    
	}  

	// call when focus out on input
	function labelDown(input){
	    if(input.value.length === 0){
	        input.parentElement.children[0].classList.remove("change_label");
	    }
	        
	} 

	// show & hide password
	var eye_icon_signup = document.getElementById('eye_icon_signup');
	var eye_icon_login = document.getElementById('eye_icon_login');
	var sign_up_password = document.getElementById("signup_password");
	var login_password = document.getElementById("login_password");
	eye_icon_signup.addEventListener('click', ()=>{
	    hideAndShowPass(eye_icon_signup, signup_password); 
	});
	eye_icon_login.addEventListener('click', ()=>{
	    hideAndShowPass(eye_icon_login, login_password);  
	});

	const hideAndShowPass = (eye_icon, password) => {
	    if(eye_icon.classList.contains("fa-eye-slash")){
	        eye_icon.classList.remove('fa-eye-slash');
	        eye_icon.classList.add('fa-eye');
	        password.setAttribute('type', 'text');
	        
	    }
	    else{
	        eye_icon.classList.remove('fa-eye');
	        eye_icon.classList.add('fa-eye-slash');
	        password.setAttribute('type', 'password');
	    }
	};


	// Sign Up & Sign In Toggle
	let to_signup = document.getElementById('to_signup');
	let to_login = document.getElementById('to_login');
	to_signup.addEventListener('click', function(){
	   let_change();
	});
	to_login.addEventListener('click', function(){
	    let_change();
	 });
	const let_change = () => {
	    let login = document.getElementById('login');
	    login.classList.toggle('login_form');
	    let signup = document.getElementById('signup');
	    signup.classList.toggle('signup_form');
	}
	
	
	
	
	
	
 $(document).ready(function() {
	// 중복 확인
	$('#loginIdCheckBtn').on('click', function(){
		// validation
		let loginId = $('#loginId').val().trim();
		
		// 4자 미만이면 경고 문구 노출
		if (loginId.length < 4) {
			$('#idCheckLength').removeClass('d-none');  // 경고문고 노출
			$('#idCheckDuplicated').addClass('d-none'); // 숨김
			$('#idCheckOk').addClass('d-none');// 숨김
			return;
		}
		
		
		
		
		// 화면을 이동시키지 않고 ajax 통신으로 중복여부 확인하고 동적으로 문구 노출
		// AJAX 통신 - 중복확인
		$.ajax({
			// request
			url:"/user/is_duplicated_id"
			, data:{"loginId":loginId}
			
			// response
			, success:function(data) {
				if(data.result) {
					//중복
					$("#idCheckDuplicated").removeClass("d-none");
					$('#idCheckLength').addClass("d-none");   // 숨김
					$('#idCheckOk').addClass("d-none");   // 숨김
				} else {
					// 사용 가능
					$("#idCheckOk").removeClass("d-none");
					$('#idCheckLength').addClass('d-none'); // 경고문구 노출
					$('#idCheckDuplicated').addClass("d-none");   // 숨김
				}
			}
			
			,error: function(error) {
				alert("아이디 중복확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
			
		}); // AJAX
		
	}); // 중복 확인
	
	
	
	
	
	
	
	// 파일 업로드 이미지 클릭 => 숨겨져 있는 file 태그를 동작 시킨다.
	$('#fileUploadBtn').on('click', function(e) {
		e.preventDefault();
		$('#file').click();
	});
	
	
	//  사용자가 이미지를 선택했을 때 유효성 확인
	$("#file").on('change', function(e){  // e가 파일객체들고 있음.
		let fileName = e.target.files[0].name;
		console.log(fileName);
		
		// 확장자 유효성 확인
		let ext = fileName.split(".").pop().toLowerCase();
		if (ext != "jpg" && ext != "png" && ext != "jpeg" && ext != "gif" && ext != "webp") {
			alert("You can only upload image files.");
			return;
		}
		
	}); // #file
	
	
	
	

	
	
	// 회원가입
	 $('#signUpBtn').on('click', function() {
		//e.prevenDefault(e);
		
		// validation
		let file = $('#file').val();   // 이미지 경로
		let loginId = $('#loginId').val().trim();
		let signup_password = $('#signup_password').val();
		let confirmPassword = $('#confirmPassword').val();
		let email =  $('#email').val().trim();
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var selectNative = document.getElementById('selectNative');
		var selectNativeIndex = document.getElementById('selectNative').options.selectedIndex;		
		var selectLanguage = document.getElementById('selectLanguage');
		var selectLanguageIndex = document.getElementById('selectLanguage').options.selectedIndex;
		
		var selectNativeValue = selectNative.options[selectNativeIndex].value;
		var selectLanguageValue = selectLanguage.options[selectLanguageIndex].value;
		
		let selfIntroduction = $('#selfIntroduction').val();
		let languageGoals = $('#languageGoals').val();
		
		
		//alert(selectNativeValue);
		//alert(selectLanguage.value);
		
		
		
		
		
		if (file == '') {
			alert("Please upload the file.");
			return;
		}
		
		
		
		// 파일이 업로드 된 경우에만 확장자 체크 
		let ext = file.split(".").pop().toLowerCase();
		
		// 확장자만 뽑아서 소문자로 변경한다.
		if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif', 'webp']) == -1) {  //배열에 값이있으면 return 해당 index return 값이 없으면 -1
			alert("You can only upload image files.");
			$('#file').val('');     // 파일을 비운다.
			return;
		}
		
		
		
		
		if (!loginId) {
			alert("아이디를 입력하세요.");
			return false;
		}
		
		
		if (!signup_password) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if (reg.test(signup_password) == false) {
			alert("비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문를 모두 포함해야 합니다.");
			return false;
		} else {
			console.log("통과");
		}
		
		
		
		if (signup_password != confirmPassword) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		
		if(email) {
		    var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		    if (!regEmail.test(email)) {
		        alert('이메일 형식에 맞춰주세요.');
		        return false;
		    }
		}
		
		
		if(!email) {    // 이메일 형식에 맞는지 정규식 확인하는거 필요! 
			alert("이메일을 입력하세요.");
			return false;
		}
		
		
		
		
		
		// select 선택 했는지 확인 
		if (selectNativeValue == 'none') {
			alert("Please select one native language.");
			return;
		}
		
		
		
		// select 선택 했는지 확인 
		if (selectLanguageValue == 'none') {
			alert("Please select one foreign language.");
			return;
		}
		
		

		
		if (selfIntroduction.length < 10) {
			alert("Please write at least 10 characters.");
			return;
		}
		
		if (languageGoals.length < 10) {
			alert("Please write at least 10 characters.");
			return;
		}
		

		// 아이디 중복확인 완료 됐는지 확인 - idCheckOk d-none이 있으면 alert 띄우기 
		if ($("#idCheckOk").hasClass("d-none")) {
			alert("아이디 중복확인을 다시 해주세요.");
			return false;
		}
		
		
		
		
		
		
		
		// form태그를 자바스크에서 만든다.
		let formData = new FormData();
		formData.append("file", $('#file')[0].files[0]);
		formData.append("loginId",loginId);
		formData.append("signup_password",signup_password);
		formData.append("email",email);
		formData.append("selectNativeValue",selectNativeValue);
		formData.append("selectLanguageValue",selectLanguageValue);
		formData.append("selfIntroduction",selfIntroduction);
		formData.append("languageGoals",languageGoals);
	
		
		
		
		// AJAX 전송
		$.ajax({
			// request
			type: "post"
			, url: "/user/sign_up"
			, data : formData
			, enctype : "multipart/form-data" // 파일 업로드를 위한 필수 설정.
			, processData : false // 파일 업로드를 위한 필수 설정.
			, contentType : false // 파일 업로드를 위한 필수 설정.
			
			// response
			, success : function(data) {
				if (data.code == 1) {
					alert("Your post has been saved.");
					location.reload();
				} else {
					alert(data.errorMessage);
				}
				
			}
			, error : function(request, status, error) {
				alert("Failed to save information. Please contact the administrator.");
			}
			
			
			
			
		});    // ajax
		
	});   // 회원가입
	
	
}); // ready 
	

</script>