<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
			
		
		<link rel="stylesheet" href="css/style.css" type="text/css" />
		
		<title>Bootstrap Example</title>
  
		<script type="text/javascript">
		
		function updateBox(id)
		{    
			window.location.href="/updateEmployee?id="+id;
		}
		
		
		let Confirm=function deleteConfirmationBox(id,name1)
			{
			    
				let name=document.querySelector('#name');
				name.style.color='red';
				name.style.fontSize='18px';
				name.style.margin='0 1px';
				name.style.textTransform='upperCase';
				name.innerHTML= name1;
				console.log('hina')
				console.log(name1);
				$('#deleteConfirmationBox').modal('show');
				$('#deleteButton').attr('href','/deleteEmployee?id='+id);
			}
		
		   
			
		</script>
		
	</head>
	<body>
	
	<jsp:include page="admin-header.jsp"/>
	
	<div class="container">
		<div class="row">
			<div class="col-md-10"></div>
			<!-- Filter Code here -->
			<div class="col-md-2">
				<div class="dropdown">
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown">
						Sort Employee <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="/employeeList?sort=byName">Name</a></li>
						<li><a href="/employeeList?sort=byEmail">Email</a></li>
						<li><a href="/employeeList?sort=bySalaryAsc">Salary(Asc)</a></li>
						<li><a href="/employeeList?sort=bySalaryDesc">Salary(Desc)</a></li>
						<li><a href="/employeeList?sort=byNewJoining">New Employees</a></li>
						<li><a href="/employeeList?sort=byOldJoining">Old Employees</a></li>
					</ul>
				</div>
			</div>


			<!-- Filter Code is End -->
			<div class="row">
				<c:if test="${not empty failMsg}">
					<div class="alert alert-danger alert-dismissible mt-2">
    					<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    					<strong>Failed!</strong> ${failMsg}
  					</div>
				</c:if>
				<c:if test="${not empty successMsg}">
					<div class="alert alert-success alert-dismissible mt-2">
    					<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    					<strong>Success!</strong> ${successMsg}
  					</div>
				</c:if>
			</div>
			
			
		</div>
		<div class="row">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="text-center">Full name</th>
						<th class="text-center">Mobile</th>
						<th class="text-center">Email</th>
						<th class="text-center">Salary</th>
						<th class="text-center">Edit</th>
						<th class="text-center">Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${employees}" var="employee">
						<tr>
							<td class="text-center">${employee.getName()}</td>
							<td class="text-center">${employee.getMobile() }</td>
							<td class="text-center">${employee.getEmail()}</td>
							<td class="text-center">${employee.getSalary()}&nbsp;&nbsp;INR/-</td>
							<td class="text-center"><a id="updateEmployee" onclick="updateBox(${employee.getId()})" href="#" class="btn btn-info  btn-md"> <span
									class="glyphicon glyphicon-edit"></span> Edit
							</a></td>

							<td class="text-center"><a onclick="Confirm(${employee.getId()},'${employee.getName()}');" href="#" class="btn btn-denger btn-md"> <span
									class="glyphicon glyphicon-trash"></span> Delete
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- Pagination Start -->
				<div class="text-center">
							<ul class="pagination pagination-md">
				<c:choose>
					<c:when test="${currentPage==totalPage}">
						<li class=" page-item disabled "><a class=" text-center page-link " href="/employeeList?currentPage=${currentPage+1}"> <span class="glyphicon glyphicon-forward"></span>Next</a></li>
					</c:when>		
					<c:when test="${currentPage!=totalPage}">
						<li class="page-item "><a class="text-center page-link " href="/employeeList?currentPage=${currentPage+1}"> <span class="glyphicon glyphicon-forward"></span>Next</a></li>
					</c:when>		
				</c:choose>	
  
  				<c:forEach var="page" begin="1" end="${totalPage}">
  					<c:choose>
  						<c:when test="${page==currentPage}">
  						 	<li class="page-item active text-center"><a class="text-center page-link" href="/employeeList?currentPage=${page}" >${page}</a></li>
  						</c:when>
  						<c:when test="${page!=currentPage}">
  							 <li class="page-item "><a class="text-center page-link" href="/employeeList?currentPage=${page}" >${page}</a></li>
  						</c:when>
  					</c:choose>
  				</c:forEach>
 
  				<c:choose>
  					<c:when test="${currentPage>1}">
  						<li class="page-item"><a class="page-link text-center "href="/employeeList?currentPage=${currentPage-1}" >  <span class="glyphicon glyphicon-backward"></span>&nbsp;&nbsp;Back</a></li>
  					</c:when>
  					<c:when test="${currentPage==1}">
  						<li class="disabled  page-item"><a class="text-center page-link " href="/employeeList?currentPage=${currentPage-1}">  <span class="glyphicon glyphicon-backward"></span>&nbsp;&nbsp;Back</a></li>
  					</c:when>
  				</c:choose>
			</ul>
			</div>
			<!-- Pagination End -->
		</div>
	</div>
	
	
	<!-- Modal starts -->
	
	<div class="modal" id="deleteConfirmationBox">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title" style="text-align: center; color: red;">Delete Employee</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Are you sure to delete <span id='name'>this</span> record??
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-light" data-bs-dismiss="modal">No</button>
          <a id="deleteButton" type="button"  class="btn btn-danger">Yes</a>
        </div>
        
      </div>
    </div>
  </div>
	<!-- Modal ends -->	
</body>
</html>