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
							<c:forEach items="${users}" var="users">
								<div class="col-12 text-left pb-5">
									<h4>${users.firstName}&nbsp;${users.lastName}</h4>
									<%-- <c:out value="gardenStoreFront.user.firstName" />
									<c:out value="gardenStoreFront.user.lastName" /> --%>
									<p>
										<strong>Role: </strong>
										<c:out value="gardener" />
										<br> <strong>Garden Name: </strong>
										<c:out value="${users.gardenStoreFront.nameOfGarden }" />
										<br> 
										<c:choose>
										<c:when test="${users.enabled == true}"><strong>Status: </strong>
										<c:out value="Enabled" />
										</c:when>
										<c:when test="${users.enabled == false}"><strong>Status: </strong>
										<c:out value="Disabled" />
										</c:when>
										</c:choose>
									</p>
									<c:choose>
										<c:when test="${users.enabled == true}">
											<form:form action="disableUser.do" method="POST">
												<div class="custom-control custom-switch pb-2">
													<div class="form-check">

														<input type="hidden" value="${users.id }" name="id"
															class="btn float-left"> <input type="submit"
															value="Disable" class="btn float-left">
													</div>
												</div>
											</form:form>
										</c:when>
										<c:when test="${users.enabled == false}">
											<form:form action="enableUser.do" method="POST">
												<div class="custom-control custom-switch pb-2">
													<div class="form-check">

														<input type="hidden" value="${users.id }" name="id"
															class="btn float-left"> <input type="submit"
															value="Enable" class="btn float-left">
													</div>
												</div>
											</form:form>

										</c:when>
									</c:choose>


								</div>
							</c:forEach>
						</div>
						<form:form action="homePage.do" method="GET">
							<div class="custom-control custom-switch pb-2">
								<div class="form-check">

									<%-- <input type="hidden" value="${user.id }" name="id"
										class="btn float-left"> --%> <input type="submit"
										value="My Garden" class="btn float-left">
								</div>
							</div>
						</form:form>
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