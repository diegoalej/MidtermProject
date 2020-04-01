<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Offer</title>
<jsp:include page="includes/bootstrapHead.jsp"/>
</head>
<body>
	<!-- N A V I G A T I O N -->
	<jsp:include page="includes/navbar.jsp"/>
	<!-- M A I N  B O D Y -->
	<div class="d-flex justify-content-center">
		<div class="row justify-content-center">
			<div class="col-12 ">
				<h1>Edit Offer</h1>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">

		<div class="row justify-content-center">
			<div class="col-12  ">
				<h5>What do you want to trade?</h5>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="container">
			<div class="row py-2">
				<div class="col-sm-12">
					<form:form class="form-horizontal" action="editOffer.do"
						modelAttribute="offer" method="POST">
						<div class="form-group">
							<label> Products </label>
							<br> 
							<select name="action" id="action">
								<option value="${offered}">Name of Offered Product</option>
								<option value="2">2</option>
							</select>
							<select name="action" id="action">
								<option value="${desired}">Name of Desired Product</option>
								<option value="2">2</option>
							</select>
							<br> 
							<label>Comment</label>
							<input class="form-control" type="text" name="comment" value="${comment}"/> 
							<br> 
							<br> 
							<input class="form-control" type="hidden" name="active"
								value="true" /> <input type="submit" value="Update"
								class="btn btn-primary" />
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="includes/bootstrapFoot.jsp"/>
</body>
</html>