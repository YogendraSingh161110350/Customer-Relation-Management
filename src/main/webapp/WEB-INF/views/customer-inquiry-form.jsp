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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<script type="text/javascript">
	
		$('document').ready(function()
		{		
			$('#phone').keyup(function(){
				let phone = $(this).val();
				$.ajax({
					url:"/checkPhoneNumber",
					dataType:'json',
					data:{phoneNumber:phone},
					success:function(response)
					{
						let status = response.status;
						if(status==='exist')
						{
							$('#name').val(response.name);
							$('#name').prop('disabled',true)
							$('#getHistory').show();		
						}
						else
						{
							$('#getHistory').hide();
							$('#name').prop('disabled',false);
						}		
					}
				});
			});
			$('#status').on('change',function(){
				if($('#status').val()==="ON")
				{
					$('#date').prop('disabled',false);
				}
				else
				{
					$('#date').prop('disabled',true);					
				}
			});
		});
	  function history()
	  {
		  let phone = $('#phone').val();
		  window.location.href="/inqueryList?phone="+encodeURIComponent(phone);
	  }
	</script>


</head>
<body style="background-color:#FFFFFF" >
	<jsp:include page="employee-header.jsp" />
	
	<c:if test="${not empty successMsg}">
		<div class=" mt-0 alert alert-success alert-dismissible">
    		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    		<strong>Success !</strong> ${successMsg}
  		</div>
	</c:if>
	<c:if test="${not empty failMsg}">
		 <div class=" mt-0 alert alert-danger alert-dismissible">
    		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    		<strong>Opps Failed!</strong> ${failMsg}
  		</div>
	</c:if>
	
    <div class="container mt-0 pb-5"style="background-color:#E4E6EB">
       <h2 class="text-center">INQURY FORM</h2>
       <p class="text-center">THIS INFORMATION NOT BE COMPROMISED..!</p>
       <form:form action="addCustomerInquiry" method="post" modelAttribute="customer">
         <div class="row p-3" >
            <div class="mb-3 mt-3 col">
                <label for="name" class="form-label">Name:</label>
                <div class="input-container">
                    <i class="fa fa-user icon"></i>
                    <form:input class="form-control" id="name" placeholder="Enter name" path="customer.name" />	
                </div>
            </div>
            <div class="mb-3 mt-3 col">
                <label for="name" class="form-label">Phone:</label>
                <div class="input-container">
                    <i class="fa fa-user icon"></i>
                    <form:input  class="form-control" id="phone" placeholder="Enter phone" path="phone" />	
                	<button type="button" onclick="history()" id="getHistory" style="display: none;" class="btn btn-primary">History</button>
                </div>
            </div>
            <div class="mb-3 mt-3 col">
                <label for="name" class="form-label">Interested Course:</label>
                <div class="input-container">
                    <i class="fa fa-user icon"></i>
                  	<form:select path="interestedCourse" cssClass="form-control">
                  		  <form:option value="" label="Select Course" /> <!-- Add a default option -->
                  		  <form:options items="${courses}" cssClass="form-control" id="name" placeholder="Enter name" path="interestedCourse" />	
                  	</form:select> 
                </div>
            </div>  
         </div>

         <div class="row">
            <div class="mb-3 mt-3 col">
                <label for="name" class="form-label">Medium:</label>
                <div class="input-container">
                    <i class="fa fa-user icon"></i>
                    <form:select path="medium" cssClass="form-control">
                    	<form:option value="call">Select Medium</form:option>
                    	<form:option value="call">Call</form:option>
                    	<form:option value="Social Media">Social Media</form:option>
                    	<form:option value="Facebook">Facebook</form:option>
                    	<form:option value="Whatsapp">Whatsapp</form:option>
                    	<form:option value="Instagram">Instagram</form:option>
                    	<form:option value="Banner">Banner</form:option>
                    	<form:option value="Others">Others</form:option>
                    	
                    </form:select>
                </div>
            </div>
            <div class="mb-3 mt-3 col">
                <label for="name" class="form-label">Status:</label>
                <div class="input-container">
                    <i class="fa fa-user icon"></i>
                    <form:select path="status" id="status" cssClass="form-control">
                    	<form:option value="">Select Status</form:option>
                    	<form:option value="ON">ON</form:option>
                    	<form:option value="Not ON">Not ON</form:option>
                    	<form:option value="Interseted">Interseted</form:option>
                    	<form:option value="Close">Close</form:option>	
                    </form:select>
                </div>
            </div>
            <div class="mb-3 mt-3 col">
                <label for="name" class="form-label">FolloupDate:</label>
                <div class="input-container" style="box-sizing: border-box;">
                    <i class="fa fa-user icon"></i>
                    <form:input type="date" class="form-control" id="date" placeholder="select date" path="followUpDate" />	
                </div>
            </div>
         </div>
         <div class="row">
            <div class="mb-3 mt-3 col">
                <label for="name" class="form-label">Caller:</label>
                <div class="input-container">
                    <i class="fa fa-user icon"></i>
                     <form:select path="caller" cssClass="form-control">
                    	<form:option value="ON">Company To Customer</form:option>
                    	<form:option value="Not ON">Customer To Company</form:option>
                    	
                    </form:select>
                </div>
            </div>
        </div>
         <div class="row">
            <div class="mb-3 mt-3 col">
                <label for="name" class="form-label">Discussion:</label>
                <div class="input-container">
                    <form:textarea rows="5" cssClass="form-control" id="name" placeholder="discussion" path="discussion" />	
                </div>
            </div>

          
            <div class="mb-3 mt-3 col">
                <label for="name" class="form-label">Address:</label>
                <div class="input-container"> 
                    <form:textarea rows="5" cssClass="form-control" id="name" placeholder="Enter name" path="customer.address" />	
                </div>
            </div>
         </div>
          <div class="text-center mt-4">
				<button type="submit" class="btn btn-default btn-primary">Submit</button>
		</div>
       </form:form>
     </div>
</body> 
</html>
