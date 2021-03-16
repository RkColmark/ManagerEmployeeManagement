<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<style>
input[type=text], select {
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

div {
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

	<h3>Update the Employee Details</h3>

	<div>
		<form:form action="saveEmployee" modelAttribute="employee"
			method="POST">
	
	
		< <form:hidden path="id" />
			<table>
				<tbody>
					<tr>
						<td><label>First Name</label></td>
						<td><form:input path="firstname" /></td>
					</tr>

					<tr>
						<td><label>Last Name</label></td>
						<td><form:input path="lastname" /></td>
					</tr>
					<tr>
						<td><label>Address</label></td>
						<td><form:textarea path="address" /></td>
					</tr>
					<tr>
						<td><label>Mobile</label></td>
						<td><form:input path="mobile" /></td>
					</tr>

					<tr>
						<td><label>Date Of Birth</label></td>
						<td><form:input path="DOB" id="Date" /></td>
					</tr>


					<tr>
						<td><label>City</label></td>
						<td><form:input path="city" /></td>
					</tr>

					<tr>
						<td><label>Add</label></td>
						<td><input type="submit" class="btn btn-success"></td>
					</tr>

				</tbody>
			</table>


		</form:form>

	</div>

</body>
</html>
