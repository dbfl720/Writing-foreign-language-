<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<a href="/grammar/grammar_detail_view?userId=${grammarLists.grammar.userId}">
				${grammarLists.grammar.title}
				</a>
				</td>
				<td class="GrammarTableFont">${grammarLists.grammar.languageCategoryId}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>