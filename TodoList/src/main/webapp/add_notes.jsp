<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="alljscss.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="Navbar.jsp"%>
		<br>
		<h1>Please fill your Note Details</h1>


		<!--add forms  -->
		<form action="SaveNoteSevlet" method="post">
			<div class="form-group">
				<label for="title ">Note Title </label> <input required type="text"
					name="title" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>

				<textarea required id="content" name="content"
					placeholder="enter your Content here" class="form-control"
					style="height: 300px;"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>

		</form>

	</div>
</body>
</html>