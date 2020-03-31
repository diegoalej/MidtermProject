<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
											<h3>Trade 1234</h3>
										</div>
										<div class="col-lg-6 justify-content-center pl-4">
											<h5>Desired</h5>
											<p>Desired item: Cherry Tomato</p>
											<p>Farm name: Steve's Farm</p>
											<p>Amount: 6lbs</p>
											<p>Trade Date: Jun 3 2020</p>
											<p>Harvest: Jun 3 2020</p>
											<p>Expires: Jun 30 2020</p>
											<p>Size: medium</p>
										</div>
										<div class="col-lg-6 justify-content-center pl-4">
											<h5>Offered</h5>
											<p>Offered item: Acorn squash</p>
											<p>Farm name: Nancy's Farm</p>
											<p>Amount: 10lbs</p>
											<p>Trade Date: Jun 3 2020</p>
											<p>Harvest: Jun 3 2020</p>
											<p>Expires: Jun 30 2020</p>
											<p>Size: medium</p>

										</div>
										<div class="col-lg-12 text-left pb-1">
											<h4>Comments</h4>
										</div>
										<div class="col-lg-12 text-left pb-2">
											<p>
												Donec sed odio dui. Cras justo odio, dapibus ac facilisis
												in, egestas eget quam.<strong> Steve</strong>
											</p>
											<p>
												Donec sed odio dui. Cras justo odio, dapibus ac facilisis
												in, egestas eget quam.<strong> Nancy</strong>
											</p>
											<p>
												Donec sed odio dui. Cras justo odio, dapibus ac facilisis
												in, egestas eget quam.<strong> Steve</strong>
											</p>
											<p>
												Donec sed odio dui. Cras justo odio, dapibus ac facilisis
												in, egestas eget quam.<strong> Nancy</strong>
											</p>
										</div>
									</div>
									<div class="row d-flex justify-content-start">

										<div class="col-lg-4 justify-content-start pl-4">
											<p>
												<a class="btn btn-secondary" href="#" role="button">Back
													to all Trades</a>
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