<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>








<div>
	<div class="item-wrapper">
		<div class="GrammarCountriesIcons d-flex">
			<a href="#"> <img id="bannerImage" alt="여러 국기들" width="170"
				height="170" src="/static/img/KO.gif">
			</a>


			<div>
				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=EN"> <img alt="국기" class="countryImg" width="50"
						height="50" src="/static/img/US.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=JP"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/JP.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=CHN"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/CN.gif">
					</a>
				</div>
			</div>



			<div>
				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=OTHERS"> <img alt="국기" class="countryImg" width="50"
						height="50" src="/static/img/BR.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=EN"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/CA.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=DEU"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/DE.gif">
					</a>
				</div>
				
			</div>
			
			
			
			<div>
				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=ESP"> <img alt="국기" class="countryImg" width="50"
						height="50" src="/static/img/ES.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=FRA"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/FR.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=OTHERS"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/GE.gif">
					</a>
				</div>
				
			</div>
			
			
			<div>
				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=KO"> <img alt="국기" class="countryImg" width="50"
						height="50" src="/static/img/KO.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=OTHERS"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/GR.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=OTHERS"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/MA.gif">
					</a>
				</div>
				
			</div>
			
			
			<div>
				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=OTHERS"> <img alt="국기" class="countryImg" width="50"
						height="50" src="/static/img/NP.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=OTHERS"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/SO.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=VNM"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/VN.gif">
					</a>
				</div>
				
			</div>
			
			
			
			<div>
				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=OTHERS"> <img alt="국기" class="countryImg" width="50"
						height="50" src="/static/img/ZA.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=OTHERS"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/TZ.gif">
					</a>
				</div>

				<div class="item">
					<a href="/grammar/grammar_list_view?languageCategoryId=OTHERS"> <img id="endImg" class="countryImg" alt="국기"
						width="170" height="170" src="/static/img/OTHERS.gif">
					</a>
				</div>
				
			</div>
			
		</div>
	</div>

</div>








<div class="pencilIcon">
	<a href="/grammar/grammar_writing_view"> <img alt="글쓴이 이모티콘"
		width="55" height="55"
		src="https://icons.iconarchive.com/icons/handdrawngoods/busy/128/pencil-icon.png">
	</a>
</div>


<table class="table text-center  GrammarListTable ">
	<thead>
		<tr class="GrammarTableFont">
			<th class="GrammarTableFont"><img alt="순서 이모티콘" width="36"
				height="36"
				src="https://icons.iconarchive.com/icons/bootstrap/bootstrap/128/Bootstrap-list-ol-icon.png">
			</th>
			<th class="GrammarTableFont"><img alt="제목 이모티콘" width="36"
				height="36"
				src="https://icons.iconarchive.com/icons/icons8/ios7/128/Science-Literature-icon.png">
			</th>
			<th class="GrammarTableFont"><img alt="언어 이모티콘" width="36"
				height="36"
				src="https://icons.iconarchive.com/icons/ionic/ionicons/128/language-outline-icon.png">
			</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${grammarList}" var="grammarLists">
			<tr>
				<td class="GrammarTableFont">${grammarLists.id}</td>
				<td class="GrammarTableFont"><a
					href="/grammar/grammar_detail_view?grammarId=${grammarLists.id}" class="tableFont">
						${grammarLists.title} </a></td>
				<td class="GrammarTableFont">${grammarLists.languageCategoryId}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>




<!-- 페이징 -->
<div class="d-flex justify-content-around GrammarListPage">
	<c:if test="${prevId ne 0}">
		<a href="/grammar/grammar_list_view?prevId=${prevId}&languageCategoryId=${languageCategoryId}" class="mr-5">
		<img alt="순서 이모티콘" width="36" height="36" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Arrows-Back-icon.png">
		</a> <%-- 계산안하고 서버에 넘기기. --%>
	</c:if>
	<c:if test="${nextId ne 0}">
		<a href="/grammar/grammar_list_view?nextId=${nextId}&languageCategoryId=${languageCategoryId}">
		<img alt="순서 이모티콘" width="36" height="36" src="https://icons.iconarchive.com/icons/icons8/ios7/128/Arrows-Forward-icon.png">		
		</a>
	</c:if>
</div>



<script>
	$(document).ready(
			function() {

				// 배너 순회
				/* let bannerList = [ "/static/img/BR.gif",
									"/static/img/CA.gif",
									"/static/img/CN.gif",
									"/static/img/DE.gif",
									"/static/img/ES.gif",
									"/static/img/FR.gif",
									"/static/img/GE.gif",
									"/static/img/GH.gif",
									"/static/img/GR.gif",
									"/static/img/JP.gif",
									"/static/img/KO.gif",
									"/static/img/MA.gif",
									"/static/img/NP.gif",
									"/static/img/OTHERS.gif",
									"/static/img/SO.gif",
									"/static/img/TZ.gif",
									"/static/img/US.gif",
									"/static/img/VN.gif",
									"/static/img/ZA.gif"];
				let currentIndex = 1;

				setInterval(function() {
					$('#bannerImage').attr('src', bannerList[currentIndex]) // 속성 변경 - attr
					console.log(currentIndex);
					currentIndex++;
					// 4 -  0 1 2 3       
					if (currentIndex == bannerList.length) {
						currentIndex = 0;
					}

				}, 2000); // 임명함수 , 3초 - 3000  */

			}); // ready
</script>
