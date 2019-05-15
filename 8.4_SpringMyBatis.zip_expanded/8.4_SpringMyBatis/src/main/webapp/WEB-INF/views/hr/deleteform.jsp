<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href='../webjars/bootstrap/4.3.1/css/bootstrap.min.css'>
	<title>CoderBy</title>
</head>
<body>
<h1>사원정보 삭제</h1>
${emp.employeeId}사원 ${emp.firstName} ${emp.lastName}의 정보를 삭제합니다.<p>
삭제후 데이터는 복구될 수 없습니다.<p>
${emp.employeeId}사원의 이메일을 입력하세요.
<form action="./delete" method="post">
이메일 : <input type="text" name="email">
<input type="hidden" name="empid" value="${emp.employeeId}">
<input type="submit" value="삭제">
</form>

<script src="../webjars/jquery/3.3.1/jquery.min.js"></script> 
<script src="../webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
<script type="text/javascript">
  $(function () {
    console.log("jQuery ready");
  });
</script>
</body>
</html>