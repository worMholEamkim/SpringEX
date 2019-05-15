<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='../webjars/bootstrap/4.3.1/css/bootstrap.min.css'>
<title>CoderBy</title>
</head>
<body>
	<div class="container-fluid">
		<div class="starter-template">
			<h1>사원정보 입력</h1>
		</div>

		<form class="form-inline" action="./insert" method="post">
			<table class="table table-condensed table-bordered table-hover">
				<tr>
					<th><label for="employeeId">EMPLOYEE_ID</label></th>
					<td><input class="form-control" id="employeeId" type="number"
						name="employeeId" placeholder="Number input" required></td>
				</tr>
				<tr>
					<th><label for="firstName">FIRST_NAME</label></th>
					<td><input class="form-control" id="firstName" type="text" name="firstName"
						placeholder="First Name input"></td>
				</tr>
				<tr>
					<th><label for="lastName">LAST_NAME</label></th>
					<td><input class="form-control" id="lastName" type="text" name="lastName"
						placeholder="Last Name input" required></td>
				</tr>
				<tr>
					<th><label for="email">EMAIL</label></th>
					<td><input class="form-control" id="email" type="text" name="email"
						placeholder="Email input" required></td>
				</tr>
				<tr>
					<th><label for="phoneNumber">PHONE_NUMBER</label></th>
					<td><input class="form-control" id="phoneNumber" type="text" name="phoneNumber"></td>
				</tr>
				<tr>
					<th><label for="hireDate">HIRE_DATE</label></th>
					<td><input class="form-control" id="hireDate" type="date" name="hireDate"
						required></td>
				</tr>
				<tr>
					<th><label for="jobId">JOB_ID</label></th>
					<td><select class="form-control" id="jobId" name="jobId">
							<c:forEach var="job" items="${jobList}">
								<option value="${job.jobId}">${job.title}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th><label for="salary">SALARY</label></th>
					<td><input class="form-control" id="salary" type="number" name="salary"></td>
				</tr>
				<tr>
					<th><label for="commissionPct">COMMISSION_PCT</label></th>
					<td><input class="form-control" id="commissionPct" type="number"
						name="commissionPct" step="0.1" min="0" max="0.99"></td>
				</tr>
				<tr>
					<th><label for="managerId">MANAGER_ID</label></th>
					<td><select class="form-control" id="managerId" name="managerId">
							<c:forEach var="manager" items="${managerList}">
								<option value="${manager.managerId}">${manager.firstName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th><label for="departmentId">DEPARTMENT_ID</label></th>
					<td><select class="form-control" id="departmentId" name="departmentId">
							<c:forEach var="department" items="${deptList}">
								<option value="${department.departmentId}">${department.departmentName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<td><input class="form-control" type="submit" value="저장">
						<input class="form-control" type="reset" value="취소"></td>
				</tr>
			</table>
		</form>

	</div><!-- /.container -->

	<script src="../webjars/jquery/3.3.1/jquery.min.js"></script>
	<script src="../webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			console.log("jQuery ready");
		});
	</script>
</body>
</html>