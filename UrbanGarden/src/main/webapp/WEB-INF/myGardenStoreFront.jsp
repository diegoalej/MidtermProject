<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Profile</title>
<jsp:include page="includes/bootstrapHead.jsp" />
</head>
</head>
<body>

	<!-- N A V I G A T I O N -->
	<jsp:include page="includes/navbar.jsp" />

	<!-- MAIN BODY -->
	<!-- MAIN PROFILE  -->
	<div class="container">
		<div class="d-flex justify-content-start">
			<div class="row justify-content-start">
				<div class="col-12 ">
					<h1>Your Garden Profile</h1>
				</div>
				<div class="col-12 ">
					<h5>Welcome back!</h5>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-start">
			<div class="row justify-content-start">
				<div class="col-4 ">
					<div class="col-lg-12 text-left justify-content-start pt-2">

						<div class="col-lg-12 text-left justify-content-start pt-2">

							<img class="rounded-circle"
								src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
								alt="Generic placeholder image" width="120" height="120">
						</div>
						<div class="col-12 text-left py-3">
							<p>
								<strong>Garden Name: </strong>
								<c:out value="${user.gardenStoreFront.nameOfGarden }" />
							</p>
							<p>
								<strong>Owner: </strong>
								<c:out value="${user.firstName }" />
								<c:out value="${user.lastName }" />
							</p>
							<p>
								<strong>Role: </strong>
								<c:out value="${user.role }" />
							</p>
							<p>
								<strong>Organic: </strong>
								<c:choose>
									<c:when test="${user.gardenStoreFront.organic}">Yes</c:when>
									<c:otherwise>No</c:otherwise>
								</c:choose>
							</p>
						</div>

					</div>
					<p>
						<a class="btn btn-secondary" href="editGardenStoreFront.do" role="button">Edit Profile</a>
					</p>
				</div>
				<div class="col-lg-8 text-left">

					<h2>Description</h2>
					<p>
						<c:out value="${user.gardenStoreFront.description }" />
					</p>
					<p>
						<c:out value="${user.gardenStoreFront.address.street }" />
						<br>
						<c:out value="${user.gardenStoreFront.address.city }" />
						<c:out value="${user.gardenStoreFront.address.zipCode }" />
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- PRODUCT AND OFFER TOGGLE -->
	<div class="container gardenDetails " id="gardenDetails">
		<div class="container">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-item nav-link active" id="nav-home-tab"
						data-toggle="tab" href="#nav-home" role="tab"
						aria-controls="nav-home" aria-selected="true">Products</a> <a
						class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
						href="#nav-profile" role="tab" aria-controls="nav-profile"
						aria-selected="false">Offers</a> <a class="nav-item nav-link"
						id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
						role="tab" aria-controls="nav-contact" aria-selected="false">Trades</a>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">
					<div class="row d-flex justify-content-around">
						<div class="col-lg-12 text-left pb-1 pt-3">
							<h2>Products Available</h2>
						</div>
						<!-- THIS WILL HAVE A FOREACH THAT WILL DISPLAY ALL PRODUCTS -->
						<c:forEach items="${user.gardenStoreFront.gardenProduces}"
							var="produce">
							<div class="col-lg-12 text-center pb-2">

								<div class="row d-flex justify-content-start">
									<div class="col-lg-3 text-center pt-2">

										<img class="rounded-circle"
											src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
											alt="Generic placeholder image" width="120" height="120">
									</div>
									<div class="col-lg-9 text-left pl-4">
										<div class="row d-flex justify-content-center">

											<div class="col-lg-12 justify-content-center pl-4">
												<h2>
													<c:out value="${produce.product.name}" />
												</h2>
												<p>
													Type:
													<c:out value="${ produce.product.type}" />
												</p>
												<p>
													Amount:
													<c:out value="${ produce.amount}" />
												</p>
												<p>
													Harvest:
													<c:out value="${ produce.harvested}" />
												</p>
												<p>
													Available:
													<c:out value="${ produce.dateAvailable}" />
												</p>
												<p>
													Expires:
													<c:out value="${ produce.expires}" />
												</p>
												<p>
													Size:
													<c:out value="${ produce.product.sizeOfProduct}" />
												</p>
												<p>
													Description:
													<c:out value="${ produce.product.description}" />
												</p>
											</div>
										</div>
										<div class="row d-flex justify-content-start">

											<div class="col-lg-4 justify-content-start pl-4">
												<p>
													<a class="btn btn-secondary" href="#" role="button">Edit
														Product</a>
												</p>
											</div>
											<div class="col-lg-4 justify-content-start pl-4">
												<p>
													<a class="btn btn-secondary" href="#" role="button">View
														Offers</a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>


					</div>



				</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">
					<div class="container">
						<div class="row d-flex justify-content-center">
							<div class="col-lg-12 text-left pb-1 pt-3">
								<h2>Trades/Purchases</h2>
							</div>
							<div class="col-lg-12 text-left pb-1">
								<h3>Trade 1234</h3>
							</div>
							<div class="col-lg-6 justify-content-center pl-4">
								<h5>Desired</h5>
								<p>Desired item: Cherry Tomato</p>
								<p>Farm name: Steve's Farm</p>
								<p>Amount: 6lbs</p>
								<p>Trade Begin: Apr 23 2020</p>
								<p>Harvest: Jun 3 2020</p>
								<p>Expires: Jun 30 2020</p>
								<p>Size: medium</p>
							</div>
							<div class="col-lg-6 justify-content-center pl-4">
								<h5>Offered</h5>
								<p>Offered item: Acorn squash</p>
								<p>Farm name: Nancy's Farm</p>
								<p>Amount: 10lbs</p>
								<p>Trade Begin: Apr 23 2020</p>
								<p>Harvest: Jun 3 2020</p>
								<p>Expires: Jun 30 2020</p>
								<p>Size: medium</p>

							</div>
							<div class="col-lg-12 text-left pb-1">
								<h4>Comments</h4>
							</div>
							<div class="col-lg-12 text-left pb-2">
								<p>
									Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
									egestas eget quam.<strong> Steve</strong> April 23 2020 time ?
								</p>
								<p>
									Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
									egestas eget quam.<strong> Nancy</strong> April 23 2020 time ?
								</p>
								<p>
									Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
									egestas eget quam.<strong> Steve</strong>
								</p>
								<p>
									Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
									egestas eget quam.<strong> Nancy</strong> April 23 2020 time ?
								</p>
							</div>
						</div>
					</div>




				</div>
				<div class="tab-pane fade" id="nav-contact" role="tabpanel"
					aria-labelledby="nav-contact-tab">
					<div class="container">
						<div class="row d-flex justify-content-center">
							<div class="col-lg-12 text-left pb-1 pt-3">
								<h2>Trades/Purchases</h2>
							</div>
							<div class="col-lg-12 text-left pb-1">
								<h3>Trade 1234</h3>
							</div>
							<div class="col-lg-6 justify-content-center pl-4">
								<h5>Desired</h5>
								<p>Desired item: Cherry Tomato</p>
								<p>Farm name: Steve's Farm</p>
								<p>Amount: 6lbs</p>
								<p>Trade Date: Jun 3 2020</p>
							</div>
							<div class="col-lg-6 justify-content-center pl-4">
								<h5>Offered</h5>
								<p>Offered item: Acorn squash</p>
								<p>Farm name: Nancy's Farm</p>
								<p>Amount: 10lbs</p>
								<p>Trade Date: Jun 3 2020</p>
							</div>
							<div class="col-lg-12 text-left pb-1">
								<h4>Comments</h4>
							</div>
							<div class="col-lg-12 text-left pb-2">

								<p>
									Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
									egestas eget quam.<strong> Nancy</strong>
								</p>
							</div>
						</div>
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