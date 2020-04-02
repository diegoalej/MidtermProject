<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<jsp:include page="includes/bootstrapHead.jsp" />
</head>
<!-- MAIN BODY -->
<body class="homeBody">
	<div class="d-flex justify-content-center ">
		<div class="row justify-content-center">
			<div class="col-12 homelogo">
				<h1><strong>UrbanGarden App</strong></h1>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center fullsize">
		<div class="row justify-content-center pb-6">
			<div class="col-sm-12 mx-auto">
				<div class="card">
					<div class="card-header">
						<h3>Sign In</h3>
						<div class="d-flex justify-content-start">
							<div class="col-12  no-padding-left">
								<p class="no-padding-bottom">
									<strong>Enter your information below to sign in <br>or <a
										href="#moreinfo">click here</a> to find out more</strong>
								</p>
							</div>
						</div>
					</div>
					<div class="card-body">
						<form:form action="login.do" method="POST">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"
										style="color: white"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="username"
									name="username" required>
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"
										style="color: white"></i></span>
								</div>
								<input type="password" class="form-control"
									placeholder="password" name="password" required>
							</div>
							<!-- 							<div class="row align-items-center remember">
								<input type="checkbox">Remember Me
							</div> -->
							<div class="form-group">
								<input type="submit" value="Login" class="btn float-right">
							</div>
						</form:form>
					</div>
					<div class="card-footer">
						<div class="d-flex justify-content-center links">
							Don't have an account?<a href="addUser.do">Sign Up</a>
						</div>
						<div class="d-flex justify-content-center">
							<a href="#">Forgot your password?</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid moreinfo" id="moreinfo">
		<div class="container ">
			<!-- Three columns of text below the image -->
			<div class="row py-6 d-flex justify-content-around">
				<div class="col-lg-4 text-center">
					<img class="rounded-circle"
						src="https://scontent-den4-1.xx.fbcdn.net/v/t1.0-9/72244253_105270494223821_9113331573117157376_n.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=zq_Hiqk4fLIAX8kXnZ5&_nc_ht=scontent-den4-1.xx&oh=0217deab5d041371e1bb0f149ae08ad3&oe=5EACCFE2"
						alt="Generic placeholder image" width="140" height="140">
					<h2>Trade</h2>
					<p>Find other Urban Garedeners and trade those crops you just
						didn't have time or space to grow</p>
					<!-- 		<p>
						<a class="btn btn-secondary" href="#" role="button">View
							details</a>
					</p> -->
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4 text-center">
					<img class="rounded-circle"
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQOPnowgo1XDZvy6oN7nmCjHB3cKFwvoWNnEfp8p3h5tTX04ho3&usqp=CAU"
						alt="Generic placeholder image" width="140" height="140">
					<h2>Share</h2>
					<p>You can learn and help others by sharing advice on products
						and helping grow our network</p>

				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4 text-center">
					<img class="rounded-circle"
						src="https://aces.nmsu.edu/pubs/_circulars/CR457/images/intro_image.jpg"
						alt="Generic placeholder image" width="140" height="140">
					<h2>Shop</h2>
					<p>Shop for products grown in your community you and discover
						the freshest produce for your table</p>
					<!-- 	<p>
						<a class="btn btn-secondary" href="#" role="button">View
							details</a>
					</p> -->
				</div>
				<div class="col-lg-12 text-center">
					<p>
						<a class="btn " href="addUser.do" role="button">Join Today</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="includes/bootstrapFoot.jsp" />

</body>
</html>