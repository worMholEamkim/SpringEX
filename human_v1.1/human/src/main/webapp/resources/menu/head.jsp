<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/index">SSAGA Admin v1.0</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="login"><i class="fa fa-user fa-fw"></i> Login</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                            <a href="/index"><i class="fa fa-dashboard fa-fw"></i> ${sessionScope["comcode"]}인사정보관리</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i>기본정보관리</a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="tblEmpList">사원정보</a>
                                </li>
                                <li>
                                    <a href="#">수당정보</a>
                                </li>
                                <li>
                                    <a href="#">근태정보</a>
                                </li>
                                <li>
                                    <a href="#">휴가정보</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>급여작업</a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">급상여대장생성</a>
                                </li>
                                <li>
                                    <a href="#">급여명세서생성</a>
                                </li>
                                <li>
                                    <a href="#">급여명세서발송</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>보고서<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">근로계약서(개인)</a>
                                </li>
                                <li>
                                    <a href="#">급여명세서(개인)</a>
                                </li>
                                <li>
                                    <a href="#">급여(상여)대장</a>
                                </li>
                                <li>
                                    <a href="#">이체명세서</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>자료관리</a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">근로소득간이세액표생성</a>
                                </li>
                                <li>
                                    <a href="#">4대보험세율설정</a>
                                </li>
                                <li>
                                    <a href="testMongo/list">몽고DB Test</a>
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
