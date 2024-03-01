<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Courses</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>
	<jsp:include page="customer-header.jsp"></jsp:include>
	
	<div class="container">
		 <h1 class="text-center">The Course List</h1>
 		 <p class="text-center">Start your course all the bes</p>
		<c:forEach items="${videos}" var="video">
  			<div class="row mt-4 p-2"  >
  			
    		<div class="col" style="background-color: #E4E6EB">
    		
    		<div class="row" style="box-shadow: 1px 1px 1px 1px gray;">
    		
    		<div class="col-md-4 d-flex" style="align-items: center;">
    			<img src="${video.thumbnailUrl}" alt="this" style="height: 20vh" >
    		</div>
    		<div class="col-md-3">
    		
    			<p><strong>Title </strong> : ${video.title}</p>
    			<p><strong>Duration</strong> : ${video.duration}</p>
    			<p><strong>UploadTime</strong> : ${video.uploadTime}</p>
    			<p><strong>Views</strong> : ${video.views}</p>
    			<p><strong>Author</strong> : ${video.author}</p>
    			<p><strong>Subscriber</strong> : ${video.subscriber}</p>
    		</div>
    		<div class="col-md-3">
    			<p>Description</p>
    			<p>${video.description}</p>
    		</div>
    		<div class="col-md-2 d-flex" style="align-items: center;" >
    			<a href="${video.videoUrl}" class="btn btn-primary input-field"> Play Video</a>
    		</div>
    	</div>
    </div>
  </div>
		
		</c:forEach>
  
	</div>
</body>
</html>