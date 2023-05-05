<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="section">
	  <section class="login_section">
    <div class="container outer_container accounts_container">
      <div class="row h-100">
        <div class="col col-sm-12 col-md-12 col-lg-8 m-0 p-0 w-100 h-100 accounts_col">
          <div class="accounts_image w-100 h-100">
            <img src="https://img.freepik.com/free-photo/social-media-instagram-digital-marketing-concept-3d-rendering_106244-1717.jpg?t=st=1647414398~exp=1647414998~hmac=2c478ef6affd973ccd71ea4d394d9283db4a0c6c4c686ba0b9f6091c8a56e5a1&w=1480" alt="accounts_image" class="img-fluid w-100 h-100" />
          </div>
          <!--accounts_image-->
        </div>
        <!--account_col-->
        <div class="col col-sm-12 col-md-12 col-lg-4 m-0 p-0 accounts_col">
          <div class="accounts_forms signup_form w-100 h-100" id="signup">
            <div class="title mt-4 p-4 w-100">
              <h1>Sign Up</h1>
              <p class="mt-3">Share your writing with people in the world. </p>
            </div>
            <!--title-->
            <form method="post" name="form" class="form w-100 p-4" id="form">
              <div class="row">
                <div class="col col-sm-12 col-md-12 col-lg-12 m-0">
                  <div class="form-group">
                    <label for="fname">Id</label>
                    <input type="text" name="fname" class="form-control" id="fname" onfocus="labelUp(this)" onblur="labelDown(this)" required />
                  </div>
                  <div class="form-group">
                <label for="signup_password">Password</label>
                <i class="fa fa-eye-slash" id="eye_icon_signup"></i>
                <input type="password" name="pass" class="form-control" id="signup_password" onfocus="labelUp(this)" onblur="labelDown(this)" required />
              </div>
              <div class="form-group">
                <label for="cpass">Confirm Password</label>
                <input type="password" name="cpass" class="form-control" id="cpass" onfocus="labelUp(this)" onblur="labelDown(this)" required />
              </div>
                  </div>
                  
                  <!-- select : native language, foreign language -->
                  <div class="d-flex">
	                  <select name="selectNative" id="selectNative"  > <%-- name은 필드명과 같아야 한다. --%>
							<option value="none" selected>native language</option>
							<option  value="KO" >KO</option>			
							<option  value="EN">EN</option>			
							<option  value="JP">JP</option>			
							<option  value="CHN">CHN</option>					
							<option  value="FRA">FRA</option>					
							<option  value="SWE">SWE</option>					
							<option  value="DEU">DEU</option>					
							<option  value="VNM">VNM</option>					
							<option  value="Others">Others</option>					
					 </select> 
					 
					 <select name="selectLanguage" id="selectLanguage" > <%-- name은 필드명과 같아야 한다. --%>
							<option value="none" selected>foreign language</option>
							<option  value="KO" >KO</option>			
							<option  value="EN">EN</option>			
							<option  value="JP">JP</option>			
							<option  value="CHN">CHN</option>					
							<option  value="FRA">FRA</option>					
							<option  value="SWE">SWE</option>					
							<option  value="DEU">DEU</option>					
							<option  value="VNM">VNM</option>					
							<option  value="Others">Others</option>					
					 </select> 
                  </div>
                
                <div class="col col-sm-12 col-md-12 col-lg-6 m-0">
                  <div class="form-group">
                    <label for="lname">Lastname</label>
                    <input type="text" name="lname" class="form-control" id="lname" onfocus="labelUp(this)" onblur="labelDown(this)" required />
                  </div>
                </div>
              </div>
              <!--form-row-->
              
              
              <div class="form-group">
                <button type="submit" class="btn btn-primary register_btn w-100">Sign Up</button>
              </div>
            </form>

            <div class="already_member_box">
              <p class="text-center" id="to_login">I am already member</p>
            </div>
          </div>
          <!--accounts_forms-->
          <div class="accounts_forms  w-100 h-100" id="login">
            <div class="title  mt-4 p-4 w-100">
              <h1>Sign In</h1>
              <p class="mt-3">Share your writing with people in the world. </p>
            </div>
            <!--title-->
            <form method="post" name="form" class="form  w-100 p-4" id="form">
              <div class="form-group">
                <label for="email">ID</label>
                <input type="email" name="email" class="form-control" id="email" onfocus="labelUp(this)" onblur="labelDown(this)" required />
              </div>
              <div class="form-group">
                <label for="login_password">Password</label>
                <i class="fa fa-eye-slash" id="eye_icon_login"></i>
                <input type="password" name="pass" class="form-control" id="login_password" onfocus="labelUp(this)" onblur="labelDown(this)" required />
              </div>
              <div class="form-group mb-0">
                <button type="submit" class="btn btn-primary register_btn w-100">Sign In</button>
              </div>
            </form>

            <div class="already_member_box d-flex justify-content-between px-4">
              <span class="text-center" id="to_signup">Create an account?</span>
              <span class="text-center">Forgot password</span>
            </div>
          </div>
          <!--accounts_forms-->
        </div>
        <!--account_col-->
      </div>
      <!--row-->
    </div>
    <!--accounts_container-->
  </section>

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
	

</script>