<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.pay">SP Admin v1.0</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="login.pay"><i class="fa fa-user fa-fw"></i> Login</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.pay"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="index.pay"><i class="fa fa-dashboard fa-fw"></i> ${sessionScope["comcode"]}인사정보관리</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i>기본정보관리</a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="tblEmpList">사원정보</a>
                                </li>
                                <li>
                                    <a href="tblBenefList">수당정보</a>
                                </li>
                                <li>
                                    <a href="tblTimeCheckList">근태정보</a>
                                </li>
                                <li>
                                    <a href="tblVacationList">휴가정보</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>급여작업</a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="frmExePayLedger">급상여대장생성</a>
                                </li>
                                <li>
                                    <a href="frmExePaySlip">급여명세서생성</a>
                                </li>
                                <li>
                                    <a href="frmSendPaySlip">급여명세서발송</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>보고서<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="tblEmpList">근로계약서(개인)</a>
                                </li>
                                <li>
                                    <a href="tblEmpList">급여명세서(개인)</a>
                                </li>
                                <li>
                                    <a href="frmExePayLedger">급여(상여)대장</a>
                                </li>
                                <li>
                                    <a href="frmExePayLedger">이체명세서</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>자료관리</a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="tblIncomTaxList">근로소득간이세액표생성</a>
                                </li>
                                <li>
                                    <a href="tblFourInsrList">4대보험세율설정</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
