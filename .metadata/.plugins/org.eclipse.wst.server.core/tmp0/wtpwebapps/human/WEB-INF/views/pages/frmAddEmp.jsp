<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

		<%@ include file = "/resources/menu/head.jsp" %>
	
         <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">${sessionScope["comcode"]}사원정보 등록</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
							사원정보 등록
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h3>기본정보등록</h3>
                                    <form role="form" action="addEmployee" method="post">
										<div class="form-group">
											<label>사원번호:</label>
											<input name="EMPNO" class="form-control" placeholder="사원번호">
											<p class="help-block">사원번호는 입사일의 년,월,일에 두자리의 숫자를 사용하세요.(예:2019041601)!</p>
										</div>
										<div class="form-group">
											<label>성명:</label>
											<input name="EMPNAME" class="form-control" placeholder="성명">
										</div>
										<div class="form-group">
											<label>직급:</label>
											<select name="TITLE" class="form-control">
												<option value="사원">사원</option>
												<option value="대리">대리</option>
												<option value="과장">과장</option>
												<option value="차장">차장</option>
												<option value="실장">실장</option>
												<option value="소장">소장</option>
												<option value="부장">부장</option>
												<option value="이사">이사</option>
												<option value="부사장">부사장</option>
												<option value="대표이사">대표이사</option>
											</select>
										</div>
										<div class="form-group" class="form-control">
											<label>부서:</label>
											<select name="DEPT">
												<option value="관리">관리</option>
												<option value="외주">외주</option>
												<option value="현대">현대</option>
												<option value="기아">기아</option>
												<option value="분당">분당</option>
											</select>
										</div>
										<div class="form-group">
											<label>근무지:</label>
											<input name="LOCA" class="form-control" placeholder="근무지">
											<p class="help-block">근무지를 입력하세요!.</p>
										</div>
										<div class="form-group">
											<label>입사일자:</label>
											<input name="INDATE" type="date" class="form-control">
										</div>
										<div class="form-group">
											<label>비고:</label>
											<input name="RMK" type="text" class="form-control">
										</div>
										<div class="form-group">
											<label>월급:</label>
											<input name="MSALARY" type="number" class="form-control">
											<p class="help-block">연봉계약의 경우는 12분의 1을 입력하세요!</p>
										</div>
										<div class="form-group">
											<label>기본시간:</label>
											<input name="BTIME" type="number" class="form-control">
											<p class="help-block">기본급에 해당하는 근무시간 (209시간)!</p>
										</div>
										<div class="form-group">
											<label>고정연장시간:</label>
											<input name="ETIME" type="number" class="form-control">
											<p class="help-block">고정연장수당에 해당하는 근무시간!</p>
										</div>
										<div class="form-group">
											<label>고정할증시간:</label>
											<input name="ATIME" type="number" class="form-control">
											<p class="help-block">할증수당에 해당하는 근무시간!</p>
										</div>
 										<div class="form-group">
											<label>식대:</label>
											<input name="MEAL" type="number" class="form-control">
											<p class="help-block">월급에 포함된 비과세항목으로서의 식대금액 (100,000)!</p>
										</div>
										<div class="form-group">
											<label>자가운전:</label>
											<input name="SELFCAR" type="number" class="form-control">
											<p class="help-block">월급에 포함된 비과세항목으로서의 자가운전금액(200,000)!</p>
										</div>
										<div class="form-group">
											<label>육아수당:</label>
											<input name="BABY" type="number" class="form-control">
											<p class="help-block">월급에 포함된 비과세항목으로서의 육아수당(100,000)!</p>
										</div>
										<div class="form-group">
											<label>주소:</label>
											<input name="ADDR1" type="text" class="form-control">
										</div>
										<div class="form-group">
											<label>상세주소:</label>
											<input name="ADDR2" type="text" class="form-control">
										</div>
										<div class="form-group">
											<label>이메일:</label>
											<input name="EMAIL" type="email" class="form-control">
											<p class="help-block">급여명세서 발송을 위한 이메일 주소!</p>
										</div>
										<div class="form-group">
											<label>집전화번호:</label>
											<input name="HTEL" type="text" class="form-control">
										</div>
										<div class="form-group">
											<label>핸드폰:</label>
											<input name="MTEL" type="text" class="form-control">
										</div>
                                        <button type="submit" class="btn btn-primary">등록</button>
                                        <button type="reset" class="btn btn-default">취소</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->                                
                                <div class="col-lg-6">
                                    <h3>Excel파일을 이용한 사원등록</h3>
                                    <form role="form" method="post" action="addEmpFile.pay" enctype ="multipart/form-data">
                                        <div class="form-group">
                                            <label>파일을 선택하세요!</label>
                                            <p class="help-block">반드시 제공되는 Excel Template을 사용하여야 합니다.!</p>
                                            <a href="fileDown.pay?fileName=TmplateEmployee">Template 내려받기</a>
                                            <input name = "fname" type="file" accept=".xls,.xlsx">
                                        </div>
                                           <button type="submit" class="btn btn-primary">파일로등록</button>
                                    </form>
                                    <h3>자료 정검 결과</h3>
                                    <form role="form">
                                        <div class="form-group has-success">
                                            <label class="control-label" for="inputSuccess">Input with success</label>
                                            <input type="text" class="form-control" id="inputSuccess">
                                        </div>
                                        <div class="form-group has-warning">
                                            <label class="control-label" for="inputWarning">Input with warning</label>
                                            <input type="text" class="form-control" id="inputWarning">
                                        </div>
                                        <div class="form-group has-error">
                                            <label class="control-label" for="inputError">Input with error</label>
                                            <input type="text" class="form-control" id="inputError">
                                        </div>
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
    <script src="/resources/vendor/morrisjs/morris.min.js"></script>
    <script src="/resources/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

</body>

</html>
