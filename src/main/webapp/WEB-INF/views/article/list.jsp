<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<c:url var="R" value="/" />
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>
div.panel {
	width: 1100px;
}
select:nth-child(1) {
	margin-right: 150px;
}

table {
	width: 100%;
	margin: 10px 0px 20px 0px;
	border-collapse: collapse;
}

td, th {
	border: 1px solid #ddd;
	padding: 7px;
	text-align: left;
	font-size: 11pt;
	font-weight: normal;
}

th {
	background-color: orange;color:white;
}

td:nth-child(1), th:nth-child(1) {
	text-align: center;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container2">

		<div class="panel">
			<h1 class="panel-header">${ board.title }</h1>
			<div class="panel-body">

				<form:form method="get" modelAttribute="pagination">
					<form:select path="sz" class="autosubmit">
						<form:option value="2" />
						<form:option value="3" />
						<form:option value="4" />
						<form:option value="5" />
						<form:option value="10" />
						<form:option value="15" />
						<form:option value="30" />
						<form:option value="100" />
					</form:select>
					<br>
					<span>구:</span>
					<form:select path="di" class="form-control">
						<form:option value="0">전체</form:option>
						<form:options itemValue="id" itemLabel="location"
							items="${ locations }" />
					</form:select>
					<br>
					<span>태그:</span>
					<form:radiobutton path="ti" value="0" label="전체" />
					<form:radiobuttons path="ti" itemValue="id" class="form-control"
						itemLabel="tagName" items="${ tags }" />
					<br>
					<span>분위기</span>
					<form:radiobutton path="mi" value="0" label="전체" />
					<form:radiobuttons path="mi" itemValue="id" class="form-control"
						itemLabel="mood" items="${ moods }" />
					<br>
					<span>인원수:</span>
					<form:radiobutton path="pi" value="0" label="전체" />
					<form:radiobuttons path="pi" itemValue="id" class="form-control"
						itemLabel="party" items="${ partys }" />
					<br>
					<form:select path="si">
						<form:option value="0" label="조회조건" />
						<form:option value="1" label="제목" />
						<form:option value="2" label="글쓴이" />
					</form:select>
					<form:input path="st" />
					<form:hidden path="bd" value="${ pagination.bd }" />
					<button type="submit" class="btn2 cyan small">
						<i class="fa fa-search"></i> 조회
					</button>
					<a class="btn2 small" href="list?bd=${pagination.bd}">초기화</a>

					<a class="btn2 blue small right"
						href="create?${pagination.queryString}"> <i
						class="fa fa-pencil-square-o"></i> 글 등록
					</a>
				</form:form>

				<table>
					<thead>
						<tr>
							<th style="width: 5%;">no</th>
							<th style="width: 23%;">제목</th>
							<th style="width: 15%;">작성자</th>
							<th style="width: 16%;">수정시각</th>
							<th style="width: 10%;">구</th>
							<th style="width: 10%;">태그</th>
							<th style="width: 10%;">분위기</th>
							<th style="width: 10%;">인원수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="article" items="${ articles }">
							<c:set var="l" value="${ article.locationId }" />						
							<c:set var="t" value="${ article.tagId }" />
							<c:set var="m" value="${ article.moodId }" />
							<c:set var="p" value="${ article.partyId }" />
							<tr data-url="detail?id=${article.id }&${pagination.queryString}">
								<td>${ article.no }</td>
								<td>${ article.title }</td>
								<td>${ article.userName }</td>
								<td><fmt:formatDate value="${ article.modifiedTime }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>${ locations[l-1].location }</td>
								<td>${ tags[t-1].tagName}</td>
								<td>${ moods[m-1].mood }</td>
								<td>${ partys[p-1].party }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

	<my:pagination pageSize="${ pagination.sz }"
			recordCount="${ pagination.recordCount }" queryStringName="pg" />
			</div>
		</div>
	</div>

</body>
</html>
