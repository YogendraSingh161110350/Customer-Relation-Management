<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Add-Course</title>
</head>
<body style="background-color: #E4E6EB">
	<jsp:include page="admin-header.jsp" />
	<div class="container mt-3" style="background-color: #FFFFFF; padding: 20px">
			<form:form method="post" action="doAddCourse" enctype="multipart/form-data" modelAttribute="course">
			<h1 style="text-align: center;">Add Courses</h1>
			<div class="row mt-3">

				<div class="mb-3 mt-3 col">
					<label for="name" class="form-label">Name:</label>
					<div class="input-container">
						<i class="fa fa-user icon"></i>
						<form:input cssClass="form-control" id="name" placeholder="Enter name" path="name" />
						<form:errors path="name"  cssClass="register-error"/>	
					</div>
				</div>
				<div class="mb-3 mt-3 col">
					<label for="price" class="form-label">Price:</label>
					<div class="input-container">
						<i class="fa fa-money icon" aria-hidden="true"></i>
						<form:input cssClass="form-control" id="price" placeholder="Enter Price" path="price" />
						
					</div>
				</div>
				<div class="mb-3 mt-3 col">
					<label for="discount" class="form-label">Discount:</label>
					<div class="input-container">
						<i class="fa fa-money icon" aria-hidden="true"></i>
						<form:input cssClass="form-control" id="discount" placeholder="Enter discount" path="discount"/>
					
					</div>
				</div>
			</div>
		
			
			<div class="row mt-1"></div>
				<div class="mb-3 mt-1 col">
					<label for="validity" class="form-label">Validity</label>
					<div class="input-container">
						<i class="fa fa-clock-o icon" aria-hidden="true"></i>
						<form:input cssClass="form-control" placeholder="Enter validity" path="validity"/>
						<form:errors path="validity"  cssClass="register-error"/>	
					</div>
				</div>
				<div class="mb-3 mt-3 col">
					<label for="mode" class="form-label">Mode:</label>
					<div class="input-container">
						<i class="fa fa-user icon"></i>
						<form:input cssClass="form-control" id="mode" placeholder="Enter mode" path="mode"/>
						<form:errors path="mode"  cssClass="register-error"/>	
					</div>
				</div>
				<div class="mb-3 mt-3 col">
					<label for="name" class="form-label">Syllabus</label>
					<div class="input-container">
						<i class="fa fa-book icon" aria-hidden="true"></i>
						<form:input cssClass="form-control" id="syllabus" placeholder="Enter syllabus" path="syllabus" />
						<form:errors path="syllabus"  cssClass="register-error"/>	
					</div>
			</div>
			
			
			
			
			<div class="row mt-3">
				<div class="mb-3 mt-3 col">
					<label for="level" class="form-label">Level</label>
					<div class="input-container">
						<i class="fa fa-user icon"></i>
						<form:input cssClass="form-control" placeholder="Enter level" path="level"/>
						<form:errors path="level"  cssClass="register-error"/>
					</div>
				</div>
				<div class="mb-3 mt-3 col">
					<label for="category" class="form-label">Category</label>
					<div class="input-container">
						<i class="fa fa-user icon"></i>
						<form:input cssClass="form-control" placeholder="Enter category" path="category"/>
						<form:errors path="category"  cssClass="register-error"/>
					</div>
				</div>
				<div class="mb-3 mt-3 col">
					<label for="prerequisites" class="form-label">Prerequisites</label>
					<div class="input-container">
						<i class="fa fa-user icon"></i>
						<form:input cssClass="form-control" id="prerequisites" placeholder="Enter prerequisites" path="prerequisites"/>
						<form:errors path="prerequisites"  cssClass="register-error"/>
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="mb-3 mt-3 col">
					<label for="level" class="form-label">Qualification</label>
					<div class="input-container">
						<div class="input-container">
							 <form:textarea path="trainer.qualification" id="description" class="form-control" rows="4" cols="50"/>
							 <form:errors path="trainer.qualification"  cssClass="register-error"/>	
						</div>
					</div>
				</div>
				<div class="mb-3 col">
					<label for="category" class="form-label">Experience</label>
					<div class="input-container">
						 <form:textarea path="trainer.experience" id="description" class="form-control" rows="4" cols="50"/>
						 <form:errors path="trainer.experience"  cssClass="register-error"/>		
					</div>
				</div>			
			</div>

			<div class="row mt-3">
				
				<div class="mb-3 mt-3 col">
					<label for="trainer" class="form-label">Trainer</label>
					<div class="input-container">
						<i class="fa fa-level-up icon" aria-hidden="true"></i>
						<form:input cssClass="form-control" placeholder="Enter trainer name" path="trainer.name"/>
						 <form:errors path="trainer.name"  cssClass="register-error"/>		
					</div>
				</div>
				<div class="mb-3 mt-3 col">
					<label for="image" class="form-label">Course Image</label>
					<div class="input-container">
						<i class="fa fa-camera icon" aria-hidden="true"></i>
						<form:input type="file" cssClass="form-control" placeholder="Enter Image" path="image" />
						 <form:errors path="image"  cssClass="register-error"/>		
					</div>
				</div>
				<div class="mb-3 mt-3 col">
					<label for="image" class="form-label">Trainer Image</label>
					<div class="input-container">
						<i class="fa fa-camera icon" aria-hidden="true"></i>
						<form:input type="file" cssClass="form-control" placeholder="Enter Image" path="trainer.image" />
						 <form:errors path="trainer.image"  cssClass="register-error"/>
					</div>
				</div>
			</div>
			
			<div class="text-center">
				<input type="submit" value="Sumbmit" class="btn btn-primary" />
			</div>
		</form:form>
	</div>
</body>
</html>