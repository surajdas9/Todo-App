<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entites.Todo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>All Notes</title>
<%@include file="alljscss.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="Navbar.jsp"%>
		<h1>All Notes</h1>

		<div class="row">
			<div class="col-12">


				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Todo");
				List<Todo> list = q.list();
				for (Todo todo : list) {
				%>
				<div class="card mt-3">
					<img class="card-img-top m-4" style="max-width: 100px" src="img/notepad.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=todo.getTitle() %></h5>
						<p class="card-text"><%=todo.getContent() %></p>
						<a href="DeleteSevlet?note_id=<%=todo.getId() %>" class="btn btn-danger">Delete</a>
						<a href="editjsp.jsp?note_id=<%=todo.getId() %>" class="btn btn-primary">Update</a>
					</div>
				</div>

				<%
				}
				s.close();
				%>

			</div>

		</div>


	</div>
</body>
</html>