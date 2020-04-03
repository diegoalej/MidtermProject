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
	<nav class="navbar navbar-expand-lg">
		<a class="navbar-brand" href="home.do">UrbanGarden</a>
	</nav>
	<!-- M A I N  B O D Y -->
	<div class="container ">
		<div class="d-flex justify-content-start">
			<div class="row justify-content-start">
				<div class="col-12 ">
					<h1>Your garden has been created</h1>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-start">
	
			<div class="row justify-content-start">
				<div class="col-12 text-left">
					<%-- <h4>New Garden with ID: ${object.id} Created</h4> --%>
					<h4><strong>Thank you for registering with us!</strong></h4>
					<h4><strong>You can now log in</strong></h4>
					<div class="col-6 pt-1">
						<form action="home.do" method="GET">
		<%-- 					<input class="form-control" type="hidden" name="user" value="${user}" /> --%>
							<button type="submit" value="Login" class="btn float-center no-padding-left">Login</button>
						</form>
					</div>
					<br>
				</div>
				<br>
			</div>
		</div>
	</div>	
	<!-- Footer -->
	<jsp:include page="includes/bootstrapFoot.jsp"/>
</body>
</html>