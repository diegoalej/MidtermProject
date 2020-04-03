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
		<div class="d-flex justify-content-start">
			<div class="row justify-content-start">
				<div class="col-12 ">
					<h1>Find Products and Gardens</h1>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-start ">
			<div class="row justify-content-start gardenProfile py-5 w-100">
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
	</div>
	<div class="row spacer1">
		<div class="span4"></div>
	</div>
	<!-- SEARCH RESULTS -->
	<div class="container gardenDetails " id="gardenDetails">
		<div class="container">

			<div class="row d-flex justify-content-around">
				<c:choose>
					<c:when test="${empty gsfResults}">
						<div class="col-lg-12 text-left pt-1">
							<h2>We did not find any gardens</h2>
						</div>
					</c:when>
					<c:when test="${welcomeInt == 1}">
						<div class="col-lg-12 text-left pt-1">
							<h2>Gardens you might be interested in</h2>
						</div>
					</c:when>
					<c:when test="${welcomeInt == 2}">
						<div class="col-lg-12 text-left pt-1">
								<h2>We found&nbsp;${gsfResults.size()}&nbsp;results</h2>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		<c:forEach items="${gsfResults}" var="gardenStore">
			<div class="container whiteLetters">
				<div class="row d-flex justify-content-center w-100">
					<div class="col-lg-12 text-left pb-1 ">
						<h3 class="no-padding-bottom no-padding-top">
							<c:out value="${gardenStore.user.firstName}'s Garden" />
						</h3>
						<h4>
							<c:out value="${gardenStore.nameOfGarden}" />
						</h4>
						<h4>
							<c:out value="${gardenStore.address.street}" />
						</h4>
						<h4>
							<c:out
								value="${gardenStore.address.city}, ${gardenStore.address.state} ${gardenStore.address.zipCode}" />
						</h4>
					</div>
					<div class="col-lg-12 justify-content-center pl-4">
						<p class="no-padding-left">
							Description:
							<c:out value="${gardenStore.description}" />
						</p>
					</div>
					<div class="col-lg-12 justify-content-center">
						<div class="row d-flex justify-content-center">
							<c:forEach items="${gardenStore.gardenProduces}" var="produce"
								begin="0" end="5">
								<div class="col-lg-2 justify-content-center pl-4">
									<h4>
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
									</h4>

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