<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_css_js.jsp"%>
<title>Edit Note</title>
</head>
<body>
	<div class="container">
		<%@ include file="navbar.jsp"%>
		<h1>Please Edit your note..!</h1>
	</div>
	<br>
	<%
	int noteID = Integer.parseInt(request.getParameter("note_id").trim());
	Session s = FactoryProvider.getFactory().openSession();
	Note n = (Note) s.get(Note.class, noteID);
	%>
	<div class="container">
		<form action="UpdateServlet" method="post">
		
			<input type="hidden" name="noteID" value="<%=n.getId()%>"/>
		
			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input required
					name="title" type="text" class="form-control" id="title"
					aria-describedby="Enter here." value="<%=n.getTitle()%>" />
			</div>

			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea required name="content" id="content"
					placeholder="Enter your content here." class="form-control"
					style="height: 200px"><%=n.getContent() %></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save changes</button>
			</div>
		</form>
	</div>

</body>
</html>