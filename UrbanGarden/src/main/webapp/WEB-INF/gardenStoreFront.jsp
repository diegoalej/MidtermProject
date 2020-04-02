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
					<h1>Garden Profile</h1>
				</div>
			</div>
		</div>
		<div class="row justify-content-start gardenProfile py-5">
			<div class="col-4 ">
				<div class="col-lg-12 text-left justify-content-start pt-2">

					<div class="col-lg-12 text-left justify-content-start pt-1 pb-2">

						<img class="rounded-circle"
							src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
							alt="Generic placeholder image" width="120" height="120">
					</div>
					<div class="col-12 text-left pt-5">
						<p>
							<strong>Garden Name: </strong>
							<c:out value="${gardenStoreFront.nameOfGarden }" />
						</p>
						<p>
							<strong>Owner: </strong>
							<c:out value="${gardenStoreFront.user.firstName }" />
							<c:out value="${gardenStoreFront.user.lastName }" />
						</p>
						<p>
							<strong>Organic: </strong>
							<c:choose>
								<c:when test="${gardenStoreFront.organic}">Yes</c:when>
								<c:otherwise>No</c:otherwise>
							</c:choose>
						</p>
					</div>

				</div>
			</div>
			<div class="col-lg-4 text-left pt-2 w-100">

				<h2>Description</h2>
				<p>
					<c:out value="${gardenStoreFront.description }" />
				</p>
				<p>
					<c:out value="${gardenStoreFront.address.street }" />
					<br>
					<c:out value="${gardenStoreFront.address.city }" />
					<c:out value="${gardenStoreFront.address.zipCode }" />
				</p>
			</div>
		</div>
	</div>
	<div class="row spacer1">
		<div class="span4"></div>
	</div>
	<!-- PRODUCT AND OFFER TOGGLE -->
	<div class="container gardenDetails " id="gardenDetails">
		<div class="container">
			<div class="row d-flex justify-content-around">
				<div class="col-lg-12 text-left pb-1 pt-1">
					<h2>Products Available</h2>
				</div>
				<!-- THIS WILL HAVE A FOREACH THAT WILL DISPLAY ALL PRODUCTS -->
				<c:forEach items="${gardenStoreFront.gardenProduces}" var="produce">
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
										<form:form class="form-horizontal"
											action="addOffer.do" modelAttribute="id"
											method="GET" >
							
											<input type="hidden"  name="id" value="${produce.id}" />
											<input type="submit" value="Place Offer"
														class="btn btn-primary" />
										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
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