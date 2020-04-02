<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Offer Detail</title>
<jsp:include page="includes/bootstrapHead.jsp"/>
</head>
<body>
	<!-- N A V I G A T I O N -->
	<jsp:include page="includes/navbar.jsp"/>

	<!-- MAIN BODY -->
	<div class="container">
		<div class="d-flex justify-content-start">
			<div class="row justify-content-start">
				<div class="col-12 ">
					<h1>Offer Details</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container moreinfo" id="moreinfo">
		<div class="container ">
			<!-- Three columns of text below the image -->
			<div class="row py-6 d-flex justify-content-around">
				<div class="col-lg-12">
					<div class="row d-flex justify-content-around">
						<div class="col-lg-12 text-center pb-2">

							<div class="row d-flex justify-content-start">
								<div class="col-lg-12 text-left pl-4">
									<div class="row d-flex justify-content-center">
										<div class="col-lg-12 text-left pb-1">
											<h3>Offer ${offer.id}</h3>
										</div>
										<div class="col-lg-6 justify-content-center pl-4">
											<h5>Date of Offer: ${offer.offerDate} </h5>
											<h5>Desired</h5>
											<p>Desired item: ${offer.desired.product.name}</p>
											<p>Farm name: ${offer.desired.garden.nameOfGarden}</p>
											<p>Harvest: ${offer.desired.harvested}</p>
											<p>Expires: ${offer.desired.expires}</p>
											<p>Size: ${offer.desired.product.sizeOfProduct}</p>
										</div>
										<div class="col-lg-6 justify-content-center pl-4">
											<h5>Offered</h5>
											<p>Offered item: ${offer.offered.product.name}</p>
											<p>Farm name: ${offer.offered.garden.nameOfGarden}</p>
											<p>Harvest: ${offer.offered.harvested}</p>
											<p>Expires: ${offer.offered.expires}</p>
											<p>Size: ${offer.offered.product.sizeOfProduct}</p>

										</div>
										<div class="col-lg-12 text-left pb-1">
											<h4>Comments</h4>
										</div>
										<div class="col-lg-12 text-left pb-2">
											<p>
												${buyerComment}<strong> ${offer.offered.garden.user.firstName}</strong>
											</p>
											<p>
												${sellerComment}<strong> ${offer.desired.garden.user.firstName}</strong>
											</p>
										</div>
									</div>
									<div class="row d-flex justify-content-start">

										<div class="col-lg-4 justify-content-start pl-4">
											<p>
												<a class="btn btn-secondary" href="homePage.do" role="button" >Back
													to Garden Store Front</a>
											</p>
										</div>
										<div class="col-lg-4 justify-content-start pl-4">
											<p>
												<a class="btn btn-secondary" href="showTradeDetail.do" role="button">Accept Offer</a>
											</p>
										</div>
										<div class="col-lg-4 justify-content-start pl-4">
											<p>
												<a class="btn btn-secondary" href="#" role="button">Deny Offer</a>
											</p>
										</div>
									</div>
									<div>
										<%-- <form:form class="form-horizontal needs-validation" action="editOffer.do" modelAttribute="offer" method="GET" >
											<div class="col-lg-4 justify-content-start pl-4">
												<input class="form-control" type="hidden" name="offer" value="${offer}" /> 
												<input class="form-control" type="hidden" name="id" value="${offer.id}" /> 
												<input class="form-control" type="hidden" name="desired" value="${offer.desired}" /> 
												<input class="form-control" type="hidden" name="offered" value="${offer.offered}" /> 
												<input class="form-control" type="hidden" name="comment" value="${offer.comment}" /> 
												<input type="submit" value="Edit Offer" class="btn btn-primary" />
											</div>
										</form:form> --%>
										<form:form class="form-horizontal needs-validation" action="deactivateOffer.do" modelAttribute="offer" method="POST">
											<div class="col-lg-4 justify-content-start pl-4">
												<input class="form-control" type="hidden" name="id" value="${offer.id}" /> 
												<input type="submit" value="Remove Offer" class="btn btn-primary" />
											</div>
										</form:form>
										
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- /.col-lg-2 -->

					<!-- /.col-lg-6 -->
				</div>
			</div>
			<!-- /.row -->
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="includes/bootstrapFoot.jsp"/>

</body>
</html>