
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />


<style>
form {
	margin-top: 10px;
}

label {
	font-size: 16px;
	width: 100px;
	display: block;
	text-align: right;
	margin-right: 10px;
	margin-top: 8px;
	margin-bottom: 8px;
}

input {
	width: 250px;
	border: 1px solid #666;
	border-radius: 5px;
	padding: 4px;
	font-size: 16px;
}

.save {
	font-weight: bold;
	width: 130px;
	padding: 5px 10px;
	margin-top: 30px;
	background: #cccccc;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
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

<!-- <script>
	$('#date').datepicker({
		format : 'dd/mm/yyyy'
	});
</script>
 -->
<body>
	<div class="jumbotron">
		<h1 class="display-3">Welcome to Employee Management Portal</h1>
		<p class="lead">Here You can save Employee Details and Keep a
			track of that.</p>
		<hr class="my-4">
		<p>Please fill the Form Below.</p>

	</div>

	<div class="container">
		<form:form action="/manager/save" modelAttribute="manager"
			method="POST">

			<form:hidden path="id" />

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
						<td><label>Email</label></td>
						<td><form:input path="email"
								pattern="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$" type="email" /></td>
						<%-- <td><form:input path="email" /></td> --%>
					</tr>
					<tr>
						<td><label>Password</label></td>
						<td><form:input path="password" type="password" /></td>
					</tr>
					<tr>
						<td><label>Address</label></td>
						<td><form:textarea path="address" /></td>
					</tr>
					<tr>
						<td><label>Date Of Birth</label></td>
						<td><form:input path="DOB" id="Date" /></td>
					</tr>


					<tr>
						<td><label>Company</label></td>
						<td><form:input path="company" /></td>
					</tr>

					<tr>
						<td><label>Add</label></td>
						<td><input type="submit" class="btn btn-success"></td>
					</tr>

				</tbody>
			</table>


		</form:form>

		<form>
			<a href="/manager/login" class="btn btn-primary btn-lg">Login</a>

		</form>
	</div>
</body>
</html>