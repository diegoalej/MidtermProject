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
	<jsp:include page="includes/navbar.jsp"/>
	<!-- M A I N  B O D Y -->
	<div class="container">
	<div class="d-flex justify-content-start">
		<div class="row justify-content-start">
			<div class="col-12 ">
				<h1>User Removed</h1>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-start">

		<div class="row justify-content-start">
			<div class="col-12  ">
				<h5>User ID: ${object.id} Removed</h5>
			</div>
		</div>
	</div>
	<form action="home.do" method="GET">
		<button type="submit" value="Home" class="btn float-center">Home</button>
	</form>
	<br>
	</div>
	
	<!-- Footer -->
	<jsp:include page="includes/bootstrapFoot.jsp"/>
</body>
</html>