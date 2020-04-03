<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg">
	<a class="navbar-brand" href="homePage.do">UrbanGarden</a>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link" href="search.do">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="homePage.do">Garden</a></li>
			<li class="nav-item"><a class="nav-link" href="editUser.do">Profile</a></li>
			<li class="nav-item"><a class="nav-link" href="search.do">Search</a></li>
			<c:choose>
				<c:when test="${not empty sessionScope.userSession}">
					<li class="nav-item"><a class="nav-link" href="logout.do">Logout</a></li>
				</c:when>
			</c:choose>
		</ul>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</div>
</nav>