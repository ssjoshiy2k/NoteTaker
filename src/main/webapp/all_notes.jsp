<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_css_js.jsp"%>
<title>All Notes</title>
</head>
<body>

	<div class="container">
		<%@ include file="navbar.jsp"%>
		<br>
		<h1 clas="text-uppercase">All Notes :</h1>
		<br>


		<div class="row">
			<div class="col-sm-6">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();

				for (Note note : list)
				{
				%>

				<div class="card mt-3" >
					<img src="img/notes.png" style="max-width:100px;" class="card-img-top m-4" alt="...">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle() %></h5>
						<p class="card-text"><%=note.getContent() %></p>
						<div class="container text-center">
							<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
							<a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete Note</a>
						</div>
						
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