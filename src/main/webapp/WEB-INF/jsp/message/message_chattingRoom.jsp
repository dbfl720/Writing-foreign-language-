<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


  <div id="profile">

            <div id="close">
                <div class="cy"></div>
                <div class="cx"></div>
            </div>
            
            <p>Miro Badev</p>
            <span>miro@badev@gmail.com</span>
        </div>
        <div id="chat-messages">
          <label>Thursday 02</label>
            
            <div class="message">
              <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg" />
                <div class="bubble">
                  Really cool stuff!
                    <div class="corner"></div>
                    <span>3 min</span>
                </div>
            </div>
            
            <div class="message right">
              <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/2_copy.jpg" />
                <div class="bubble">
                  Can you share a link for the tutorial?
                    <div class="corner"></div>
                    <span>1 min</span>
                </div>
            </div>
           
            
        </div>
      
        <div id="sendmessage">
          <input type="text" value="Send message..." />
            <button id="send"></button>
        </div>
        
        
        
<script>
$(document).ready(function(){
	  
	  var preloadbg = document.createElement("img");
	  preloadbg.src = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/timeline1.png";
	  
	   $("#searchfield").focus(function(){  // 지우면  검색창 다시 공백으로 안 뀌는 것.
	    if($(this).val() == "Search contacts..."){
	      $(this).val("");
	    }
	  }); 
	  $("#searchfield").focusout(function(){
	    if($(this).val() == ""){
	      $(this).val("Search contacts...");
	      
	    }
	  });
	  
	   $("#sendmessage input").focus(function(){ // 지우면 입력창 공백으로 안 바뀜 
	    if($(this).val() == "Send message..."){
	      $(this).val("");
	    }
	  }); 
	   $("#sendmessage input").focusout(function(){
	    if($(this).val() == ""){
	      $(this).val("Send message...");
	      
	    }
	  }); 
	    
	  
	  $(".friend").each(function(){   
	    $(this).click(function(){
	      var childOffset = $(this).offset(); // .offset()은 선택한 요소의 좌표를 가져오거나 특정 좌표로 이동
	      var parentOffset = $(this).parent().parent().offset();
	      var childTop = childOffset.top - parentOffset.top;
	      var clone = $(this).find('img').eq(0).clone();
	      var top = childTop+12+"px";
	     
	       $(clone).css({'top': top}).addClass("floatingImg").appendTo("#chatbox");  // 프로파일 사진 채팅룸으로 복사.                  
	      
	      setTimeout(function(){$("#profile p").addClass("animate");$("#profile").addClass("animate");}, 100); //유저 이름 복사
	       setTimeout(function(){      // 채팅 메세지 및 x닫기. 
	        $("#chat-messages").addClass("animate");   
	         $('.cx, .cy').addClass('s1');    // 닫기...?
	        setTimeout(function(){$('.cx, .cy').addClass('s2');}, 100);
	        setTimeout(function(){$('.cx, .cy').addClass('s3');}, 200);   
	      }, 150);                           
	      
	       $('.floatingImg').animate({  // 채팅방 프로파일 사진 위로 보내기. 
	        'width': "68px",
	        'left':'108px',
	        'top':'20px'
	      }, 200); 
	      
	      var name = $(this).find("p strong").html();
	      var email = $(this).find("p span").html();                            
	      $("#profile p").html(name);
	      $("#profile span").html(email);     
	      
	       $(".message").not(".right").find("img").attr("src", $(clone).attr("src"));              
	      $('#friendslist').fadeOut();
	      $('#chatview').fadeIn();
	    
	      
	      $('#close').unbind("click").click(function(){       
	         $("#chat-messages, #profile, #profile p").removeClass("animate");
	         $('.cx, .cy').removeClass("s1 s2 s3");
	        $ ('.floatingImg').animate({
	          'width': "40px",
	          'top':top,
	          'left': '12px'
	        }, 200, function(){$('.floatingImg').remove()});        
	        
	         setTimeout(function(){    // 이 코드가 없으면 채팅방에서 x누르지 못하고 친구목록으로 못돌아감. 
	          $('#chatview').fadeOut();
	          $('#friendslist').fadeIn();       
	        }, 50); 
	      });
	      
	    });
	  });     
	});
	    

</script>