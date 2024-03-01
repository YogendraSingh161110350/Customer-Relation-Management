<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body style="background-color: #E4E6EB">

	
	<jsp:include page="admin-header.jsp" />

	<div class="cotainer-fluide">
		<div class="row">
			<div class="col-md-3"></div>

			<!-- form is started  -->

			<div class="col-md-6" style="background-color: #FFFFFF; margin-top: 3vh; padding: 15px;box-sizing: border-box;">
				<h1 class="text-center">Add Employee</h1>


				<c:if test="${not empty successMsg}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<strong>Employee Added &nbsp;&nbsp;&nbsp;</strong>${successMsg}
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
				<c:if test="${not empty failMsg}">
					<div class="alert alert-denger alert-dismissible fade show"
						role="alert">
						<strong>Employee could Not added! &nbsp;&nbsp;&nbsp; </strong>${failMsg}
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>

				<!-- --------------------form is starting form here----------------------- -->
				<form:form action="doAddEmployee" method="post"
					modelAttribute="employee">
					<div class="form-group mt-2">

						<label for="name" style="font-weight: 700 ; user-select:none" class="mb-1">Name</label>
						<form:input cssClass="form-control" path="name" id="name" />
						<form:errors path="name" cssClass="register-error" />

					</div>

					<div class="form-group mt-2">

						<label for="password" style="font-weight: 700; user-select:none" class="mb-1">Password:</label>
						<form:password cssClass="form-control" id="password"
							path="password" />
						<form:errors path="password" cssClass="register-error" />
					</div>

					<div class="form-group mt-2">

						<label for="email" class="mb-1" style="font-weight: 700; user-select:none">Email address:</label>
						<form:input type="email" cssClass="form-control" id="email"
							path="email" placeholder="enter email..." />
						<form:errors path="email" cssClass="register-error" />
					</div>

					<div class="form-group mt-2">

						<label for="mobile" style="font-weight: 700; user-select:none" class="mb-1";>Mobile:</label>
						<form:input type="text" cssClass="form-control" id="mobile"
							path="mobile" />
						<form:errors path="mobile" cssClass=" register-error"/>

					</div>

					<div class="text-center mt-4">

						<button type="submit" class="btn btn-default btn-primary">Submit</button>
					</div>
				</form:form>
				<!-- --------------------form is Ending form here----------------------- -->
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>
