<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Confirmation</title>
<jsp:include page="includes/bootstrapHead.jsp"/>
</head>
<body>
	<!-- N A V I G A T I O N -->
<%-- 	<jsp:include page="includes/navbar.jsp"/> --%>
	<!-- M A I N  B O D Y -->
	<div class="d-flex justify-content-center">
		<div class="row justify-content-center">
			<div class="col-12 ">
				<h1>Create Confirmation</h1>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">

		<div class="row justify-content-center">
			<div class="col-12  ">
				<h5>${object} Created</h5>
				<h5><strong>Thank you for registering with us!</strong></h5>
				<h5><strong>You can now log in</strong></h5>
				<form action="home.do" method="GET">
<%-- 					<input class="form-control" type="hidden" name="user" value="${user}" /> --%>
					<button type="submit" value="Login" class="btn float-center">Login</button>
				</form>
				<br>
			</div>
			<br>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="includes/bootstrapFoot.jsp"/>
</body>
</html>