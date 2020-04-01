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
				<form:form action="searchByKeyword.do">
					<div class="form-group">
						<label for="keywordSearch">Search by Keyword</label> <input
							type="text" class="form-control" id="keywordSearch"
							placeholder="Enter Keyword" name="keyword">
					</div>
					<button type="submit" class="btn ">Submit</button>
				</form:form>

			</div>
			<div class="col-lg-4 text-left pt-2">

				<form:form action="searchByFarm.do">
					<div class="form-group">
						<label for="farmSearch">Search by Garden</label> <input
							type="text" class="form-control" id="farmSearch"
							placeholder="Enter Farm" name="farm">
					</div>
					<button type="submit" class="btn ">Submit</button>
				</form:form>
			</div>
			<div class="col-lg-4 text-left pt-2">

				<form:form action="searchByZip.do">
					<div class="form-group">
						<label for="searchByZip">Search by ZipCode</label> <input
							type="text" class="form-control" id="searchByZip"
							placeholder="Enter ZipCode" name="zipString">
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
					<h2>Gardens you might be interested in</h2>
				</div>

			</div>
		</div>
		<c:forEach items="${gsfResults}" var="gardenStore">
			<div class="container gardenPageTrade">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-12 text-left pb-1">
						<h3><c:out value="${gardenStore.user.firstName}'s Garden"/></h3>
						<h3><c:out value="${gardenStore.nameOfGarden}"/></h3>
						<h4><c:out value="${gardenStore.address.street}"/></h4>
						<h4><c:out value="${gardenStore.address.city}, ${gardenStore.address.state} ${gardenStore.address.zipCode}"/></h4>
					</div>
					<div class="col-lg-12 justify-content-center pl-4">
						<p>Description: <c:out value="${gardenStore.description}"/></p>
					</div>
					<div class="col-lg-12 justify-content-center pl-4">
						<div class="row d-flex justify-content-center">
							<c:forEach items="${gardenStore.gardenProduces}" var="produce" begin="0" end="5">
							<div class="col-lg-2 justify-content-center pl-4">
								<h4><img src="<c:url value="${produce.product.imageURL }"/>"/></h4>

							</div>
							</c:forEach>
						</div>
					</div>

					<div class="row d-flex justify-content-start">

						<div class="col-lg-4 justify-content-start py-2">
							<form:form action="getGardenStoreFront.do" method="GET"
								class="form">
								<input type="hidden" value="${gardenStore.id}" id="1" name="id">

								<input type="submit" value="View Garden" class="btn btn-primary" />
							</form:form>

						</div>
					</div>
				</div>

			</div>
		</c:forEach>
		
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