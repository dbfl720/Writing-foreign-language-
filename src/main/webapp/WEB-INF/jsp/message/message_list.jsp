<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



  <div class="chatbox">
    <div class="chat-window">
      <div class="msg-container msg-remote" id="msg-0">
        <div class="msg-box">
          <img class="user-img" id="user-0" src="//gravatar.com/avatar/00034587632094500000000000000000?d=retro" />
          <div class="flr">
            <div class="messages">
              <p class="msg" id="msg-0">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent varius, neque non tristique tincidunt, mauris nunc efficitur erat, elementum semper justo odio id nisi.
              </p>
            </div>
            <span class="timestamp"><span class="username">Name</span>&bull;<span class="posttime">3 minutes ago</span></span>
          </div>
        </div>
      </div>
      <article class="msg-container msg-self" id="msg-0">
        <div class="msg-box">
          <div class="flr">
            <div class="messages">
              <p class="msg" id="msg-1">
                Lorem ipsum dolor sit amet
              </p>
              <p class="msg" id="msg-2">
                Praesent varius
              </p>
            </div>
            <span class="timestamp"><span class="username">Name</span>&bull;<span class="posttime">2 minutes ago</span></span>
          </div>
          <img class="user-img" id="user-0" src="//gravatar.com/avatar/56234674574535734573000000000001?d=retro" />
        </div>
      </article>
      <article class="msg-container msg-remote" id="msg-0">
        <div class="msg-box">
          <img class="user-img" id="user-0" src="//gravatar.com/avatar/002464562345234523523568978962?d=retro" />
          <div class="flr">
            <div class="messages">
              <p class="msg" id="msg-0">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              </p>
            </div>
            <span class="timestamp"><span class="username">Name</span>&bull;<span class="posttime">1 minute ago</span></span>
          </div>
        </div>
      </article>
      <article class="msg-container msg-remote" id="msg-0">
        <div class="msg-box">
          <img class="user-img" id="user-0" src="//gravatar.com/avatar/00034587632094500000000000000000?d=retro" />
          <div class="flr">
            <div class="messages">
              <p class="msg" id="msg-0">
                Lorem ipsum dolor sit amet.
              </p>
            </div>
            <span class="timestamp"><span class="username">Name</span>&bull;<span class="posttime">Now</span></span>
          </div>
        </div>
      </article>
      <div class="msg-container msg-self" id="msg-0">
        <div class="msg-box">
          <div class="flr">
            <div class="messages">
              <p class="msg" id="msg-1">
                Lorem ipsum
              </p>
            </div>
            <span class="timestamp"><span class="username">Name</span>&bull;<span class="posttime">Now</span></span>
          </div>
          <img class="user-img" id="user-0" src="//gravatar.com/avatar/56234674574535734573000000000001?d=retro" />
        </div>
      </div>
    </div>
    <form class="chat-input" onsubmit="return false;">
      <input type="text" autocomplete="on" placeholder="Type a message" />
      <button>
                    <svg style="width:24px;height:24px" viewBox="0 0 24 24"><path fill="rgba(0,0,0,.38)" d="M17,12L12,17V14H8V10H12V7L17,12M21,16.5C21,16.88 20.79,17.21 20.47,17.38L12.57,21.82C12.41,21.94 12.21,22 12,22C11.79,22 11.59,21.94 11.43,21.82L3.53,17.38C3.21,17.21 3,16.88 3,16.5V7.5C3,7.12 3.21,6.79 3.53,6.62L11.43,2.18C11.59,2.06 11.79,2 12,2C12.21,2 12.41,2.06 12.57,2.18L20.47,6.62C20.79,6.79 21,7.12 21,7.5V16.5M12,4.15L5,8.09V15.91L12,19.85L19,15.91V8.09L12,4.15Z" /></svg>
                </button>
    </form>
  </div>
    
    
  
    
    

 <script>
 $('.chat-input input').keyup(function(e) {
	  if ($(this).val() == '')
	    $(this).removeAttr('good');
	  else
	    $(this).attr('good', '');
	});

  
  
/*   // 메시지 보내기
  $('#send').on('click', function(){
	  let content = $('#messageContent').val();
	  
	  
	  
	  
  }); // send */
  
  
  
}); // ready
    
    
    
    
    

    
    
  
    	

</script>