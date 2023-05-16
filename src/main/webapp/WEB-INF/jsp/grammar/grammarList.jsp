<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><a href="#"><img src="/static/img/CN.gif"></a></div>
		<div class="swiper-slide"><a href="#"><img src="/static/img/DE.gif"></a></div>
		<div class="swiper-slide"><a href="#"><img src="/static/img/ES.gif"></a></div>
		<div class="swiper-slide"><a href="#"><img src="/static/img/FR.gif"></a></div>
		<div class="swiper-slide"><a href="#"><img src="/static/img/JP.gif"></a></div>
		<div class="swiper-slide"><a href="#"><img src="/static/img/KO.gif"></a></div>
		<div class="swiper-slide"><a href="#"><img src="/static/img/OTHERS.gif"></a></div>
		<div class="swiper-slide"><a href="#"><img src="/static/img/US.gif"></a></div>
		<div class="swiper-slide"><a href="#"><img src="/static/img/VN.gif"></a></div>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>










<!-- <div class="d-flex">
	<div class="item-wrapper d-flex">
		<div class="item">
		<a href="#">
			<img id="startImg" alt="한국 국기" width="170" height="170" src="/static/img/KO.gif">
		</a>
		</div>
	
		<div class="item">
		<a href="#">
			<img alt="미국 국기" width="170" height="170" src="/static/img/US.gif">
		</a>
		</div>
		
		<div class="item">
		<a href="#">
			<img id="endImg" alt="일본 국기" width="170" height="170" src="/static/img/JP.gif">
		</a>
		</div>
		
		<div class="item">
		<a href="#">
			<img id="endImg" alt="중국 국기" width="170" height="170" src="/static/img/CN.gif">
		</a>
		</div>
	</div>	
		
</div>


  <div class="d-flex justify-content-between">
   <div class="slider-btn-wrapper slider-btn-wrapper-left">
       <a id="left-btn" href="#">
       		<img alt="글쓴이 이모티콘" width="30" height="30" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Arrows-Back-icon.png">
		</a>
	</div>	

    
	<div class="slider-btn-wrapper slider-btn-wrapper-right">
       <a id="right-btn" href="#">
       		<img alt="글쓴이 이모티콘" width="30" height="30" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Arrows-Forward-icon.png">
	   </a>	
	</div>    	
  </div>	
 -->


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
new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

</script>
