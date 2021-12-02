<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_css_js.jsp"%>
<title>Add Notes</title>
</head>
<body>

	<div class="container">
		<%@ include file="navbar.jsp"%>
		<h1>Please fill your note details..!</h1>
	</div>
	<br>
	


	<!-- This is for the addForm -->

	<br>
	<div class="container">
		<form action="SaveNoteServlet" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input required
					name="title" type="text" class="form-control" id="title"
					aria-describedby="Enter here." />
			</div>

			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea required name="content" id="content"
					placeholder="Enter your content here." class="form-control"
					style="height: 200px"></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>


</body>
</html>