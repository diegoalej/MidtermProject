<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			<div class="row justify-content-start gardenProfile">
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
					<p>
						<a class="btn btn-secondary" href="editGardenStoreFront.do"
							role="button">Edit Profile</a> <a class="btn btn-secondary"
							href="addNewProduct.do" role="button">Add Product</a>
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
						aria-controls="nav-home" aria-selected="true">Your Products </a> <a
						class="nav-item nav-link" id="nav-pending-offers-received-tab"
						data-toggle="tab" href="#nav-pending-offers-received" role="tab"
						aria-controls="nav-pending-offers-received" aria-selected="false">Pending
						Offers Received </a> <a class="nav-item nav-link"
						id="nav-pending-offers-made-tab" data-toggle="tab"
						href="#nav-pending-offers-made" role="tab"
						aria-controls="nav-pending-offers-made" aria-selected="false">Pending
						Offers Made </a> <a class="nav-item nav-link"
						id="nav-completed-trades-tab" data-toggle="tab"
						href="#nav-completed-trades" role="tab"
						aria-controls="nav-completed-trades" aria-selected="false">Completed
						Trades </a>
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

										<c:choose>
											<c:when test="${not empty produce.product.imageURL}">
												<img class="rounded-circle" width="120" height="120"
													src="<c:url value="${produce.product.imageURL }"/>"
													alt="${produce.product.name}">
											</c:when>
											<c:otherwise>
												<img class="rounded-circle"
													src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
													alt="${produce.product.name}" width="120" height="120">
											</c:otherwise>

										</c:choose>
									</div>
									<div class="col-lg-9 text-left pl-4">
										<div class="row d-flex justify-content-center">

											<div class="col-lg-12 justify-content-center pl-4">
												<h2>
													<c:out value="${produce.product.name}" />
												</h2>
												<h4>
													Available: <c:out value="${produce.active}" />
												</h4>
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
													<form:form method="POST" action="editProduce.do"
														modelAttribute="gardenProduce">
														<input type="hidden" name="gardenProduceID"
															value="${produce.id}" />
														<input type="submit" class="btn btn-secondary"
															value="Edit Product" />
													</form:form>
												</p>
											</div>
											<div class="col-lg-4 justify-content-start pl-4">
												<%-- <p>
													<p>
													<form:form method="POST" action="editProduce.do" modelAttribute="gardenProduce">
														<input type="hidden" name="gardenProduceID" value="${produce.id}"/>
														<input type="submit" class="btn btn-secondary" value="See Offers"/>
													</form:form>
												</p> --%>
												<!-- </p> -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>


					</div>



				</div>

				<!-- Tab begins for Offers Pending -->
				<div class="tab-pane fade" id="nav-pending-offers-received"
					role="tabpanel" aria-labelledby="nav-pending-offers-tab">
					<div class="container">
						<div class="row d-flex justify-content-center">
							<div class="col-lg-12 text-left pb-1 pt-3">
								<h2>Offers Received</h2>
							</div>
							<!-- Start of choose -->
							<c:choose>
								<c:when test="${empty receivedOffers}">
									<div class="col-lg-12 text-left pb-1">
										<h3>You have no incoming trade offers.</h3>
									</div>
								</c:when>
								<c:otherwise>
									<!-- Start of forEach -->
									<c:forEach items="${receivedOffers}" var="offerDetails">
										<c:if test="${empty offerDetails.accepeted}">
											<div class="col-lg-12 text-left pb-1">
												<h3>
													Trade Request Received:
													<c:out value="${offerDetails.offerDate}" />
												</h3>
											</div>
											<div class="col-lg-6 justify-content-center pl-4">
												<h5>Desired from you:</h5>
												<!-- What they want from you -->
												<p>
													Desired item:
													<c:out value="${offerDetails.desired.product.name}" />
												</p>
												<p>
													Amount:
													<c:out value="${offerDetails.desired.amount}" />
												</p>

											</div>
											<div class="col-lg-6 justify-content-center pl-4">
												<h5>Offered to you:</h5>
												<!-- What they are willing to give you -->
												<p>
													Offered item:
													<c:out value="${offerDetails.offered.product.name}" />
												</p>
												<p>
													Farm name:
													<c:out
														value="${offerDetails.offered.gardenStoreFront.nameOfGarden}" />
												</p>
												<p>
													Amount:
													<c:out value="${offerDetails.offered.amount}" />
												</p>


											</div>
											<div class="col-lg-12 text-left pb-1">
												<h4>Comments</h4>
											</div>
											<div class="col-lg-12 text-left pb-2">
												<p>
													<c:out value="${offerDetails.comment}" />
												</p>

											</div>
											<form:form class="form-horizontal needs-validation"
												action="showOffer.do" modelAttribute="offer">
												<div class="col-lg-4 justify-content-start pl-4">
													<input class="form-control" type="hidden" name="id"
														value="${offerDetails.id}" /> <input type="submit"
														value="View Details" class="btn btn-primary" />
												</div>
											</form:form>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>




				</div>
				<!-- Tabs begin for Offers Received -->
				<div class="tab-pane fade" id="nav-pending-offers-made"
					role="tabpanel" aria-labelledby="nav-pending-offers-made-tab">
					<div class="container">
						<div class="row d-flex justify-content-center">
							<div class="col-lg-12 text-left pb-1 pt-3">
								<h2>Offers Made</h2>
							</div>
							<!-- Start of choose -->
							<c:choose>
								<c:when test="${empty madeOffers}">
									<div class="col-lg-12 text-left pb-1">
										<h3>You have no outgoing trade offers.</h3>
									</div>
								</c:when>
								<c:otherwise>
									<!-- Start of forEach -->
									<c:forEach items="${madeOffers}" var="offerDetails">
										<c:if test="${empty offerDetails.accepeted}">
											<div class="col-lg-12 text-left pb-1">
												<h3>
													Trade Request Received:
													<c:out value="${offerDetails.offerDate}" />
												</h3>
											</div>
											<div class="col-lg-6 justify-content-center pl-4">
												<h5>What you requested:</h5>
												<!-- What you want from them -->
												<p>
													Requested item:
													<c:out value="${offerDetails.desired.product.name}" />
												</p>
												<p>
													Amount:
													<c:out value="${offerDetails.desired.amount}" />
													lbs.
												</p>
												<p>
													Farm you requested from:
													<c:out value="${offerDetails.desired.garden.nameOfGarden }" />
												</p>

											</div>
											<div class="col-lg-6 justify-content-center pl-4">
												<h5>What you offered them:</h5>
												<!-- What you are willing to give -->
												<p>
													Offered item:
													<c:out value="${offerDetails.offered.product.name}" />
												</p>
												<p>
													Farm name:
													<c:out
														value="${offerDetails.offered.gardenStoreFront.nameOfGarden}" />
												</p>
												<p>
													Amount:
													<c:out value="${offerDetails.offered.amount}" />
													lbs.
												</p>


											</div>
											<div class="col-lg-12 text-left pb-1">
												<h4>Comments</h4>
											</div>
											<div class="col-lg-12 text-left pb-2">
												<p>
													<c:out value="${offerDetails.comment}" />
												</p>

											</div>
											<form:form class="form-horizontal needs-validation"
												action="showMyOffer.do" modelAttribute="offer">
												<div class="col-lg-4 justify-content-start pl-4">
													<input class="form-control" type="hidden" name="id"
														value="${offerDetails.id}" /> <input type="submit"
														value="View Details" class="btn btn-primary" />
												</div>
											</form:form>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>




					</div>
				</div>

				<!-- Tab begin for Completed Trades -->
				<div class="tab-pane fade" id="nav-completed-trades" role="tabpanel"
					aria-labelledby="nav-completed-trades-tab">
					<div class="container">
						<div class="row d-flex justify-content-center">
							<div class="col-lg-12 text-left pb-1 pt-3">
								<h2>Trades</h2>
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
							<form:form class="form-horizontal needs-validation"
								action="showTrade.do" modelAttribute="trade">
								<div class="col-lg-4 justify-content-start pl-4">
									<input class="form-control" type="hidden" name="id" value="1" />
									<input type="submit" value="View Details"
										class="btn btn-primary" />
								</div>
							</form:form>
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