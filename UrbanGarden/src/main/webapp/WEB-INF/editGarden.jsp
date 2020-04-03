<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Garden</title>
<!--Bootsrap 4 CDN-->
<!-- 	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="css/myStyles.css">
</head>
<body>
	<!-- N A V I G A T I O N -->
	<jsp:include page="includes/navbar.jsp"/> 
	<!-- M A I N  B O D Y -->
	<div class="container ">
	<div class="d-flex justify-content-start">
		<div class="row justify-content-start">
			<div class="col-12 ">
				<h1>Edit Garden</h1>
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
	</div>
	<div class="d-flex justify-content-start">
		<div class="container">
			<div class="row py-2">
				<div class="col-sm-12">
					<form:form class="form-horizontal" action="editGardenStoreFront.do"
						 method="POST" modelAttribute="gardenStoreFront" >
						<div class="form-group">
						<form:input type ="hidden" path = "id"/>
							<label> Name of the Garden </label> 
							<form:input class="form-control"
								type="text" path="nameOfGarden"
								 /> <br>
							<label> Size in ft </label> 
							<form:input class="form-control" type="text" path="size"/> 
							<br> 
							<label>Is your garden organic? </label> <br>
							<div class="form-check form-check-inline">
										<form:checkbox class="form-check-input"  id="role" path = "organic" />
										<label class="form-check-label" for="role">Is organic</label>									
							</div>
							<br> 
							<label >Add a profile image URL (Recommended size 200x200)</label>
							<form:input type="text" class="form-control" path="gardenURL" /> 

							<br> <br> <label> Describe your garden </label> 
							<form:input class="form-control" type="text" path="description" /> <br>
							
							<label>Address</label> 
							<form:input class="form-control" type="text" path="address.street"/> <br>
							<label>Address 2</label> 
							<form:input class="form-control" type="text" path="address.street2" /> <br>
							<label>City</label> 
							<form:input class="form-control" type="text" path="address.city"/> <br>
							<label>ZipCode</label> 
							<form:input class="form-control" type="text" path="address.zipCode"  /> <br>
							<label>State</label> 
							<form:input class="form-control" type="text" path="address.state" /> <br>
							<label>Country</label> 
							<form:input class="form-control" type="text" path="address.country" /> <br>
							<div class="input-group">
								<!-- 	<div class="input-group-prepend">
									<span class="input-group-text" id="imageURL">Upload</span>
								</div> -->
								
								
							</div>
							
							<br> <input class="form-control" type="hidden" name="active"
								value="true" /> 
								<input type="submit" value="Update"
								class="btn btn-primary" />
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer class="footer font-small">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Copyright -->
					<div class="footer-copyright text-center py-3">© 2020
						Copyright: UrbanGarden App</div>
					<!-- Copyright -->
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer -->
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>