<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<jsp:include page="includes/bootstrapHead.jsp"/>
</head>
<body>
	<!-- N A V I G A T I O N -->
	<jsp:include page="includes/navbar.jsp"/>
	<!-- M A I N  B O D Y -->
	<div class="d-flex justify-content-center">
		<div class="row justify-content-center">
			<div class="col-12 ">
				<h1>Add New User</h1>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">

		<div class="row justify-content-center">
			<div class="col-12  ">
				<h5>Fill out the form below and become part of our urbanGarden
					network</h5>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="container">
			<div class="row py-2">
				<div class="col-sm-12">
					<form:form class="form-horizontal needs-validation" action="addUser.do"
						modelAttribute="user" >
						<div class="form-group">
							<label> First name </label> <input class="form-control"
								type="text" name="firstName" required/> <br> <label> Last
								Name </label> <input class="form-control" type="text" name="lastName" required/>
							 <!-- <div class="invalid-feedback">Valid last name is required.
							</div> -->
							<br> <label> Username </label> <input class="form-control"
								type="text" name="userName" /> <br> <label>password
							</label> <input class="form-control" type="password" name="password" required/> <br>
							<label>What is your role? </label><br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="role"
									value="user"> <label class="form-check-label"
									for="role">User</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="role"
									value="gardener"> <label class="form-check-label"
									for="role">Gardener</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="role"
									value="admin"> <label class="form-check-label"
									for="role">Admin</label>
							</div>
							<br> <br> <label class="form-check-label" for="role">Add
								a profile image (Recommended size 200x200)</label>
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
							<br> <input class="form-control" type="hidden"
								name="enabled" value="true" /> <input type="submit"
								value="Add User" class="btn btn-primary" />
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