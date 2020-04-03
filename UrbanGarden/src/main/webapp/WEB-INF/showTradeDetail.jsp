<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction Detail</title>
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
					<h1>Trade Detail</h1>
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
											<h3>Trade ${trade.id}</h3>
											<p>Trade Date: ${trade.tradeDate}</p>
										</div>
										<div class="col-lg-6 justify-content-center pl-4">
											<h5>Desired</h5>
											<p>Desired item: ${trade.offer.desired.product.name}</p>
											<p>Farm name: ${trade.offer.desired.garden.nameOfGarden}</p>
											<p>Harvest: ${trade.offer.desired.harvested}</p>
											<p>Expires: ${trade.offer.desired.expires}</p>
											<p>Size: ${trade.offer.desired.product.sizeOfProduct}</p>
										</div>
										<div class="col-lg-6 justify-content-center pl-4">
											<h5>Offered</h5>
											<p>Offered item: ${trade.offer.offered.product.name}</p>
											<p>Farm name: ${trade.offer.offered.garden.nameOfGarden}</p>
											<p>Harvest: ${trade.offer.offered.harvested}</p>
											<p>Expires: ${trade.offer.offered.expires}</p>
											<p>Size: ${trade.offer.offered.product.sizeOfProduct}</p>

										</div>
										<div class="col-lg-12 text-left pb-1">
											<h4>Comments</h4>
										</div>
										<div class="col-lg-12 text-left pb-2">
											<p>
												${trade.buyerComment}<strong> ${trade.offer.offered.garden.user.firstName}</strong>
											</p>
											<p>
												${trade.sellerComment}<strong> ${trade.offer.desired.garden.user.firstName}</strong>
											</p>
											
									</div>
									<div class="row d-flex justify-content-start">

										<div class="col-lg-4 justify-content-start pl-4">
											<p>
												<a class="btn btn-secondary" href="homePage.do" role="button" >Back
													to Garden</a>
											</p>
										</div>
										</div>
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
	<div class="row spacer">
		<div class="span4"></div>
	</div>
	<!-- Footer -->
	<jsp:include page="includes/bootstrapFoot.jsp"/>
	
</body>
</html>