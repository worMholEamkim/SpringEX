<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>mongoA</title>
	</head>
	<body>
		<form action="upding" method="post">
			<input type="text" name="id" value="${user.id}" readonly>
			<input type="text" name="name" value="${user.name}">
			<input type="submit" value="저장">
		</form>
	</body>
</html>