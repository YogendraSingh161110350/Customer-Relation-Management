<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body style="background-color: #FFFFFF">
	<div class="container-fluide header-bg">
		<div class="container">
			<div class="row">
				<div class="col-md-10">
					<span
						style="font-size: 30px; font-weight: 700; margin-bottom: 5px; color: white; letter-spacing: 0.2rem;">CRM</span>
				</div>
				<div class="col-md-2">
					<div class="dropdown">
						<button class="btn dropdown-toggle" type="button"
							data-toggle="dropdown">
							Select Page <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="index">Home</a></li>
							<li><a href="login">Login</a></li>
							<li><a href="#">Customer Register</a></li>
							<li><a href="customer-login">Customer Login</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container mt-3" id="loginsec">
		<c:if test="${not empty errorMessage}">
			<div class="alert alert-danger alert-dismissible">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Login Failed!</strong>${errorMessage}
			</div>
		</c:if>


		<div class="col-lg-2"></div>
		<div class="col-lg-8 login-form" style="background-color: #E4E6EB">
			<h1 class="text-center ">Login Form</h1>
			<form action="doLoginPage" method="post">
				<div class="mb-3 mt-3">
					<label for="email">Email:</label>
					<div class="input-container">
						   <i class="fa fa-envelope icon"></i>
						 <input type="email" class="form-control" id="email" placeholder="Enter email..." name="email" />
					</div>
				</div>
				<div class="mb-3">	
						<label for="password">Password:</label> 
					<div class="input-container">
						 <i class="fa fa-key icon"></i>
						<input type="password" class="form-control" id="pwd" placeholder="Enter password..." name="password" />
					</div>
						
				</div>
				<div class="form-check mb-3">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox" name="remember" />
						Remember me
					</label>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary text-center ">Submit</button>
				</div>
			</form>
		</div>
	</div>
	<div class="col-lg-2"></div>
</body>
</html>