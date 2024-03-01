<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <!DOCTYPE html>
    <html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
		function viewDetails(id)
		{
			window.location.href="/courseDetails?id="+id;
			console.log(id);
		}
</script>	
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
    <body style="background-color: #E4E6EB">
    
	 <jsp:include page="admin-header.jsp"/>
        <div class="content">
            <div class="container">
                <!-- end row -->
                <div class="row" style="background-color: #FFFFFF">
                	<c:forEach items="${courses}" var="course">
                		<div class="col-lg-4">
                        <div class="text-center card-box">
                            <div class="member-card pt-2 pb-2">
                                <div class="thumb-lg member-thumb mx-auto" style="position: relative;">
                                	<span style="position: absolute;top: 3%;right: 3%;height:20px;width: 20px;border-radius: 50%;background-color: white;" class="glyphicon glyphicon-lock"></span>
                                	<img src="${course.getImage()}" class="img-thumbnail" alt="profile-image">
                                </div>
                                <div class="">
                                    <h4>${course.name}</h4>
                                    <p class="text-muted">@Creator <span>| </span><span><a href="#" class="text-pink">${course.trainer.name}</a></span></p>
                                </div>
                                <ul class="social-links list-inline">
                                    <li class="list-inline-item"><a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                    <li class="list-inline-item"><a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                    <li class="list-inline-item"><a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Skype"><i class="fa fa-skype"></i></a></li>
                                </ul>
                                <button onclick="viewDetails(${course.id})" type="button" class="btn btn-primary mt-3 btn-rounded waves-effect w-md waves-light" on >Full Details</button>
                                <div class="mt-4">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="mt-3">
                                                <h4>${course.price}<span>&#8377;</span></h4>
                                                <p class="mb-0 text-muted">Price</p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="mt-3">
                                                <h4>${course.validity}</h4>
                                                <p class="mb-0 text-muted">Validity</p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="mt-3">
                                                <h4>${course.mode}</h4>
                                                <p class="mb-0 text-muted"> Mode</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                	</c:forEach>
                    </div>
                <!-- end row -->
                
                <div class="row">
                    <div class="col-12">
                        <div class="text-right">
                            <ul class="pagination pagination-split mt-0 float-right">
                                <li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">«</span> <span class="sr-only">Previous</span></a></li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span> <span class="sr-only">Next</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- container -->
        </div>
    </body>
    </html>
    