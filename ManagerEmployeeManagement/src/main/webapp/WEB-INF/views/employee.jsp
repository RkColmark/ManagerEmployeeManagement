<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>

<head>
<title>Employees List</title>

<!-- reference our style sheet -->

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
html, body {
	margin-left: 15px;
	margin-right: 15px;
	padding: 0px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

table {
	border-collapse: collapse;
	border-bottom: 1px solid gray;
	font-family: Tahoma, Verdana, Segoe, sans-serif;
	width: 72%;
}

th {
	border-bottom: 1px solid gray;
	background: none repeat scroll 0 0 #09c332;
	padding: 10px;
	color: #FFFFFF;
}

tr {
	border-top: 1px solid gray;
	text-align: center;
}

tr:nth-child(even) {
	background: #FFFFFF
}

tr:nth-child(odd) {
	background: #BBBBBB
}

#wrapper {
	width: 100%;
	margin-top: 0px;
}

#header {
	width: 70%;
	background: #09c332;
	margin-top: 0px;
	padding: 15px 0px 15px 15px;
}

#header h2 {
	width: 100%;
	margin: auto;
	color: #FFFFFF;
}

#container {
	width: 100%;
	margin: auto
}

#container h3 {
	color: #000;
}

#container #content {
	margin-top: 20px;
}

.add-button {
	border: 1px solid #666;
	border-radius: 5px;
	padding: 4px;
	font-size: 12px;
	font-weight: bold;
	width: 120px;
	padding: 5px 10px;
	margin-bottom: 15px;
	background: #cccccc;
}
/* #button {
     line-height: 12px;
     width: 18px;
     font-size: 8pt;
     font-family: tahoma;
     margin-top: 1px;
     margin-right: 2px;
     position:absolute;
     top:0;
     right:0;
 } */
.topright {
	position: absolute;
	top: 8px;
	right: 100px;
	font-size: 18px;
}

.toprightlogout {
	position: absolute;
	top: 8px;
	right: 16px;
	font-size: 28px;
}

<
style>input[type=text] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.modal-body {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>
<script type="text/javascript"
	src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
<script type="text/javascript"
	src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
<link rel="stylesheet"
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
	media="screen" />
<!-- Bootstrap -->
<!-- Bootstrap DatePicker -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css"
	type="text/css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"
	type="text/javascript"></script>
<!-- Bootstrap DatePicker -->
<script type="text/javascript">
        $(function () {
            $('#Date').datepicker({
                format: "dd/mm/yyyy"
            });
        });
    </script>

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>Here You can see the list of Employees</h2>
		</div>
	</div>

	<div id="container">

		<div id="content">







			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Date Of Birth</th>
					<th>Mobile Number</th>
					<th>Address</th>
					<th>City</th>

				</tr>

				<!--   loop over and print our customers -->
				<c:forEach var="temp" items="${employees}">

					<c:url var="updateLink" value="/employee/showUpdate">
						<c:param name="id" value="${temp.id }" />
					</c:url>

					<c:url var="deletelink" value="/employee/delete">
						<c:param name="id" value="${temp.id }" />
					</c:url>


					<tr>
						<td>${temp.firstname}</td>
						<td>${temp.lastname}</td>
						<td><fmt:formatDate value="${temp.DOB}" pattern="dd/MM/yyyy" /></td>
						<td>${temp.mobile}</td>
						<td>${temp.address}</td>
						<td>${temp.city}</td>
						<td><a href="${updateLink}">Update</a> | <a
							href="${deletelink}"
							onclick="return confirm('Are you sure you want to delete this Employee?')">Delete</a></td>






					</tr>

				</c:forEach>

			</table>

		</div>

	</div>

	<!-- - -->



	<div class="container">
		<div class="topright">
			<!-- Trigger the modal with a button -->
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
				data-target="#myModal">Add Employee</button>

		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Please Add Employee Details</h4>
					</div>
					<div class="modal-body">



						<form:form action="saveEmployee" modelAttribute="employee"
							method="POST">

							<form:hidden path="id" />

							<label>First Name</label>
							<br>
							<form:input path="firstname" placeholder="First Name" />
							<br>

							<label><b>Last Name</b></label>
							<br>
							<form:input path="lastname" placeholder="Last Name" />
							<br>

							<label>Address</label>
							<br>
							<form:textarea path="address" placeholder="Address" />
							<br>

							<label for="Date">Date</label>
							<br>
							<form:input path="DOB" placeholder="Date" id="Date" />
							<br>

							<label for="Mobile"><b>Mobile Number</b></label>
							<br>
							<form:input path="mobile" pattern="[0-9]{10}"
								placeholder="Mobile Number..." />
							<br>

							<label>City</label>
							<br>
							<form:input path="city" placeholder="city" />
							<br>

							<input type="submit" value="Submit">
						</form:form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

	</div>

	<form class="form-inline my-2 my-lg=0" method="post" action="/logout">
		<div class=toprightlogout>
			<button class="btn btn-outline-danger" type="submit">Logout</button>
		</div>
	</form>
</body>

</html>









