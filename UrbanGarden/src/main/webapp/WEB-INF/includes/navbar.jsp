<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
		<a class="navbar-brand" href="home.do"><img class="navbar-logo"
			alt="Logo" src="images/carousel/dobby.jpeg"> </a>
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			<li class="nav-item active"><a class="nav-link" href="home.do">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item">
				<a class="nav-link" href="giraffes.do">Giraffes</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="parties.do">Parties</a>
			</li>
		</ul>
		<c:choose>
			<c:when test="${sessionScope.user == null}">
				<a href="register.do">Register</a>
				<form class="form-inline my-2 my-lg-0" action="login.do"
					method="post">
					<input name="username" class="form-control mr-sm-2" type="text"
						placeholder="Username" aria-label="Username"> <input
						name="password" class="form-control mr-sm-2" type="password"
						placeholder="Password" aria-label="Password">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
				</form>
			</c:when>
			<c:otherwise>
				<form class="form-inline my-2 my-lg-0" action="logout.do"
					method="post">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</nav>