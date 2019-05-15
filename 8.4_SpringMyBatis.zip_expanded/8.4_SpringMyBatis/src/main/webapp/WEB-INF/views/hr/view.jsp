<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href='../webjars/bootstrap/4.3.1/css/bootstrap.min.css'>
	<title>CoderBy</title>
</head>
<body>
<h1>사원 정보 상세 조회</h1>
<table border="1">
<tr>
	<th>EMPLOYEE_ID</th>
	<td>${emp.employeeId}</td>
</tr>
<tr>
	<th>FIRST_NAME</th>
	<td>${emp.firstName}</td>
</tr>
<tr>
	<th>LAST_NAME</th>
	<td>${emp.lastName}</td>
</tr>
<tr>
	<th>EMAIL</th>
	<td>${emp.email}</td>
</tr>
<tr>
	<th>PHONE_NUMBER</th>
	<td>${emp.phoneNumber}</td>
</tr>
<tr>
	<th>HIRE_DATE</th>
	<td>${emp.hireDate}</td>
</tr>
<tr>
	<th>JOB_ID</th>
	<td>${emp.jobId}</td>
</tr>
<tr>
	<th>SALARY</th>
	<td>${emp.salary}</td>
</tr>
<tr>
	<th>COMMISSION_PCT</th>
	<td>${emp.commissionPct}</td>
</tr>
<tr>
	<th>MANAGER_ID</th>
	<td>${emp.managerId}</td>
</tr>
<tr>
	<th>DEPARTMENT_ID</th>
	<td>${emp.departmentId}</td>
</tr>
</table>
<a href="update?empid=${emp.employeeId}">수정하기</a> 
<a href="delete?empid=${emp.employeeId}">삭제하기</a>

<script src="../webjars/jquery/3.3.1/jquery.min.js"></script> 
<script src="../webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
<script type="text/javascript">
  $(function () {
    console.log("jQuery ready");
  });
</script>
</body>
</html>