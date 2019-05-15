<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='./webjars/bootstrap/4.3.1/css/bootstrap.min.css'>
<title>CoderBy</title>
</head>
<body>
	<div class="container-fluid">
		<div class="starter-template">
			<h1>사원 목록</h1>
			<p class="lead"> <a href="<c:url value='/hr/insert'/>">신규 사원 정보 입력</a> </p>
			<p class="lead"> http://bootstrapk.com/ </p>
		</div>

		<table class="table table-condensed table-bordered table-hover">
			<thead>
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
			</thead>
			<tbody>
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
			</tbody>
		</table>

	</div><!-- /.container -->

	<script src="./webjars/jquery/3.3.1/jquery.min.js"></script>
	<script src="./webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			console.log("jQuery ready");
		});
	</script>
</body>
</html>