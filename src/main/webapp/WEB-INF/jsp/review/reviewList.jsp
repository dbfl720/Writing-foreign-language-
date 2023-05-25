<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
<div class="container">  
	<div class="d-flex justify-content-between"> 
		<div class="display-4 pt-5 pb-5 reviewTopText d-flex">
			<img alt="글쓴이 이모티콘" width="55" height="55" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png">
		<div class="reviewTopGreatText display-4">Great Writer!</div>
		</div>
		
		<div class="d-flex justify-content-end reviewTopSelectBox selectBox">
				<select onchange="if(this.value) location.href=(this.value);" name="id" id= ReviewlanguageId class="select form-select form-select-sm form-control col-2 standardHeight">
						<option value="none" selected>language</option>
						<option value="/review/review_list_view?languageCategoryId=KO">KO</option>
						<option value="/review/review_list_view?languageCategoryId=EN">EN</option>
						<option value="/review/review_list_view?languageCategoryId=JP">JP</option>
						<option value="/review/review_list_view?languageCategoryId=CHN">CHN</option>
						<option value="/review/review_list_view?languageCategoryId=FRA">FRA</option>
						<option value="/review/review_list_view?languageCategoryId=SWE">SWE</option>
						<option value="/review/review_list_view?languageCategoryId=DEU">DEU</option>
						<option value="/review/review_list_view?languageCategoryId=VNM">VNM</option>
						<option value="/review/review_list_view?languageCategoryId=Others">Others</option>
				</select>
			
			<!-- 리뷰쓰기 아이콘 -->
			<div class="ReviewPencilIcon ">
				<a href="/review/review_writing_view"> <img alt="연필 이모티콘"
					width="40" height="40"
					src="https://icons.iconarchive.com/icons/iconka/business-outline/128/pencil-icon.png">
				</a>
			</div>
		</div>
	</div>	
			 
	<div class="swiper-container">
		<div class="swiper-wrapper">
		<c:forEach items="${reviewViewList}" var="reviewViewLists">
			<div class="swiper-slide">
				<div>
					<div><img class="reviewTopImgBox2" src="${reviewViewLists.user.imagePath}" width="600" height="100"></div>
					<div class="d-flex reviewTopInfoBox44">
						<div class="mt-3 ReviewListUserName">
							<img alt="유저 아이콘" width="25" height="25"
									src="https://icons.iconarchive.com/icons/custom-icon-design/silky-line-user/128/user-2-icon.png">
							${reviewViewLists.user.loginId}
						</div>
						<div class="mt-3 ml-4 ReviewListUserName">
							<img alt="리뷰 개수 아이콘" width="46" height="29"
									src=https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png>
							${reviewViewLists.reviewCount}
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	
		<!-- 네비게이션 -->
		<div class="swiper-button-next mt-5"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev mt-5"></div><!-- 이전 버튼 -->
	
		<!-- swiper -->
		<div class="swiper-pagination"></div>
	</div><!-- swiper 끝 -->
	
	



	<!-- card  -->
	<div class="article1  d-flex flex-wrap align-items-center justify-content-between">
		<c:forEach items="${reviewList}" var="reviewLists">
			<div class="ReviewListbox mt-3 card">
				<a href="/review/review_detail_view?reviewId=${reviewLists.id}">
					<small class="reveiwLangagueText card-img-overlay">${reviewLists.languageCategoryId}</small>
						<img class="ReveiwImgBox2 " src="${reviewLists.imagePath}" id="imageUrl" name="iamgeUrl" alt="이미지 " width="280" height="150">
				</a>
				<div class="reviewListTextBox22">
					<h3 class="text-secondary" name="price">
						<img alt="타입 이미지" height="22" width="22"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAhFBMVEX///8AAAC9vb2xsbHf39+fn5+2trb09PT8/PwuLi4aGhr4+PhlZWXq6upubm7t7e3BwcFDQ0PHx8cfHx+SkpJLS0vX19ddXV3Ly8vk5OSFhYVSUlI1NTVpaWl6enqampo9PT2np6cTExMmJiZ8fHxHR0eNjY03NzcvLy8VFRWEhIQLCwtLEJbiAAAPjklEQVR4nO1d6XqyOhB2B0XFFbWuaFtbvf/7O8XMJEECmSBI+J7z/mmrYZpJJpPZEhoNFVxvs570JuuO5yq/zwfX65RIdUOnumkfdk3EZR92CunIJhz3OdX+ONwUQrUT7i+c6u7QplDtrZrPmIbOix1x28sE1WX71Zl0wmmC6qqneSg8J5554PsVHt2jmmjz+AqPzrea6DnMeGg2T+nKH9q5u9JLJ9rUjXg62ulE57OUZ9xxRleaze0oV0+cYSbVYT7hGG0zqY6VwrH5yXzoD2lDk4UgQywemAc5qM50Xf1RqJx1rMV0vGj32sdDXEGYS+ok9vzX+BhRHX/FPp0YU41L6PIQUV2M42pnnTUqw54QSGcyHohvuoZdkZbgfd/y+ed+a38XX5kuxq54dDCeCDEf9eQV8SRxgfhm/LzenEXeWZSG7fZMdXRL7YwG0gwunlfxSNIlMfH3+YguVfu7P1Y/pkGHP7VS7cQbsfOaGBViMsa+4usOX1h3+Wu+MD5SyIpxU1FVw+VKJk24ubjN6Rujr5WnD2zwJT5b6B76Gzmc5RW5L3zi01UJV0RjMlU+8enSxKdjgZ9s8JOs9cAbtYhdWeu7IolcQvWloIUPZFmgs+dGuHtmmTuix2eiRJ1II4I9PtGIumhVZo9ICK227E/s+kFDHR/LHggEdv2oaYc2K000qH04xAYCJLuvnRtoeCf1BfbfpbYh6L4piSpoA60ycPtSQ1xg+n0XW1KMEFxg+vWFIkTZh1Az6d3AntRyQR3sRuOTOIJmTUE0PottCqIRqVPQCBS7YgQDQ/AyoCVlK0fDoND/j/r09GeTweIiacgtVfRASOcUoo05VUxBoLcUoi4sWQd13p7Ul5A1TrN8Eg2/SVTBWdfr6A9qwwh71riF2prmwnSoq2tI1x58wofahiu66HOtdERWPdJTDRaE+9G2Zov7TnPgnTsumWx4zEffkYg2PBTOHXWZPwC7nM78BqP7SjN/3CtbtLrWYHTTdk5UdjtY5rRdnMuJjkP/TFcJDVRgZy1V6hphuIOyuxuNC7itOnUNap3qMYyNqN6IVKcwd02j0f6m9WWTi0OdpQIc0hQ0Ssa98fv4eTHri3a070TtyMA0771gydgBZxcjTbOkrUOHRa+mRE3D5Gmg07ywDin2ZQTUS1sjDtku8KvdBZhev9D2II+N8o+uncPk7UQiihyu0E6g7c0wN/pR3NLmmsGn6oIlba4ZAtRLIftF56gyzKgrATQSLfjYpmoQ0AK04GOIXQBDrE966kDt+ARFhALYZPWGIwyFLhjBACpj1HDZLyRjDxYMoS2YTE2KqsEe6BctzAZpecOGFRlKMPV6f4E7zlqV0ODmHSUNAFFTitEBySNKGuBDLCgMvRESxHf6msWYpV4rgINKWrPgCBFsTIziR66s16eqDwxRU1xsFFO9aGCImiJ66OTrRQMk8/T4Azuu89yRPM1Zxhy0bhvCkBXNFtsTBxnDW8xZxpWu2b3Ax6E6oDge82w5debEPjNgTEfnlyFVEAxcM/1MQcHcHCXQFQGTIafMVhgZX2S2EoAYnsbkxSnkKgn/zSpjvJH0mZp4d7HQZZ8+3i5K3YWafHIwrJ850LAdCyuJJ/r6aQrV45UB9IQtz7p8pYm/z7N69LQkTytvMyQO9JzEjUgPqi2iDi88ospoBFFGo2ZA5DppNiMDClPzkqEQeonJENU322RvpNQx1VNmEM8Nk73piKQ7PXsYQRSaJBLyUYUAS+xvwue6Min/PV7H5j+Qao+mxJAcQqogOwTyUnODg/iKnnR9wJOKLr7j8/Gg+psi8nK50Hw8CaLh8YPZrS99PjUu75ELey6HSeA/qE4OF+lzM7n4gyPXlfRvswfVRmfyAUZd2p6QUiYm4THW60tzQE0DN+IDpwZdRHtHdD+S1YUxpOmtVvZjTB0E4lcaQg1VWoj+D5vI4liBqKfVAjKkqqBN1tBcmVEHc0LdoP/Q+cqg+kWuMwlYeAEt0vU1nWiWwdNKKb4UlNE4oIb0IqSXEdILkNBKEVqpm0Z0nu0l9U6KZ/pdPiq8MMVkY2y0VVWBPwYFVrwsRTL73W5fQfVLb5J0PuJidT3ITofHtSAtloAIbvGhO91MqquEFMQdoPUhLqzLbyJVf3K8Dben5erz2Bs9CfWIVzqZ7dMNd9Q6fg6Xp+Xw89h6ppoNUViX0EvuqHf8XC1P2/3tuKbXa2XC4bNIcxRfhzAO8hcqG8HjlfyrIk8VpGLPGcxTwpsLDl+oxuaIOTyxheWpJs77XzmLy7Jn0eMK6l7MuQ8quL15MrPFg2lzajIVo1/8R7uC1AgZXHZ2JiwGhtIWiMpeQ6/mdbjcu9sZOBx7Mx0squvfsOCT4CquT5cftpfS6ojkQn/DrbcocMdoQD5rwqznAa1xyBk0MYILBY+YaPPTCBMOhSFjegaiQPADBb9ETW7AIR++dxkyavCyeKJ+pHNYgSGjxrcZi1QORXj2nYaMGiKcQKm2J3LocJ9o8F5DRomuCYs0Dn3uoF3ebcgoIZS6PhFP4lCEwr/e4rvoIRxwbZSRwqEwZAwjxSVCnMHTxUgIHIqYplmYpFwI80qzd+k5FDJfmSGjhDhomB3gZb7Qb3oDKwwZJdY0FlnCIb2uRJy6rNSQUYKWC+xmT48wZMzPBpcPcWA0K+IfeZVpKXhXHKuu3JBRosP98SwdEbTSeu/wEN6gmDsziodgkVqJLWPDQ/S7fFcbvAMjLmXmW1mH54RM88xvhc/D4alrzXOU18jYaMgoMbqms+ivF4flz7w5/1keFk8phtkLs/9m+FxdxLNvXnsrXaLwh/u2LaRRnEC3y5BRwuOzKClE/9ZU4YYTyW1R2wwZJTzc1Xj0wflQ8hfhg8VakUP7DBklMAKBc9gapDLYhLIO/2lMrMdSVhlqAZVENWoUaZq7nYaMGt3TCQxwL57bvs93y908rnMeuR13Vp8JjMGXawlWYYctO6cTynUtBlkB6yBiZs17GOfDD8VMXl+9LK06iKKORdIU84S3+6V4thbgqZupWg59XoFXUW7pVfAAlfpusYZ8f1r+e9sqBJ4UybTEeFagjksRq2CyM74YuLDe4k4Coxo6LYJGngUJCkPAFOoP955rOom4CvW1tpjaqdtKhH5TkqGQaaqF5yThQt8FYFehHpi3BOi1kxpD23qZpy21reIq9/5xHXd9qKSQE4rB98PRuC4SfmCrjto0cffCWroJ9fngkeFdCXaA+YXi0LWojlHoTagdpx2YtwRwvwOflcStv3GJZPOrv4vCIsDdJmiSKo4GxRJUzDgl147ZgPj9NGGSwXhgDSw8W1NOKsAcMg49Hq/oH8a8VOYqNSfeemMTPMYIS15g2dTpoUIDjN1I4V8mpcQ7SywB06Ws4gemDct8MSgucjcui+fUy2yDMGk0K3hjJt8b0XPkUwZ+CPU2LjsA+18kl5OE8hw+KRaocqiXTdMTbLUTurP39MkisTBrAJDEqDYIPEUpStF64uhSv82iwT2igMAhZrgr6Wd+wBaxJHAIJl0N0r8xoAadaTnEKayZkPKZ2eo4xEthKjkV8xJwanwNh5gCp17KbhGGJA6xwNjyMhol2IYxzJZSXntbv5B3g/V+6WRyyNNTBjcY2AR3HbGVwSEvSj1V1MNikMEh+v7zeoVKn5HBIcbf6lRnokAGh0Y3i9qLDA6dfm3VqIwsXeodh4t6r8EIeu+p7vifw/rjfw7ritFx1Y9eMjhphP8kh4Gorhws/w0Og/Bj/HlcQ5BXep0gR605dI944OV+iLIrymvf6sxh/F2xi5SLBGvM4XOp+iXBXM05TK/FP2/lMvbachim8XeJgmeuuFWirhxuUvjj2cF13TnkVSTHzqbTlt5uzOtMuvXmEO+Wn7KQvMfVqHSiu19HDjvt7jFsbcSRLJ7OxfMHklt7yORw0/0a/Bk++65FaQvniAdhvnqfz7MRPLPMs1BKDjvSjcArW84Fhb/NBCR+dolPMnwLP34CamzFCWCVwSK/MG1lwmH4ROhsQUWN8mX3P26iAY3D5PXTlbOochrib6E14nCdILWr+M6dTqJHr3HI9Ox5KZUuVpzr5m7RMdisxXzmltJGY7YIH18Il7nS+DDembBlq2WDqj7/HEoIgVieGycKA3TijH+jsi+EQ17gV1bvKYCIi8i4t4vkEAuHqkzoM8NaOgbjFcphW/3xO8F6INcUXIrkEJZ5hQV88NYk+U6PnyI5hCLMCk/MKjjsJzhke8hcsjBNObRrDpMcMqdfLq0gcwgWToV7PonDxqz/1Ekyh+BIGrwApWikrsOfmDHp+vGKdAinSj6xmkM8k1mh8a3gkPlS2WeZ3YT+UHMIVuCpoN7mgYJDZopr9ujNtvl7kKdZyaE7qFxIVRz+WcyDrd4IGcWrEZQcQvyD/AK2MqDi8O9Tc0JKDsEbprwstDSoOcwBJYfbhMp9P0rl0GNq+Zr2zFtQKodglFZbSFsqh6BoTF4TWDxK5RAsn2qjwqVyaEWZYqkcglFabby0VA4h1vYy7ZdQKocsIX5Oe+Q9KJVDFgOq+Eh+mRwC7dPLtF/CGzis+uKIoswOOCgj+0nAYdXHu1iI+/UL8vzkzlCYfLwGpg12rxN6eEqxYA7Elqu+e49lsOcF+KiT/TDuy0PerurjT1BoUYYXDpdBk1+dWxIgh1/GAQnIWVR9kVLIulHGewuscC34PlaGKFlyfwuogzKCRX0bDO8GbvlG7zo2olxtlCbCMmkxFwOQjurv/gjKsqzAjqs2SvPAaHFol7EdHu1QpSVim7RU/y04zOK92HFRVPBxKHzLD+zwLBgeu37RdUtHO6xSBtaXgqt6koe/qkNQhi8ORxrsuM0Mk+2FDne3PFspB7YlOOPXUkQ/L4LiJxFJFkfxNWwL1+xDq4RUHGQqTKZGxUvFi4BJ/CnKPoW8mkXXKOEbxApyhMW1Z/YAz1wUk82E1z9cLXn17wO4J96LCLrhsrbDYkPg0eYiXrkMtV623XSNhyOyS/YowFeU2LQKI/CXVb5q2oTNMuzcIsAPLA1fElT+Yseq46QK8LeNT1+IPPAL9yyIQCUhDtblDi7yuxgs2uxliPcvr/LtGvyqgoFNW6EM6TTpwjyEFPC349q4CAHyCdCbmd28ls6i2rZRyGhLLDaXR6IV5wahfF+GJX5vCp5OuZ5Ph7Dda6Wj1+5+PL011x6fSQ1PfRcNGacaRLnXOz0fqbByH0zAVZ/vJmBqu4QKtPPM47KMcoDysN6n3J2UgvlnfeYP4QQLIpfzcbdjR5LJHK43Wk9avXS01h3He7eN9h/fOLIblLdtZQAAAABJRU5ErkJggg==">
						${reviewLists.reviewCategoryId}
					</h3>
					<small><img alt="ttile 이미지" height="22" width="22"
						src="https://icons.iconarchive.com/icons/icons8/ios7/128/Science-Literature-icon.png">
						${reviewLists.title}</small><br>




					<div class=" mt-2">
						<img alt="주제 이미지" height="22" width="22"
							src="https://icons.iconarchive.com/icons/pictogrammers/material/128/star-box-icon.png">
						<c:set var="point" value="${reviewLists.rating}" />
						<%-- 변수 설정. --%>
						<c:forEach begin="1" end="5">
							<c:choose>
								<c:when test="${point > 0.5}">
									<img
										src="https://icons.iconarchive.com/icons/custom-icon-design/pretty-office-3/128/Star-Full-icon.png"
										alt="이미지" width="20" height="20">
									<c:set var="point" value="${point - 1}" />
									<%-- 변수값 재설정. --%>
								</c:when>
								<c:when test="${point == 0.5}">
									<img
										src="https://icons.iconarchive.com/icons/custom-icon-design/pretty-office-3/128/Star-Half-Full-icon.png"
										alt="이미지" width="20" height="20">
									<c:set var="point" value="${point - 0.5}" />
									<%-- 변수값 재설정. --%>
								</c:when>
								<c:when test="${point == 0}">
									<img
										src="https://icons.iconarchive.com/icons/custom-icon-design/pretty-office-3/128/Star-Empty-icon.png"
										alt="이미지" width="20" height="20">
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	
	
	
	
	
	<!-- card가 없을 때. -->
