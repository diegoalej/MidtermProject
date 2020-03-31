<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<jsp:include page="includes/bootstrapHead.jsp" />
</head>
</head>
<body>
	<!-- N A V I G A T I O N -->
	<jsp:include page="includes/navbar.jsp" />
	<!-- ------------------ -->
	<!-- MAIN BODY -->
	<div class="container">
		<div class="row justify-content-start gardenProfile py-5">
			<div class="col-12 ">
				<h3>Check out gardens near you or search for something in
					particular</h3>
			</div>
			<div class="col-4 text-left pt-2 ">
				<form:form action="search.do">
					<div class="form-group">
						<label for="exampleInputPassword1">Search by product</label> <input
							type="text" class="form-control" id="exampleInputPassword1"
							placeholder="Enter Product">
					</div>
					<button type="submit" class="btn ">Submit</button>
				</form:form>

			</div>
			<div class="col-lg-4 text-left pt-2">

				<form:form action="search.do">
					<div class="form-group">
						<label for="exampleInputPassword1">Search by Garden</label> <input
							type="text" class="form-control" id="exampleInputPassword1"
							placeholder="Enter Farm">
					</div>
					<button type="submit" class="btn ">Submit</button>
				</form:form>
			</div>
			<div class="col-lg-4 text-left pt-2">

				<form:form action="search.do">
					<div class="form-group">
						<label for="exampleInputPassword1">Search by zipcode</label> <input
							type="text" class="form-control" id="exampleInputPassword1"
							placeholder="Enter ZipCode">
					</div>
					<button type="submit" class="btn ">Submit</button>
				</form:form>
			</div>
		</div>
	</div>
	<div class="row spacer1">
		<div class="span4"></div>
	</div>
	<!-- SEARCH RESULTS -->
	<div class="container gardenDetails " id="gardenDetails">
		<div class="container">

			<div class="row d-flex justify-content-around">
				<div class="col-lg-12 text-left pt-1">
					<h2>Gardens near you</h2>
				</div>

			</div>
		</div>
		<div class="container gardenPageTrade">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12 text-left pb-1">
					<h3>Nancy's Garden</h3>
				</div>
				<div class="col-lg-12 justify-content-center pl-4">
					<p>Description: Donec sed odio dui. Cras justo odio, dapibus ac
						facilisis in, egestas eget quam.</p>
				</div>
				<div class="col-lg-12 justify-content-center pl-4">
					<div class="row d-flex justify-content-center">
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>

						</div>
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>
						</div>
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>
						</div>
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>
						</div>
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>
						</div>
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>
						</div>
					</div>
				</div>

				<div class="row d-flex justify-content-start">

					<div class="col-lg-4 justify-content-start py-2">
						<p>
							<a class="btn btn-secondary" href="#" role="button">View
								Garden</a>
						</p>
					</div>
				</div>
			</div>

		</div>
				<div class="container gardenPageTrade">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12 text-left pb-1">
					<h3>Steve's Garden</h3>
				</div>
				<div class="col-lg-12 justify-content-center pl-4">
					<p>Description: Donec sed odio dui. Cras justo odio, dapibus ac
						facilisis in, egestas eget quam.Donec sed odio dui. Cras justo odio, dapibus ac
						facilisis in, egestas eget quam.</p>
				</div>
				<div class="col-lg-12 justify-content-center pl-4">
					<div class="row d-flex justify-content-center">
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>

						</div>
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>
						</div>
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>
						</div>
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>
						</div>
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>
						</div>
						<div class="col-lg-2 justify-content-center pl-4">
							<h4>Product image</h4>
						</div>
					</div>
				</div>

				<div class="row d-flex justify-content-start">

					<div class="col-lg-4 justify-content-start py-2">
						<p>
							<a class="btn btn-secondary" href="#" role="button">View
								Garden</a>
						</p>
					</div>
				</div>
			</div>

		</div>

	</div>
	<div class="row spacer">
		<div class="span4"></div>
	</div>

	<!-- Footer -->
	<jsp:include page="includes/bootstrapFoot.jsp" />

	<!-- Footer -->

	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>