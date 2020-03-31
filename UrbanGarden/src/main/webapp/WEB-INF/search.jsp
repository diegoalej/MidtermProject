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
	<!-- ------------------ -->
	<!-- MAIN BODY -->
	<div class="container">
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
							<c:out
								value="${sessionScope.user.gardenStoreFront.nameOfGarden }" />
						</p>
						<p>
							<strong>Owner: </strong>
							<c:out value="${sessionScope.user.firstName }" />
							<c:out value="${sessionScope.user.lastName }" />
						</p>
						<p>
							<strong>Role: </strong>
							<c:out value="${sessionScope.user.role }" />
						</p>
						<p>
							<strong>Organic: </strong>
							<c:choose>
								<c:when test="${sessionScope.user.gardenStoreFront.organic}">Yes</c:when>
								<c:otherwise>No</c:otherwise>
							</c:choose>
						</p>
					</div>

				</div>
			</div>
			<div class="col-lg-8 text-left pt-2 w-100">

				<h2>Description</h2>
				<p>
					<c:out value="${sessionScope.user.gardenStoreFront.description }" />
				</p>
				<p>
					<c:out
						value="${sessionScope.user.gardenStoreFront.address.street }" />
					<br>
					<c:out value="${sessionScope.user.gardenStoreFront.address.city }" />
					<c:out
						value="${sessionScope.user.gardenStoreFront.address.zipCode }" />
				</p>
			</div>
		</div>
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