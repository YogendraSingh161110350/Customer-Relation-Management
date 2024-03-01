<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
	<div class="container-fluide header-bg">
		<div class="container">
			<div class="row">
				<div class="col-md-10">
					<span
						style="font-size: 30px; font-weight: 700; margin-bottom: 5px; color: white; letter-spacing: 0.2rem;">CRM</span>
				</div>
				<div class="col-md-2"
					style="display: flex; align-items: center;justify-content: space-around;">
					<a class="navbar-brand" href="#"><img src="../images/profile.png" alt="Logo" style="width: 40px;"class="rounded-pill"></a>
						<a href="profile" style="color: white; font-size: 15px">${employee.name}/</a> 
					 <a href="logout" style="color: white; font-size: 15px">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluide">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Logo</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="employeeList">Employee List</a></li>
						<li class="nav-item"><a class="nav-link" href="addEmployeePage">Add Employee</a></li>
						<li class="nav-item"><a class="nav-link" href="courseList">Products</a></li>
						<li class="nav-item"><a class="nav-link" href="addCourse">Add Product</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Product Sell</a></li>
					</ul>
				</div>
			</div>
		</nav>

	</div>
</body>
</html>