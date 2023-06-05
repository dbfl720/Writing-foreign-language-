<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">

	<div class="d-flex">
				<img alt="글쓴이 이모티콘" width="82" height="82" src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Mail-Send-icon.png">
				<div class="liveTopText ml-4">Message you sent.</div>
				
				<div class="messageAirplane">
				<a href="/message/message_view" >
					<img class="shadowToTalEffects messageListSendImg" alt="발신 이모티콘" width="35" height="35" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Messaging-Read-Message-icon.png">
				</a>
				</div>
		</div>




   <div class="d-flex justify-content-center">
	<div class="chatbox shadowToTalEffects">
		    <div class="chat-window">
		    <c:forEach items="${messageViewOutBoxList}" var="card">
		      <div class="msg-container msg-remote" id="msg-0">
		        <div class="msg-box">
		          <img class="user-img" id="user-0" src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Mail-Send-icon.png" />
		          <div class="flr">
		            <div class="messages">
		              <p class="msg outBoxContent" id="msg-0">
		                ${card.messageEntity.content}          
		              </p>
		            </div>
		            <span class="timestamp">
		            
		            <span class="messageOutBoxLoginIdText username  ml-2">To. ${card.user.loginId}</span>
		        
		            	
		            
		            &bull;<span class="posttime"><fmt:formatDate value="${card.messageEntity.createdAt}" pattern="HH:mm  yyyy-MM-dd" /></span></span>
		          </div>
		        </div>
		      </div>
		      </c:forEach>
		    </div>
		
	</div><!-- chatbox -->
	</div>
</div><!-- container -->    
		  
		  
<script>
  $('.chat-input input').keyup(function(e) {
	  if ($(this).val() == '')
	    $(this).removeAttr('good');
	  else
	    $(this).attr('good', '');
	});

  
  
  
  $(document).ready(function(){
	// 스크롤 항상 아래에 고정. 
		$('.chat-window').scrollTop($('.chat-window')[0].scrollHeight);
	  
  
  }); // ready
</script>