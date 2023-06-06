<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	
	<div class="container">  
		<div class="d-flex">
				<img alt="글쓴이 이모티콘" width="65" height="65" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Messaging-Read-Message-icon.png">
				<div class="liveTopText ml-4">Message Inbox</div>
				
			
				
				<div class="messageAirplane">
				<a href="/message/message_outbox_view" >
					<img class="shadowToTalEffects messageListSendImg" alt="발신 이모티콘" width="35" height="35" src="https://icons.iconarchive.com/icons/iconsmind/outline/128/Mail-Send-icon.png">
				</a>
				</div>
		</div>
		
		<!-- 유저리스트 -->
		<div class="messageUserList">
	        <div class="UserList_text"> 여기에 마우스를 가져오세요 </div>
	        <div class="UserList_img">
	        	<div class="d-flex justify-content-center">
		 <div class="chatbox shadowToTalEffects">
		    <div class="chat-window">
		    <c:forEach items="${messageViewList}" var="card">
		      <div class="msg-container msg-remote" id="msg-0">
		        <div class="msg-box shadowToTalEffects">
		          <img class="user-img"  id="user-0" src="${card.user.imagePath}" />
		          <div class="flr">
		            <div class="messages d-flex justify-content-between">
		              <p class="msg" id="msg-0">
		                ${card.messageEntity.content}          
		              </p>
		              
		              <%-- 메세 삭제 버튼 --%>
						<div>
						<a href="#" class="messageDeleteBtn" data-toggle="modal" data-target="#modal" data-message-id="${card.messageEntity.id}"> <img
								 class="messageDeleteImg mt-2 ml-2 shadowToTalEffects" width="15" height="15" src="https://icons.iconarchive.com/icons/arturo-wibawa/akar/128/more-vertical-icon.png">
							</a>
						</div>
		            </div>
		            <span class="timestamp"><span class="username font-weight-bold">From. ${card.user.loginId}</span>
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
	  </div>
	 </div><!-- UserList_img -->
       
		</div>
	
	<!-- 수신함 - 메세지 리스트가 있을 때. -->
	<c:if test="${not empty messageViewList}">
	  <div class="d-flex justify-content-center">
		 <div class="chatbox shadowToTalEffects">
		    <div class="chat-window scollwDown">
		    <c:forEach items="${messageViewList}" var="card">
		      <div class="msg-container msg-remote scrollDownEffect" id="msg-0">
		        <div class="msg-box shadowToTalEffects">
		          <img class="user-img"  id="user-0" src="${card.user.imagePath}" />
		          <div class="flr">
		            <div class="messages d-flex justify-content-between">
		              <p class="msg" id="msg-0">
		                ${card.messageEntity.content}          
		              </p>
		              
		              <%-- 메세 삭제 버튼 --%>
						<div>
						<a href="#" class="messageDeleteBtn" data-toggle="modal" data-target="#modal" data-message-id="${card.messageEntity.id}"> <img
								 class="messageDeleteImg mt-2 ml-2 " width="15" height="15" src="https://icons.iconarchive.com/icons/arturo-wibawa/akar/128/more-vertical-icon.png">
							</a>
						</div>
		            </div>
		            <span class="timestamp"><span class="username font-weight-bold">From. ${card.user.loginId}</span>
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
	  </div>
    </c:if>
    
  
 
  <c:if test="${empty messageViewList}">
	  <div class="d-flex justify-content-center">
		 <div class="chatbox shadowToTalEffects">
		    <div class="chat-window">
		      <div class="msg-container msg-remote" id="msg-0">
		        <div class="msg-box shadowToTalEffects">
		          <img class="user-img"  id="user-0" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Ecommerce-Empty-Box-icon.png" />
		          <div class="flr">
		            <div class="messages d-flex justify-content-between">
		              <p class="msg" id="msg-0">
		                There is no message.          
		              </p>
		            </div>
		            <span class="timestamp"><span class="username font-weight-bold">From. </span></span>
		          </div>
		        </div>
		      </div>
		    </div>
		
		  </div>
	  </div>
    </c:if>
  
  


<!-- modal  -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-title" id="exampleModalLabel">New message</div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><img alt="글쓴이 이모티콘" width="25" height="25" src="https://icons.iconarchive.com/icons/github/octicons/128/x-24-icon.png"></span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="modalMessageText col-form-label">Message:</label>
            <textarea class="form-control" id="message-text" ></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="messageCloseBtn btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="profileSendMessage22" type="button" class="profileSendMessage22 btn btn-warning">Send message</button>
      </div>
    </div>
  </div>
</div>







<!-- Modal -->
<div class="modal fade" id="modal" >
	<%-- modal-dialog-centered : 모달 창을 수직 가운데 정렬 --%>
	<%-- modal-sm: small 모달 --%>
  	<div class="modal-dialog modal-dialog-centered modal-sm"> 
    	<div class="modal-content text-center">
      		<div class="py-3 border-bottom"> 
      			<a href="#" id="deletePostBtn" class="deletePostFont text-dark">Delete</a>
   			</div>
   			<div class="py-3">
   				<%-- data-dismiss="modal" => 모달창 닫힘 --%>
   				<a href="#" data-dismiss="modal" class="deletePostFont text-dark">Close</a>
   			</div>
    	</div>
  </div>
</div>


</div>






 <script>

 $('.chat-input input').keyup(function(e) {
	  if ($(this).val() == '')
	    $(this).removeAttr('good');
	  else
	    $(this).attr('good', '');
	});

  

  
$(document).ready(function(){
	  
	// 메세지 보내기
	$('.profileSendMessage').on('click', function(e){
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
					//swal(data.result);
					location.href = "/message/message_outbox_view";
				} else {
					swal(data.errorMessage);
				}
			}
			,error : function(request, status, error) {
				swal("Failed to save information. Please contact the administrator.");
			}
		 	
			
		}); // ajax
		
	}); // profileSendMessage22
	  
	  
	
	
	
	
	
	

	// 메세지 삭제
	$('.messageDeleteBtn').on('click', function(e){
		e.preventDefault();
		
		let messageId = $(this).data('message-id');
		//alert(messageId);
		
		// 모달 태그에 data-live-id 심기
		$('#modal').data('message-id', messageId);
	}); // delete-btn
		
		
	
	
	
	// 모달 안에 있는 delete 버튼
	$('#modal #deletePostBtn').on ('click', function(e) {  // modal 안에 있는 deletePostBtn  띄어쓰기. #modal 안써도 됨.
		e.preventDefault(); 
	
		let messageId = $('#modal').data('message-id');
		//alert(messageId);
	
		// ajax
		$.ajax({
			// request
			type : "DELETE"
			, url : "/message/delete"
			, data : {
				"messageId" : messageId
			}
			
			
			// response
			,success : function(data) {
				if (data.code = 1) {
					location.reload(true);
					swal(data.result);
				} else {
					swal(data.errorMessage);
				}
			},
			error : function(request, status, error) {
				swal("Failed to save information. Please contact the administrator.");
			}
		
			
		});  // ajax
		
	});    //deletePostBtn
	
	  
	
	
	
	
	// 스크롤 항상 아래에 고정. 
	$('.scollwDown').scrollTop($('.scollwDown')[0].scrollHeight);
	
	
  }); // ready
    

</script>