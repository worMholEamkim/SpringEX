<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href='./webjars/bootstrap/4.3.1/css/bootstrap.min.css'>
	<title>CoderBy</title>
</head>
<body>
<h1>사원 목록</h1>
<a href="<c:url value='/hr/insert'/>">신규 사원 정보 입력</a>
<table border="1">
<tr>
	<th>EMPLOYEE_ID</th>
	<th>FIRST_NAME</th>
	<th>LAST_NAME</th>
	<th>EMAIL</th>
	<th>PHONE_NUMBER</th>
	<th>HIRE_DATE</th>
	<th>JOB_ID</th>
	<th>SALARY</th>
	<th>COMMISSION_PCT</th>
	<th>MANAGER_ID</th>
	<th>DEPARTMENT_ID</th>
</tr>
<c:forEach var="emp" items="${empList}">
<tr>
	<td><a href="<c:url value='/hr/${emp.employeeId}'/>">${emp.employeeId}</a></td>
	<td>${emp.firstName}</td>
	<td>${emp.lastName}</td>
	<td>${emp.email}</td>
	<td>${emp.phoneNumber}</td>
	<td>${emp.hireDate}</td>
	<td>${emp.jobId}</td>
	<td>${emp.salary}</td>
	<td>${emp.commissionPct}</td>
	<td>${emp.managerId}</td>
	<td>${emp.departmentId}</td>
</tr>
</c:forEach>
</table>

<script src="./webjars/jquery/3.3.1/jquery.min.js"></script> 
<script src="./webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
<script type="text/javascript">
  $(function () {
    console.log("jQuery ready");
  });
</script>
</body>
</html>