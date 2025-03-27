
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home - Student Management</title>
<style>
li {
	font-weight: bold;
}
.user {
	font-weight: bold;
	color: yellow;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background: #f8f9fa;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: #007bff;
	padding: 15px;
	color: white;
}

.navbar a {
	color: white;
	text-decoration: none;
	margin: 0 15px;
	font-weight: bold;
}

.navbar a i {
	margin-right: 8px;
	font-size: 18px;
}

.navbar a:hover {
	text-decoration: underline;
}

.hero {
	text-align: center;
	padding: 80px 20px;
	background: url('school.png') no-repeat center/cover;
	color: white;
}

.hero h1 {
	font-size: 40px;
	background: rgba(0, 0, 0, 0.6);
	padding: 10px;
	display: inline-block;
}

.section {
	text-align: center;
	padding: 50px;
	background: white;
	margin: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}
.section:hover, .section1:hover {
    transform: scale(1.05); /* Slightly enlarges the section */
    transition: transform 0.3s ease-in-out; /* Smooth animation */
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2); /* Enhances the effect */
}
.section1 {
	text-align: center;
	color:white;
	padding: 25px;
	background: #343a40;
	margin: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.btn {
	display: inline-block;
	margin: 10px;
	padding: 10px 20px;
	background: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none;
}

.btn:hover {
	background: #218838;
}

.footer {
	background: black;
	color: white;
	text-align: center;
	padding: 15px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="navbar">
		<div>
			<a href="home.jsp"><i class="fas fa-home"></i>Home</a> <a
				href="studentdetails.jsp"><i class="fas fa-home"></i>Student
				Details</a>

		</div>
		<div class="user">
			Welcome:
			<%=session.getAttribute("username") != null ? session.getAttribute("username") : "Guest"%>
			<a href="login.jsp">Logout</a>
		</div>

	</div>
	<div class="hero">
		<h1>Welcome to Our School Management System</h1>
		<p>Manage student attendance and records efficiently.</p>
	</div>
	<div class="section">
		<h2>Student Management</h2>
		<p>View and manage student records with ease.</p>
		<a href="studentdetails.jsp" class="btn">View Students</a>
	</div>
	<div class="section1">
    <h2>About Our School</h2>
    <div style="display: flex; justify-content: space-between; text-align: left; padding: 20px;">
        <ul style="width: 45%; list-style-type: square;">
           	<li>Student-centered learning environment</li>
            <li>Regular assessments and personalized feedback</li>
            <li>Strong parent-teacher collaboration for growth</li>
        </ul>
        <ul style="width: 45%; list-style-type: square;">
             <li>Experienced and dedicated teaching staff</li>
            <li>Smart classrooms with digital learning facilities</li>
            <li>Strong focus on extracurricular activities</li>
        </ul>
    </div>
</div>

	<div class="section">
		<h2>Contact Us</h2>
		<p>Email: school@contact.com | Phone: +91 9876543210</p>
	</div>
	<div class="footer">
		<p>© 2025 Government School. All rights reserved.</p>
	</div>
</body>
</html>
