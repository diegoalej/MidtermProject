<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Produce in your Garden's Inventory</title>
<jsp:include page="includes/bootstrapHead.jsp"/>
</head>
<body>
	<!-- N A V I G A T I O N -->
	<jsp:include page="includes/navbar.jsp"/>
	<!-- M A I N  B O D Y -->
	<div class="d-flex justify-content-center">
		<div class="row justify-content-center">
			<div class="col-12 ">
				<h1>Edit Produce in your Garden's Inventory</h1>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">

		<div class="row justify-content-center">
			<div class="col-12  ">
				<h5>Edit Garden Product</h5>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="container">
			<div class="row py-2">
				<div class="col-sm-12">
					<form:form class="form-horizontal" action="editGardenProduce.do"
						modelAttribute="gardenProduce">
						<div class="form-group">
							<label> Product </label>
							<br> 
							<select name="action" id="action">
								<option value="${gardenProduce.product}">Name of Product</option>
							</select>
							<br> 
							<br> 
							<label> Amount </label> 
							<input class="form-control" type="number" name="amount" value="${gardenProduce.amount}"/> 
							<br> 
							<label>Date Expected</label>
							<input class="form-control" type="date" name="dateAvailable" value="${gardenProduce.dateAvailable}"/> 
							<br> 
							<label>Date Harvested</label>
							<input class="form-control" type="date" name="harvested" value="${gardenProduce.harvested}"/> 
							<br> 
							<label>Date of Expiration</label>
							<input class="form-control" type="date" name="dateExpires" value="${gardenProduce.expires}"/> 
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