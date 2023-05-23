<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
<div class="container">   
	<div class="display-4 pt-5 pb-5">
		<img alt="글쓴이 이모티콘" width="55" height="55" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png">
	Great Writer!</div>
			 
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide"><a href="#" class="swiperAAA"><img src="/static/img/CN.gif"></a></div>
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
		<div class="swiper-button-next mt-5"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev mt-5"></div><!-- 이전 버튼 -->
	
		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
	
	<div class="pencilIcon">
	<a href="/review/review_writing_view"> <img alt="연필 이모티콘"
		width="55" height="55"
		src="https://icons.iconarchive.com/icons/iconka/business-outline/128/pencil-icon.png">
	</a>
</div><!-- swiper 끝 -->




<div class="article1  d-flex flex-wrap align-items-center justify-content-between">
	<div class="ReviewListbox mt-3">
		<img class="ReveiwImgBox2" src="https://cdn.pixabay.com/photo/2023/04/29/18/12/goslings-7959052_1280.jpg" id="imageUrl" name="iamgeUrl" alt="이미지 " width="280"
			height="150">
		<div class="reviewListTextBox22">
			<h4 ">title</h4>
			<small class="text-secondary" name="price">2000원</small><br>
			<small class="article-text">nickname</small>
		</div>
	</div>		
	
	<div class="ReviewListbox mt-3">
		<img class="ReveiwImgBox2" src="https://cdn.pixabay.com/photo/2023/04/29/18/12/goslings-7959052_1280.jpg" id="imageUrl" name="iamgeUrl" alt="이미지 " width="280"
			height="150">
		<div class="reviewListTextBox22">
			<h4 ">title</h4>
			<small class="text-secondary" name="price">2000원</small><br>
			<small class="article-text">nickname</small>
		</div>
	</div>
	<div class="ReviewListbox mt-3">
		<img class="ReveiwImgBox2" src="https://cdn.pixabay.com/photo/2023/04/29/18/12/goslings-7959052_1280.jpg" id="imageUrl" name="iamgeUrl" alt="이미지 " width="280"
			height="150">
		<div class="reviewListTextBox22">
			<h4 ">title</h4>
			<small class="text-secondary" name="price">2000원</small><br>
			<small class="article-text">nickname</small>
		</div>
	</div>
	<div class="ReviewListbox mt-3">
		<img class="ReveiwImgBox2" src="https://cdn.pixabay.com/photo/2023/04/29/18/12/goslings-7959052_1280.jpg" id="imageUrl" name="iamgeUrl" alt="이미지 " width="280"
			height="150">
		<div class="reviewListTextBox22">
			<h4 ">title</h4>
			<small class="text-secondary" name="price">2000원</small><br>
			<small class="article-text">nickname</small>
		</div>
	</div>		
</div>


</div> <!-- container -->



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