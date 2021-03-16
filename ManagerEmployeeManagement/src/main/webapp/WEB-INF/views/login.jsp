
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<title>Login Page</title>

<!-- <style>
		.failed {
			color: red;
		}
		
	</style> -->

<style>
input {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	border: 2px solid green;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100%;
	background-color: #4CAF52;
	align: center;
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

.header {
	padding: 60px;
	text-align: center;
	background: #1abc9c;
	color: black;
	font-size: 30px;
}
</style>

</head>

<body>

	<div class="header">
		<h3>Login</h3>
	</div>

	<form:form action="/manager/login" method="POST">

		<!-- Check for login error -->

		<c:if test="${param.error != null}">

			<i class="failed">Sorry! You entered invalid username/password Or
				Your are not register user please register with us</i>

		</c:if>

		<p>
			User name: <input type="text" name="username" />
		</p>

		<p>
			Password: <input type="password" name="password" />
		</p>

		<div>
			<input type="submit" value="login" />
		</div>

	</form:form>

	<form>
		<a href="/manager/signup" class="btn btn-primary btn-lg">SignUp</a>
	</form>
</body>

</html>



<!-- href="/login" -->








