<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="admin-profile.jsp"/>

<div class="container">     
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Caller</th>
        <th>Medium</th>
        <th>Discussion</th>
         <th>Inquiry Date</th>
        <th>Inquiry Time</th>
        <th>Follow Up Date</th>
        <th>Interested Course</th>
        <th>Status</th>
      </tr>
    </thead>
     <tbody>
   <c:forEach items="${enqueryList}" var="inquiry">
   		<tr>
        <td>${inquiry.caller}</td>
        <td>${inquiry.medium}</td>
        <td>${inquiry.discussion}</td>
        <td>${inquiry.enquiryDate}</td>
        <td>${inquiry.enquiryTime}</td>
        <td>${inquiry.followUpDate}</td>
        <td>${inquiry.interestedCourse}</td>
        <td>${inquiry.status}</td>
      </tr> 
   </c:forEach>
 </tbody>     
  </table>
</div>

</body>
</html>