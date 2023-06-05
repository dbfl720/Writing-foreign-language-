<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="chatbox">
		    <div class="chat-window">
		    <c:forEach items="${messageViewOutBoxList}" var="card">
		      <div class="msg-container msg-remote" id="msg-0">
		        <div class="msg-box">
		          <img class="user-img" id="user-0" src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Users-Talk-icon.png" />
		          <div class="flr">
		            <div class="messages">
		              <p class="msg outBoxContent" id="msg-0">
		                ${card.messageEntity.content}          
		              </p>
		            </div>
		            <span class="timestamp">
		            <img data-toggle="modal" data-target="#exampleModal" class="profileSendMessage ml-1" alt="쪽지 사진" width="20" height="20"
						src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Paper-Plane-icon.png">	            
		            
		            <span class="messageOutBoxLoginIdText username shadowToTalEffects ml-2">${card.user.loginId}</span>
		        
		            	
		            
		            &bull;<span class="posttime"><fmt:formatDate value="${card.messageEntity.createdAt}" pattern="HH:mm  yyyy-MM-dd" /></span></span>
		          </div>
		        </div>
		      </div>
		      </c:forEach>
		    </div>
		
		  </div>
    
		  
		  
  <script>
  $('.chat-input input').keyup(function(e) {
	  if ($(this).val() == '')
	    $(this).removeAttr('good');
	  else
	    $(this).attr('good', '');
	});
  
  </script>