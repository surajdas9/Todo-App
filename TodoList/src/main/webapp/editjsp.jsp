<%@page import="com.entites.Todo"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="alljscss.jsp"%>
</head>
<body>
<div class="container-fluid p-0 m-0">
   <%@include file="Navbar.jsp" %>
   <h1>Edit Your Note</h1>
   
   <%
   int noteId=Integer.parseInt(request.getParameter("note_id").trim());
   Session s= FactoryProvider.getFactory().openSession();
	Todo todo=(Todo)s.get(Todo.class, noteId);
   %>
   <form action="UpdateServlet" method="post">
   <input value="<%=todo.getId()%>" name="noteId" type="hidden">
			<div class="form-group">
				<label for="title ">Note Title </label> <input required type="text"
					name="title" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here"
				 value="<%=todo.getTitle()%>">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>

				<textarea required id="content" name="content"
					placeholder="enter your Content here" class="form-control"
					style="height: 300px;"><%=todo.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Update</button>
			</div>

		</form>
   
   </div>
</body>
</html>