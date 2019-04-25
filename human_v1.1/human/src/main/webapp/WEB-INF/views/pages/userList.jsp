<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mongo</title>
</head>
<body>

	<a href="add">추가</a>
	
	<h1>User List</h1>
	<table border ="1">
		<thead>
			<tr>
				<th>name</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var ="user" items ="${list}">
				<tr>
					<td>${user.name}</td>
					<td><a href ="upd?id=${user.id}">수정</a>
					<a href ="dlt?id=${user.id}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>