<c:if test="${empty reviewList}">
	<div class="article1  d-flex flex-wrap align-items-center justify-content-between">
			<div class="ReviewListbox mt-3 card">
				<small class="reveiwLangagueText card-img-overlay"></small>
				<img class="ReveiwImgBox3" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Household-Broom-icon.png"
					id="imageUrl" name="iamgeUrl" alt="이미지 " width="170" height="120">
				<div class="reviewListTextBox22">
					<h3 class="text-secondary" name="price">
						<img alt="타입 이미지" height="22" width="22"
							src="data:image/png;base64,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">
					</h3>
					<small><img alt="ttile 이미지" height="22" width="22"
						src="https://icons.iconarchive.com/icons/icons8/ios7/128/Science-Literature-icon.png">
					</small><br>

					<div class=" mt-2">
						<img alt="주제 이미지" height="22" width="22"
							src="https://icons.iconarchive.com/icons/pictogrammers/material/128/star-box-icon.png">
					</div>
				</div>
			</div>
	</div>
</c:if>


<!-- 페이징 -->
<div class="d-flex justify-content-around GrammarListPage">
	<c:if test="${prevId ne 0}">
		<a href="/review/review_list_view?prevId=${prevId}&languageCategoryId=${languageCategoryId}" class="mr-5">
		<img alt="순서 이모티콘" width="36" height="36" src="https://icons.iconarchive.com/icons/steve/zondicons/128/Arrow-Outline-Left-icon.png">
		</a> <%-- 계산안하고 서버에 넘기기. --%>
	</c:if>
	<c:if test="${nextId ne 0}">
		<a href="/review/review_list_view?nextId=${nextId}&languageCategoryId=${languageCategoryId}"> 
		<img alt="순서 이모티콘" width="36" height="36" src="https://icons.iconarchive.com/icons/steve/zondicons/128/Arrow-Outline-Right-icon.png">		
		</a>
	</c:if>
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