<!-- Login Page -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<style>
.error-message:empty {
	display: none;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background: #f4f4f4;
}

.container {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 400px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}
label {
            font-weight: bold;
        }

.form-group {
	margin-bottom: 15px;
}

input {
	width: 100%;
	padding: 8px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.btn {
	width: 100%;
	padding: 10px;
	background: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn:hover {
	background: #0056b3;
}

.register-link {
	text-align: center;
	margin-top: 10px;
}

.register-link a {
	text-decoration: none;
	color: #28a745;
}

.register-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Login</h2>

		<%
		String loginError = (String) request.getAttribute("loginError");
		%>
		<%
		if (loginError != null) {
		%>
		<p class="error-message"><%=loginError%></p>
		<%
		}
		%>

		<form action="LoginServlet" method="post"
			onsubmit="return validateForm()" novalidate>
			<div class="form-group">
				<label for="username">Username</label> <input type="text"
					id="username" name="username">
				<%
				String usernameError = (String) request.getAttribute("username");
				%>
				<p id="usernameError" class="error-message">
					<%
					if (usernameError != null && !usernameError.isEmpty()) {
					%>
					<%=usernameError%>
					<%
					}
					%>
				</p>
			</div>

			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password">
				<%
				String passwordError = (String) request.getAttribute("password");
				%>
				<p id="passwordError" class="error-message">
					<%
					if (passwordError != null && !passwordError.isEmpty()) {
					%>
					<%=usernameError%>
					<%
					}
					%>
				</p>
			</div>

			<button type="submit" class="btn">Login</button>
		</form>


		<div class="register-link">
			<p>
				Don't have an account? <a href="index.html">Register here</a>
			</p>
		</div>
	</div>

	<script>
		function validateForm() {
			let username = document.getElementById("username").value.trim();
			let password = document.getElementById("password").value.trim();
			let usernameError = document.getElementById("username");
			let passwordError = document.getElementById("password");
			let isValid = true;

			usernameError.innerText = "";
			passwordError.innerText = "";

			if (username === "") {
				usernameError.innerText = "*Required";
				isValid = false;
			}

			if (password === "") {
				passwordError.innerText = "*Required";
				isValid = false;
			}

			return isValid;
		}

		document.getElementById("username").addEventListener("input",
				function() {
					document.getElementById("usernameError").innerText = "";
				});

		document.getElementById("password").addEventListener("input",
				function() {
					document.getElementById("passwordError").innerText = "";
				});
	</script>
</body>
</html>

