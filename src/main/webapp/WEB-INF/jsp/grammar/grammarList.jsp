<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="d-flex">
	<div>
	<a href="#">
		<img id="startImg" alt="한국 국기" width="170" height="170" src="/static/img/KO.gif">
	</a>
	</div>

	<div>
	<a href="#">
		<img alt="미국 국기" width="170" height="170" src="/static/img/US.gif">
	</a>
	</div>
	
	<div>
	<a href="#">
		<img id="endImg" alt="일본 국기" width="170" height="170" src="/static/img/JP.gif">
	</a>
	</div>
</div>


  <div class="d-flex justify-content-between">
       <a id="prev" href="#">
       		<img alt="글쓴이 이모티콘" width="30" height="30" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Arrows-Back-icon.png">
		</a>
       <a id="next" href="#">
       		<img alt="글쓴이 이모티콘" width="30" height="30" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Arrows-Forward-icon.png">
	   </a>	
  </div>	



<div>
<a href="/grammar/grammar_writing_view">
	<img alt="글쓴이 이모티콘" width="53" height="53" src="https://icons.iconarchive.com/icons/handdrawngoods/busy/128/pencil-icon.png">
</a>
</div>


	<table class="table text-center  GrammarListTable">
		<thead>
			<tr class="GrammarTableFont">
				<th class="GrammarTableFont">
					<img alt="글쓴이 이모티콘" width="36" height="36" src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user2-edit-icon.png">
				</th>
				<th class="GrammarTableFont">
					<img alt="제목 이모티콘" width="36" height="36" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Science-Literature-icon.png">
				</th>
				<th class="GrammarTableFont">
					<img alt="언어 이모티콘" width="36" height="36" src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${grammarList}" var="grammarLists">
				<tr>
					<td class="GrammarTableFont">${grammarLists.user.loginId}</td>
					<td class="GrammarTableFont">
					<a href="/grammar/grammar_detail_view?grammarId=${grammarLists.grammar.id}">
					${grammarLists.grammar.title}
					</a>
					</td>
					<td class="GrammarTableFont">${grammarLists.grammar.languageCategoryId}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	
	


<script>
$(document).ready(function() {
		var imgs = ['/img/booking/house1.jpeg', '/img/booking/house2.jpeg', '/img/booking/house3.jpeg', '/img/booking/house4.jpeg' , '/img/booking/house5.jpeg', '/img/booking/house6.jpeg'];
		var currentIndex = 0;
		
		// 다음 버튼 클릭
		$("#next").on("click", function() {
			currentIndex++;
			if (currentIndex >= imgs.length) {
				currentIndex = 0;
			}
			
			$('#mainImg').attr("src", imgs[currentIndex]);
			
		});
		
		
		// 이전 버튼 클릭
		$("#prev").on("click", function() {
			currentIndex--;
			if (currentIndex < 0) {
				currentIndex = imgs.length -1;
			}
			
			$('#mainImg').attr("src", imgs[currentIndex]);
			
			
		});
		
	});  // ready
	


</script>
