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
		          <img class="user-img" id="user-0" src="${card.user.imagePath}" />
		          <div class="flr">
		            <div class="messages">
		              <p class="msg" id="msg-0">
		                ${card.messageEntity.content}          
		              </p>
		            </div>	            
		            <span class="timestamp"><span class="username">${card.user.loginId}</span>       
		            	<!--쪽지 보내기 -->
					<a href="#"><img data-toggle="modal" data-target="#exampleModal" data-receiver-id="${card.user.id}" class="profileSendMessage ml-1  shadowToTalEffects" alt="쪽지 사진" width="25" height="25"
						src="https://icons.iconarchive.com/icons/webalys/kameleon.pics/128/Paper-Plane-icon.png"></a>
		            
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