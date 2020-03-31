<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h1>Garden Produce Details</h1>
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
											<h3>Garden Produce 1234</h3>
										</div>
										<div class="col-lg-12 text-left pb-1">
											<h5>Name</h5>
											<p>Farm name: Steve's Farm</p>
											<p>Amount Available: 6lbs</p>
											<p>Harvest: Jun 3 2020</p>
											<p>Expires: Jun 30 2020</p>
											<p>Size: medium</p>
										</div>
										
										<div class="col-lg-12 text-left pb-1">
											<h4>Description</h4>
										</div>
										<div class="col-lg-12 text-left pb-2">
											<p>
												Donec sed odio dui. Cras justo odio, dapibus ac facilisis
												in, egestas eget quam.<strong> Steve</strong>
											</p>
											
										</div>
									</div>
									<div class="row d-flex justify-content-start">

										<div class="col-lg-4 justify-content-start pl-4">
											<p>
												<a class="btn btn-secondary" href="myGardenStoreFront.do" role="button">Back
													to Garden</a>
											</p>
										</div>
										<div class="col-lg-4 justify-content-start pl-4">
											<p>
												<a class="btn btn-secondary" href="showTradeDetail.do" role="button">Edit Item</a>
											</p>
										</div>
										<div class="col-lg-4 justify-content-start pl-4">
											<p>
												<a class="btn btn-secondary" href="#" role="button">Remove Item</a>
											</p>
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

	<!-- Footer -->
	<jsp:include page="includes/bootstrapFoot.jsp"/>

</body>
</html>