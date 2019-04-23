<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Payroll v1</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/resources/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <%@ include file ="/resources/menu/head.jsp" %>

         <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">${sessionScope["comcode"]}사원정보 변경</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
							사원정보 변경
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h3>기본정보 수정</h3>
                                    <form role="form" action="updEmployee" method="post" >
                                    	<input type="hidden" name="COMCODE" value="${COMCODE}">
										<div class="form-group">
											<label>사원번호:</label>
											<input name="EMPNO" value="${employee.EMPNO}" readonly="readonly" class="form-control" >
										</div>
										<div class="form-group">
											<label>성명:</label>
											<input name="EMPNAME" value="${employee.EMPNAME}" readonly="readonly" class="form-control" >
										</div>
										<div class="form-group">
											<label>직급:</label>
											<select name="TITLE" class="form-control">
												<option value="사원" ${employee.TITLE eq '사원' ? 'selected' : ''}>사원</option>
												<option value="대리" ${employee.TITLE eq '대리' ? 'selected' : ''}>대리</option>
												<option value="과장" ${employee.TITLE eq '과장' ? 'selected' : ''}>과장</option>
												<option value="차장" ${employee.TITLE eq '차장' ? 'selected' : ''}>차장</option>
												<option value="실장" ${employee.TITLE eq '실장' ? 'selected' : ''}>실장</option>
												<option value="소장" ${employee.TITLE eq '소장' ? 'selected' : ''}>소장</option>
												<option value="부장" ${employee.TITLE eq '부장' ? 'selected' : ''}>부장</option>
												<option value="이사" ${employee.TITLE eq '이사' ? 'selected' : ''}>이사</option>
												<option value="부사장" ${employee.TITLE eq '부사장' ? 'selected' : ''}>부사장</option>
												<option value="대표이사" ${employee.TITLE eq '대표이사' ? 'selected' : ''}>대표이사</option>
											</select>
										</div>
										<div class="form-group" class="form-control">
											<label>부서:</label>
											<select name="DEPT">
												<option value="관리" ${employee.DEPT eq '관리' ? 'selected' : ''}>관리</option>
												<option value="외주" ${employee.DEPT eq '외주' ? 'selected' : ''}>외주</option>
												<option value="현대" ${employee.DEPT eq '현대' ? 'selected' : ''}>현대</option>
												<option value="기아" ${employee.DEPT eq '기아' ? 'selected' : ''}>기아</option>
												<option value="분당" ${employee.DEPT eq '분당' ? 'selected' : ''}>분당</option>
											</select>
										</div>
										<div class="form-group">
											<label>근무지:</label>
											<input name="LOCA" value="${employee.LOCA}" class="form-control" >
										</div>
										<div class="form-group">
											<label>입사일자:</label>
											<input name="INDATE" type="date" value=${employee.INDATE} class="form-control">
										</div>
										<div class="form-group">
											<label>비고:</label>
											<input name="RMK" type="text" value="${employee.RMK}" class="form-control">
										</div>
										<div class="form-group">
											<label>월급:</label>
											<input name="MSALARY" type="number" value="${employee.MSALARY}" class="form-control">
										</div>
										<div class="form-group">
											<label>기본시간:</label>
											<input name="BTIME" type="number" value="${employee.BTIME}" class="form-control">
										</div>
										<div class="form-group">
											<label>고정연장시간:</label>
											<input name="ETIME" type="number" value="${employee.ETIME}" class="form-control">
										</div>
										<div class="form-group">
											<label>고정할증시간:</label>
											<input name="ATIME" type="number" value="${employee.ATIME}" class="form-control">
										</div>
 										<div class="form-group">
											<label>식대:</label>
											<input name="MEAL" type="number" value="${employee.MEAL}" class="form-control">
										</div>
										<div class="form-group">
											<label>자가운전:</label>
											<input name="SELFCAR" type="number" value="${employee.SELFCAR}" class="form-control">
										</div>
										<div class="form-group">
											<label>육아수당:</label>
											<input name="BABY" type="number" value="${employee.BABY}" class="form-control">
										</div>
										<div class="form-group">
											<label>주소:</label>
											<input name="ADDR1" type="text" value="${employee.ADDR1}" class="form-control">
										</div>
										<div class="form-group">
											<label>상세주소:</label>
											<input name="ADDR2" type="text" value="${employee.ADDR2}" class="form-control">
										</div>
										<div class="form-group">
											<label>이메일:</label>
											<input name="EMAIL" type="email" value="${employee.EMAIL}" class="form-control">
										</div>
										<div class="form-group">
											<label>집전화번호:</label>
											<input name="HTEL" type="text" value="${employee.HTEL}" class="form-control">
										</div>
										<div class="form-group">
											<label>핸드폰:</label>
											<input name="MTEL" type="text" value="${employee.MTEL}" class="form-control">
										</div>
                                        <button type="submit" class="btn btn-primary">기본정보 수정</button>
                                        <button type="reset" class="btn btn-default">리쎗</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->                                
                                <div class="col-lg-6">
                                    <h3>추가정보 수정</h3>
                                    <form role="form" action="updEmployee2" method="post" >
                                    	<input type="hidden" name="COMCODE" value="${COMCODE}">
                                    	<input type="hidden" name="EMPNO" value="${employee.EMPNO}">
										<div class="form-group">
											<label>계약시작일:</label>
											<input name="SCONTDATE" type="date" class="form-control" value=${employee.SCONTDATE}>
										</div>
										<div class="form-group">
											<label>계약종료일:</label>
											<input name="ECONTDATE" type="date" class="form-control" value=${employee.ECONTDATE}>
										</div>
										<div class="form-group">
											<label>수습시작일:</label>
											<input name="SPRBDATE" type="date" class="form-control" value=${employee.SPRBDATE}>
										</div>
										<div class="form-group">
											<label>수습종료일:</label>
											<input name="EPRBDATE" type="date" class="form-control" value=${employee.EPRBDATE}>
										</div>
										<div class="form-group">
											<label>수습율:</label>
											<input name="PRBRATE" type="number" max = 0.9 min = 0.0 step = 0.1 value="${employee.PRBRATE}" class="form-control">
										</div>
										<div class="form-group">
											<label>소득감면시작일:</label>
											<input name="SEXMDATE" type="date" class="form-control" value=${employee.SEXMDATE}>
										</div>
										<div class="form-group">
											<label>소득감면종료일:</label>
											<input name="EEXMDATE" type="date" class="form-control" value=${employee.EEXMDATE}>
										</div>
										<div class="form-group">
											<label>감면율:</label>
											<input name="EXMRATE" type="number" max = 0.9 min = 0.0 step = 0.1 value="${employee.EXMRATE}" class="form-control">
										</div>
 										<div class="form-group">
											<label>성별:</label>
											<select name="SEX">
												<option value="남" ${employee.SEX eq '남' ? 'selected' : ''}>남</option>
												<option value="여" ${employee.SEX eq '여' ? 'selected' : ''}>여</option>
											</select>
										</div>
										<div class="form-group">
											<label>주민등록번호:</label>
											<input name="REGNUM" type="text" value="${employee.REGNUM}" class="form-control">
										</div>
										<div class="form-group">
											<label>은행이름:</label>
											<input name="BANKNAME" type="text" value="${employee.BANKNAME}" class="form-control">
										</div>
										<div class="form-group">
											<label>계좌번호:</label>
											<input name="ACCNUM" type="text" value="${employee.ACCNUM}" class="form-control">
										</div>
 										<div class="form-group">
											<label>혼인여부:</label>
											<select name="MARRIAGE">
												<option value="기혼" ${employee.MARRIAGE eq '기혼' ? 'selected' : ''}>기혼</option>
												<option value="미혼" ${employee.MARRIAGE eq '미혼' ? 'selected' : ''}>미혼</option>
											</select>
										</div>
										<div class="form-group">
											<label>자녀 수:</label>
											<input name="CHILDNO" type="number" min=0 value="${employee.CHILDNO}" class="form-control">
										</div>
										<div class="form-group">
											<label>6세이하 자녀 수:</label>
											<input name="CHILD6NO" type="number" min =0 value="${employee.CHILD6NO}" class="form-control">
										</div>
										<div class="form-group">
											<label>차량보유 수:</label>
											<input name="CAR" type="number" min=0 value="${employee.CAR}" class="form-control">
										</div>
										<div class="form-group">
											<label>국민연금:</label>
											<input name="NPENSION" type="number" min=0 value="${employee.NPENSION}" class="form-control">
										</div>
										<div class="form-group">
											<label>구분:</label>
											<input name="GUBUN" type="text" value="${employee.GUBUN}" class="form-control">
										</div>
										<div class="form-group">
											<label>구분1:</label>
											<input name="GUBUN1" type="text" value="${employee.GUBUN1}" class="form-control">
										</div>
										<div class="form-group">
											<label>국민연금가입:</label>
											<select name="EIEMP">
												<option value="" ${employee.EIEMP eq '' ? 'selected' : ''}>가입</option>
												<option value="N" ${employee.EIEMP eq 'N' ? 'selected' : ''}>비가입</option>
											</select>
										</div>
                                        <button type="submit" class="btn btn-primary">추가정보 수정</button>
                                        <button type="reset" class="btn btn-default">리쎗</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->                                
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/resources/vendor/raphael/raphael.min.js"></script>
    <script src="../resources/vendor/morrisjs/morris.min.js"></script>
    <script src="../resources/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

</body>

</html>
