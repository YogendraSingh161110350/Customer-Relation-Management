<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="customer-header.jsp"/>
		<div class="container" style="background-color: #FFFFFF">
		 <h1 class="text-center">The Course List</h1>
 		 <p class="text-center">Start your course all the best</p>
		<c:forEach items="${purchasedCourses}" var="course">
  			<div class="row mt-4 p-2"  >
  			
    		<div class="col" style="background-color: #E4E6EB">
    		
    		<div class="row" style="box-shadow: 1px 1px 1px 1px gray;">
    		
    		<div class="col-md-4 d-flex" style="align-items: center;">
    			<img src="http://localhost:8080/uploads/javaFullStack.png" alt="" style="height: 20vh" >
    		</div>
    		<div class="col-md-3">
    		<p><strong> Name</strong> : ${course.courseName}</p>
    			<p><strong> Price</strong> : ${course.price}</p>
    			<p><strong> Date Of Purchased</strong> : ${course.dateOfPurchase}</p>
    			<p><strong> Time Of Purchased</strong> : ${course.timeOfPurchase}</p>
    			<p><strong> Validity</strong> : ${course.validity}</p>
    			<p><strong> Mode</strong> : ${course.mode}</p>
    			
    		</div>
    		<div class="col-md-3">
    			
    		</div>
    		<div class="col-md-2 d-flex" style="align-items: center;" >
    			<a href="/courses/video" class="btn btn-primary input-field"> Start Learning</a>
    		</div>
    	</div>
    </div>
  </div>
		
		</c:forEach>
  
	</div>
</body>
</html>