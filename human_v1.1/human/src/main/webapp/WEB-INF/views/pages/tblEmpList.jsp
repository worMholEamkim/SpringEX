<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Payroll v1</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>

    <div id="wrapper">

		<%@ include file ="/resources/menu/head.jsp" %>
		        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">${sessionScope["comcode"]}사원정보</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        	사원정보 목록
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-employee">
                                <thead>
                                    <tr>
                                        <th>회사코드</th>
                                        <th>사원번호</th>
                                        <th>성명</th>
                                        <th>근무처</th>
                                        <th>직급</th>
                                        <th>부서</th>
                                        <th>입사일</th>
                                        <th>관리</th>
                                    </tr>
                                </thead>
								<tbody id = "dataTables-employee-body">
									<c:choose>
									<c:when test="${emplist.size() > 0}">
									<c:forEach var="record" items="${emplist}">
									<tr class="odd gradeX">
										<td id = "comcode" class="center">${record.COMCODE}</td>
										<td id = "empno"><a href="viewEmp?EMPNO=${record.EMPNO}">${record.EMPNO}</a></td>
										<td id = "empname">${record.EMPNAME}</td>
										<td>${record.LOCA}</td>
										<td>${record.TITLE}</td>
										<td>${record.DEPT}</td>
										<td>${record.INDATE.substring(0,10)}</td>
										<td><a href="frmUpdEmp?EMPNO=${record.EMPNO}" class="badge badge-danger">정보수정</a>
										<button id = "dataTables-cntrct-td" class="btn btn-sm btn-success">근로계약서</button> 
										<button id = "dataTables-empdel-td" class="btn btn-sm btn-warning">퇴직처리</button></td>
									</tr>
									</c:forEach>
									</c:when>
									<c:otherwise>
									<tr>
										<td colspan="9">등록 된 데이터가 없습니다</td>
									</tr>
									</c:otherwise>
									</c:choose>
								</tbody>                                
                            </table>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                        <div>
							<a href="frmAddEmp" class="btn btn-primary">사원정보등록</a>						
						</div>
						<!-- for Employee Registration --> 
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

	<!-- 근로계약서 Modal -->
	<div class="modal" tabindex="-1" role="dialog" id="cntrctModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">근로계약서 요청</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			<form id = "frmCntrctModal" action="prtCntrct" method="post">
				<div class="form-group">
					<label>사원번호:</label>
					<input class="form-control" name="EMPNO" type="text" id = "cntrctempnoModal"  readonly="readonly">
				</div>
				<div class="form-group">
					<label>사원명:</label>
					<input class="form-control" name="EMPNAME" type="text" id = "cntrctempnameModal" readonly="readonly">
				</div>
				<div class="form-group">
					<label>계약시작일:</label>
					<input class="form-control" name="SCONTDATE" type="Date" id = "cntrctscontdateModal">
					<label>계약종료일</label>
					<input class="form-control" name="ECONTDATE" type="Date" id = "cntrctecontdateModal">
				</div>
				<div class="form-group">
					<label>수습시작일:</label>
					<input class="form-control" name="SPRBDATE" type="Date" id = "cntrctspbrdateModal">
					<label>수습종료일</label>
					<input class="form-control" name="EPRBDATE" type="Date" id = "cntrctepbrdateModal">
					<label>수습율</label>
					<input class="form-control" name="PRBRATE" type="number" max="0.9" min="0.1" value ="0.9" id = "prbrateModal">
				</div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
	        <button id = "btnCntrctModal" type="button" class="btn btn-sm btn-primary">요청</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /근로계약서 Modal -->

	<!-- 퇴직처리 Modal -->
	<div class="modal" tabindex="-1" role="dialog" id="delEmpModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">퇴직처리</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			<form id = "frmDelEmpModal" action="delEmployee" method="post">
				<div class="form-group">
					<label>사원번호:</label>
					<input class="form-control" name="EMPNO" type="text" id = "empnoModal" readonly="readonly">
				</div>
				<div class="form-group">
					<label>사원명:</label>
					<input class="form-control" name="EMPNAME" type="text" id = "empnameModal" readonly="readonly">
				</div>
				<div class="form-group">
					<label>퇴직일자:</label>
					<input class="form-control" name="OUTDATE" type="Date" id = "outdateModal" >
				</div>
				<div class="form-group">
					<label>퇴직사유:</label>
					<input class="form-control" name="OUTREASON" type="text" id = "outReasonModal" >
				</div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
	        <button id = "btnDelEmpModal" type="button" class="btn btn-sm btn-primary">퇴직처리</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /퇴직처리 모달 -->
	
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
     $(document).ready(function() {
         $('#dataTables-employee').DataTable({
             responsive: true
         });

         $('#dataTables-employee-body').on('click','#dataTables-cntrct-td',function(){
         	var tag = $(this).parents();
    		var empno = tag.siblings('#empno').text();
    		var empname = tag.siblings('#empname').text();
    		$('#cntrctempnoModal').val(empno);
    		$('#cntrctempnameModal').val(empname);
    		$('#cntrctModal').modal('show');
         });

        $('#dataTables-employee-body').on('click','#dataTables-empdel-td',function(){
        	var tag = $(this).parents();
   			var empno = tag.siblings('#empno').text();
   			var empname = tag.siblings('#empname').text();
   			$('#empnoModal').val(empno);
   			$('#empnameModal').val(empname);   			
   			$('#delEmpModal').modal('show');
        });

   		$('#btnCntrctModal').click(function(){
   			$('#frmCntrctModal').submit();
   		});

   		$('#btnDelEmpModal').click(function(){
   			$('#frmDelEmpModal').submit();
   		});
         
     });
      
    </script>
</body>

</html>
