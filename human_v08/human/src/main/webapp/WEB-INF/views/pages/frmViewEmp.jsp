<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                    <h3 class="page-header">${sessionScope["comcode"]}사원정보 확인</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <label>사원번호:${employee.EMPNO} 성명: ${employee.EMPNAME}님의 정보확인</label>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="success">
                                            <td>기본정보</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr class="success">
                                            <td></td>
                                            <td>직급:</td>
                                            <td>${employee.TITLE}</td>                                            
                                            <td>부서:</td>
                                            <td>${employee.DEPT}</td>
                                        </tr>
                                        <tr class="success">
                                            <td></td>
                                            <td>근무지:</td>
                                            <td>${employee.LOCA}</td>
                                            <td>입사일자:</td>
                                            <td>${employee.INDATE.substring(0,10)}</td>
                                        </tr>
                                        <tr class="success">
                                            <td></td>
                                            <td>비고:</td>
                                            <td>${employee.RMK}</td>
                                        </tr>
                                        <tr class="info">
                                            <td>근로계약정보</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr class="info">
                                            <td></td>
                                            <td>계약시작일:</td>
                                            <td>${employee.SCONTDATE.substring(0,10)}</td>
                                            <td>계약종료일:</td>
                                            <td>${employee.ECONTDATE.substring(0,10)}</td>
                                        </tr>
                                        <tr class="info">
                                            <td></td>
                                            <td>월급:</td>
                                            <td><fmt:formatNumber value="${employee.MSALARY}" pattern="¤#,##0.###;¤(-#,##0.###)"/></td>
                                            <td>기본시간:</td>
                                            <td><fmt:formatNumber value="${employee.BTIME}" pattern="#,##0.###;(-#,##0.###)"/></td>
                                        </tr>
                                        <tr class="info">
                                            <td></td>
                                            <td>연봉:</td>
                                            <td><fmt:formatNumber value="${employee.YSALARY}" pattern="¤#,##0.###;¤(-#,##0.###)"/></td>
                                            <td>시급:</td>
                                            <td><fmt:formatNumber value="${employee.TSALARY}" pattern="#,##0.###;(-#,##0.###)"/></td>
                                        </tr>
                                        <tr class="info">
                                            <td></td>
                                            <td>고정연장시간:</td>
                                            <td><fmt:formatNumber value="${employee.ETIME}" pattern="#,##0.###;(-#,##0.###)"/></td>
                                            <td>고정할증시간:</td>
                                            <td><fmt:formatNumber value="${employee.ATIME}" pattern="#,##0.###;(-#,##0.###)"/></td>
                                        </tr>
                                        <tr class="info">
                                            <td></td>
                                            <td>식대:</td>
                                            <td><fmt:formatNumber value="${employee.MEAL}" pattern="¤#,##0.###;¤(-#,##0.###)"/></td>
                                            <td>자가운전:</td>
                                            <td><fmt:formatNumber value="${employee.SELFCAR}" pattern="¤#,##0.###;¤(-#,##0.###)"/></td>
                                        </tr>
                                        <tr class="info">
                                            <td></td>
                                            <td>육아수당:</td>
                                            <td><fmt:formatNumber value="${employee.BABY}" pattern="¤#,##0.###;¤(-#,##0.###)"/></td>
                                            <td>이메일:</td>
                                            <td>${employee.EMAIL}</td>
                                        </tr>
                                        <tr class="info">
                                            <td></td>
                                            <td>주소:</td>
                                            <td>${employee.ADDR1}</td>
                                            <td>상세주소:</td>
                                            <td>${employee.ADDR2}</td>
                                        </tr>
                                        <tr class="info">
                                            <td></td>
                                            <td>집전화:</td>
                                            <td>${employee.HTEL}</td>
                                            <td>핸드폰:</td>
                                            <td>${employee.MTEL}</td>
                                        </tr>
                                        <tr class="warning">
                                            <td>급여관련정보</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr class="warning">
                                            <td>수습율: ${employee.PRBRATE}</td>
                                            <td>수습시작일:</td>
                                            <td>${employee.SPRBDATE.substring(0,10)}</td>
                                            <td>수습종료일:</td>
                                            <td>${employee.EPRBDATE.substring(0,10)}</td>
                                        </tr>
                                        <tr class="warning">
                                            <td>감면율: ${employee.EXMRATE}</td>
                                            <td>세금감면시작일:</td>
                                            <td>${employee.SEXMDATE.substring(0,10)}</td>
                                            <td>세금감면종료일:</td>
                                            <td>${employee.EEXMDATE.substring(0,10)}</td>
                                        </tr>
                                        <tr class="danger">
                                            <td>기타정보</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr class="danger">
                                            <td></td>
                                            <td>성별:</td>
                                            <td>${employee.SEX}</td>
                                            <td>주민번호:</td>
                                            <td>${employee.REGNUM}</td>
                                        </tr>
                                        <tr class="danger">
                                            <td></td>
                                            <td>은행:</td>
                                            <td>${employee.BANKNAME}</td>
                                            <td>계좌번호:</td>
                                            <td>${employee.ACCNUM}</td>
                                        </tr>
                                        <tr class="danger">
                                            <td></td>
                                            <td>결혼여부:</td>
                                            <td>${employee.MARRIAGE}</td>
                                            <td>자녀수:</td>
                                            <td>${employee.CHILDNO}</td>
                                        </tr>
                                        <tr class="danger">
                                            <td></td>
                                            <td>6세이하자녀수:</td>
                                            <td>${employee.CHILD6NO}</td>
                                            <td>차량:</td>
                                            <td>${employee.CAR}</td>
                                        </tr>
                                        <tr class="danger">
                                            <td></td>
                                            <td>국민연금:</td>
                                            <td><fmt:formatNumber value="${employee.NPENSION}" pattern="¤#,##0.###;¤(-#,##0.###)"/></td>
                                            <td>고용보험:</td>
                                            <td>${employee.EIEMP}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                            <a href="tblEmpList" class="btn btn-primary">사원목록</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 6->12수정 테이블의 폭을 넓히기 위해..-->
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
