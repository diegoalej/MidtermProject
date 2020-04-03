<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Garden</title>
<jsp:include page="includes/bootstrapHead.jsp"/>
</head>
<body>
	<!-- N A V I G A T I O N -->
<%-- 	<jsp:include page="includes/navbar.jsp"/> --%>
	<nav class="navbar navbar-expand-lg">
		<a class="navbar-brand" href="#">UrbanGarden</a>
	</nav>
	<!-- M A I N  B O D Y -->
	<div class="container ">
	
		<div class="d-flex justify-content-start">
			<div class="row justify-content-start">
				<div class="col-12 ">
					<h1>Add New Garden</h1>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-start">
	
			<div class="row justify-content-start">
				<div class="col-12  ">
					<h5>Tell us about your garden</h5>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-center">
				<div class="row py-2 w-100">
					<div class="col-sm-12">
						<form:form class="form-horizontal" action="addGardenStoreFront.do"
							modelAttribute="gardenStoreFront" method = "POST">
							<div class="form-group">
								<label> Name of the Garden </label> <input class="form-control"
									type="text" name="nameOfGarden" value="${gardenStoreFront.nameOfGarden}" />
								<br> 
								<label> Size in ft </label> 
								<input class="form-control" required
									type="text" name="size" value="${gardenStoreFront.size}" /> 
								<%-- <br>
								<label>Is your garden organic? </label>
								<br>
								<div class="form-check form-check-inline">
									<input class="form-control" type="checkbox" name="role"
									value="${gardenStoreFront.organic}"> 
									<label class="form-control">Yes</label>
								</div>
								<br>  --%>
								<br> 
								<label> Describe your garden </label> <input
									class="form-control" type="text" name="description"
									value="${gardenStoreFront.description}" /> 
								<br> 
								<label>Address</label>
								<input class="form-control" type="text" name="street" /> 
								<br>
								<label>Address</label>
								<input class="form-control" type="text" name="street2" /> 
								<br>
								<label>City</label> <input class="form-control" type="text"
									name="city" /> 
								<br> 
								<label>ZipCode</label> <input
									class="form-control" type="text" name="zipCode" /> 
								<br> 
								<label>State</label>
								<input class="form-control" type="text" name="state" /> 
								<br>
								<label>Country</label>
								<input class="form-control" type="text" name="country" /> 
								<br>
								<!-- <br> 
								<label class="form-check-label" for="role">Add a profile image (Recommended size 200x200)</label>
								<div class="input-group">
										<div class="input-group-prepend">
										<span class="input-group-text" id="imageURL">Upload</span>
									</div>
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="imageURL"
											aria-describedby="imageURL"> <label
											class="custom-file-label" for="imageURL">Choose file</label>
									</div>
								</div> -->
								<br> 
								<input class="form-control" type="hidden" name="active" value="true" /> 
								<input class="form-control" type="hidden" name="userid" value="${user.id}" /> 
								<input type="submit" value="Add Garden" class="btn btn-primary" />
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