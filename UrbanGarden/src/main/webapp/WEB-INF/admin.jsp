<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
<jsp:include page="includes/bootstrapHead.jsp" />
</head>
</head>
<body>
	<!-- N A V I G A T I O N -->
	<jsp:include page="includes/navbar.jsp" />

	<!-- MAIN BODY -->
	<!-- MAIN PROFILE  -->
	<div class="container">
		<div class="d-flex justify-content-start w-100">
			<div class="row justify-content-start">
				<div class="col-12 ">
					<h1>Site Admin</h1>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-start ">
			<div class="row justify-content-start gardenProfile py-3 w-100">
				<div class="col-lg-12 text-left justify-content-start ">
					<div class="col-12 text-left ">
						<h2>You can deactivate users by using buttons below</h2>
					</div>
					<div class="col-12 text-left">
						<div class="row justify-content-start gardenProfile ">
							<c:forEach items="${users}" var="user">
								<div class="col-12 text-left pb-5">
									<h4>${user.firstName} ${user.lastName}</h4>
									<%-- <c:out value="gardenStoreFront.user.firstName" />
									<c:out value="gardenStoreFront.user.lastName" /> --%>
									<p>
										<strong>Role: </strong>
										<c:out value="gardener" />
										<br> <strong>Garden Name: </strong>
										<c:out value="${user.gardenStoreFront.nameOfGarden }" />
									</p>
									<form:form action="changeUser.do" method="GET">
										<div class="custom-control custom-switch pb-2">
											<c:choose>
												<c:when test="${user.enabled == true}">
													<div class="form-check">
														<input class="form-check-input" type="radio"
															name="exampleRadios" id="exampleRadios1" value="true"
															checked> <label class="form-check-label"
															for="exampleRadios1"> Active </label>
													</div>
													<div class="form-check pb-1">
														<input class="form-check-input" type="radio"
															name="exampleRadios" id="exampleRadios2" value="false">
														<label class="form-check-label" for="exampleRadios2">
															Inactive </label>
													</div>
												</c:when>

												<c:otherwise>
													<div class="form-check">
														<input class="form-check-input" type="radio"
															name="exampleRadios" id="exampleRadios1" value="true">
														<label class="form-check-label" for="exampleRadios1">
															Active </label>
													</div>
													<div class="form-check pb-1">
														<input class="form-check-input" type="radio"
															name="exampleRadios" id="exampleRadios2" value="false"
															checked> <label class="form-check-label"
															for="exampleRadios2"> Inactive </label>
													</div>
												</c:otherwise>
											</c:choose>

										</div>
										
										<input type="hidden" value="${user.id }" name="id" class="btn float-left">
										<input type="submit" value="Change" class="btn float-left">
									</form:form>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- PRODUCT AND OFFER TOGGLE -->

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