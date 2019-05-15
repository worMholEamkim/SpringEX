<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href='./webjars/bootstrap/4.3.1/css/bootstrap.min.css'>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="./hr">HR</a>

<script src="./webjars/jquery/3.3.1/jquery.min.js"></script> 
<script src="./webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
<script type="text/javascript">
  $(function () {
    console.log("jQuery ready");
  });
</script>
</body>
</html>
