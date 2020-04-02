<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Produce to your Garden's Inventory</title>
<jsp:include page="includes/bootstrapHead.jsp"/>
</head>
<body>
	<!-- N A V I G A T I O N -->
	<jsp:include page="includes/navbar.jsp"/>
	<!-- M A I N  B O D Y -->
	<div class="d-flex justify-content-center">
		<div class="row justify-content-center">
			<div class="col-12 ">
				<h1>Add Produce to your Garden's Inventory</h1>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">

		<div class="row justify-content-center">
			<div class="col-12  ">
				<h5>Pick a Product to add to your Garden</h5>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="container">
			<div class="row py-2">
				<div class="col-sm-12">
					<form:form class="form-horizontal" action="addGardenProduce.do"
						modelAttribute="gardenProduce" method="post">
						<div class="form-group">
							<label> Product </label>
							<br> 
							<select name="productId" id="product">
								<c:forEach var="productName" items="${listAllProducts}">
								<option value="${productName.id}">${productName.name}</option>
								</c:forEach>
							</select>
							<br> 
							<br> 
							<label> Amount </label> 
							<input class="form-control" type="number" name="amount" required="required"/> 
							<br> 
							<label>Date Expected</label>
							<input class="form-control" type="date" name="dateAvailableString"/> 
							<br> 
							<label>Date Harvested</label>
							<input class="form-control" type="date" name="harvestedString"/> 
							<br> 
							<label>Date of Expiration</label>
							<input class="form-control" type="date" name="dateExpiresString"/> 
							<br> 
							<br> 
							<input class="form-control" type="hidden" name="active" value="true" /> 
							<input class="form-control" type="hidden" name="gardenId" value="${gardenStoreFront.id}"/>
							<%-- <input class="form-control" type="hidden" name="product" value="${productName}"/> --%>
							<input type="submit" value="Add" class="btn btn-primary" />
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