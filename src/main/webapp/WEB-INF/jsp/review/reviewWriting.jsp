<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container reviewTotalBox">
			<div class="display-4 pt-5 pb-5">
				<img alt="글쓴이 이모티콘" width="55" height="55" src="https://icons.iconarchive.com/icons/pictogrammers/material/128/movie-open-star-outline-icon.png">
			Write your own Review!</div>
			<div class="d-flex justify-content-between mb-5">
				<select name="id" id= "ReivewTypeId" class="form-select form-select-sm form-control standardHeight col-2">
					<option value="none" selected>type</option>
					<option value="book">book</option>
					<option value="movie">movie</option>
					<option value="music">music</option>
					<option value="news">news</option>
					<option value="magazine">magazine</option>
					<option value="cartoon">cartoon</option>
					<option value="IT">IT</option>
					<option value="Sports">Sports</option>
					<option value="Others">Others</option>
				</select> 
				<input id= "ReviewTitleId" name="title" type="text" 
					class="form-control col-5 mr-3 ml-3 standardHeight" placeholder="Title">
				
				<select name="id" id= languageCategoryId class="form-select form-select-sm form-control col-2 standardHeight">
						<option value="none" selected>language</option>
						<option value="KO">KO</option>
						<option value="EN">EN</option>
						<option value="JP">JP</option>
						<option value="CHN">CHN</option>
						<option value="FRA">FRA</option>
						<option value="SWE">SWE</option>
						<option value="DEU">DEU</option>
						<option value="VNM">VNM</option>
						<option value="Others">Others</option>
				</select> 
			
				<select name="id" id= "ReviewRatingId" class="form-select form-select-sm form-control col-2 ml-3 standardHeight">
						<option value="none" selected>rating</option>
						<option value="5">⭐⭐⭐⭐⭐</option>
						<option value="4">⭐⭐⭐⭐</option>
						<option value="3">⭐⭐⭐</option>
						<option value="2">⭐⭐</option>
						<option value="1">⭐</option>
				</select> 
				
			</div>

			<textarea name="description" type="text" id= "ReviewTextareaId" class="form-control mt-3 mb-5"></textarea>

			<div class="input-group mb-3 mt-3 ">
				<span class="input-group-text standardHeight" id="basic-addon1">Image url</span> <input
					 id="ReviewImageUrl" name="imageUrl" type="text" class="form-control standardHeight ReviewImageUrl">
			</div>
		
			
			<div class="GrammarSaveIcon text-center pt-3">
				<a href="#" id="saveReviewBtn">
					<img class="saveReviewBtn" alt="저장 이모티콘" width="35" height="35" src="https://icons.iconarchive.com/icons/icons8/windows-8/128/Programming-Save-icon.png">
				</a>
			</div>
</div>


<script>
$(document).ready(function(){
	
	// 리뷰 저장
	$('#saveReviewBtn').on('click', function(e){
		e.preventDefault();
		
		var selectType = document.getElementById('ReivewTypeId');
		var selectTypeIndex = document.getElementById('ReivewTypeId').options.selectedIndex;
		var selectTypeValue = selectType.options[selectTypeIndex].value;
		
		
		var selectLanguage = document.getElementById('languageCategoryId');
		var selectLanguageIndex = document.getElementById('languageCategoryId').options.selectedIndex;
		var selectLanguageValue = selectLanguage.options[selectLanguageIndex].value;
		

		var selectRating = document.getElementById('ReviewRatingId');
		var selectRatingIndex = document.getElementById('ReviewRatingId').options.selectedIndex;
		var selectRatingValue = selectRating.options[selectRatingIndex].value;
		
		
		let title = $('#ReviewTitleId').val();
		let content = $('#ReviewTextareaId').val();
		let ImagePath = $('#ReviewImageUrl').val(); 
		
		
		// validation
		if (selectTypeValue == 'none'){
			swal("Please select one type.");
			return;
		}
		
		if (!title) {
			swal("Please enter a title.");
			return;
		}
		
		
		if (selectLanguageValue == 'none') {
			swal("Please select one foreign language.");
			return;
		}
		
		if (selectRatingValue == 'none') {
			swal("Please select a star rating.");
			return;
		}
		
		
		if (!content) {
			swal("Please enter your content.");
			return;
		}
		
		if (content.length < 10) {
			swal("Please write at least 10 characters.");
			return;
		}
		
		
		if (!ImagePath) {
			swal("Please enter the image url.");
			return;
		}
		
		
		
		
		// AJAX
		$.ajax({
			// request
			type:"POST"
			, url: "/review/create"
			, data:{
				"selectTypeValue" : selectTypeValue
				, "selectLanguageValue" : selectLanguageValue
				, "title" : title
				, "selectRatingValue" : selectRatingValue
				, "content" : content
				, "ImagePath" : ImagePath}
			
		
			 // response
				, success : function(data) {
					if (data.code == 1) {
						//location.reload();
						swal(data.result);
						location.href = "/review/review_list_view";
					} else {
						swal(data.errorMessage);
					}
					
				}
				, error : function(request, status, error) {
					swal("Failed to save information. Please contact the administrator.");
				}
		});  // ajax
		
	}); // saveReveiwBtn
	
	
});  // document

</script>