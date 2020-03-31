<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Product</title>
<jsp:include page="includes/bootstrapHead.jsp"/>
</head>
<body>
	<!-- N A V I G A T I O N -->
	<jsp:include page="includes/navbar.jsp"/>
	<!-- M A I N  B O D Y -->
	<div class="d-flex justify-content-center">
		<div class="row justify-content-center">
			<div class="col-12 ">
				<h1>Add New Product</h1>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">

		<div class="row justify-content-center">
			<div class="col-12  ">
				<h5>Tell us about your Product</h5>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="container">
			<div class="row py-2">
				<div class="col-sm-12">
					<form:form class="form-horizontal" action="addProduct.do"
						modelAttribute="product">
						<div class="form-group">
							<label> Name of the Product </label> <input class="form-control"
								type="text" name="name" value="${product.name}" />
							<br> 
							<label> Size of Product </label> 
							<br> 
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="sizeOfProduct" value="${product.sizeOfProduct}"> 
								<label class="form-check-label" for="role">Small</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="sizeOfProduct" value="${product.sizeOfProduct}"> 
								<label class="form-check-label" for="role">Medium</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="sizeOfProduct" value="${product.sizeOfProduct}"> 
								<label class="form-check-label" for="role">Large</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="sizeOfProduct" value="${product.sizeOfProduct}"> 
								<label class="form-check-label" for="role">Extra Large</label>
							</div>
							<br>
							<br>
							<label> Describe your Product </label> <input
								class="form-control" type="text" name="description"
								value="${product.description}" /> 
							<br> 
							<label>Type</label>
							<input class="form-control" type="text" name="type" value="${product.type}"/> 
							<br> 
							<label class="form-check-label" for="role">Add a Product image (Recommended size 200x200)</label>
							<div class="input-group">
								<!-- 	<div class="input-group-prepend">
									<span class="input-group-text" id="imageURL">Upload</span>
								</div> -->
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="imageURL"
										aria-describedby="imageURL"> <label
										class="custom-file-label" for="imageURL">Choose file</label>
								</div>
							</div>
							<br> 
							<input class="form-control" type="hidden" name="active"
								value="true" /> <input type="submit" value="Add Product"
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