<!doctype html>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="all_js_css_files.jsp"%>
<title>Add Notes</title>
</head>
<body>

<%
    int noteId = Integer.parseInt(request.getParameter("noteId"));

    Session s = FactoryProvider.getFactory().openSession();
    Note note = s.get(Note.class, noteId);
    s.close();
%>
	<div class="container">
		<%@include file="NavBar.jsp"%>
		<br>
		<h1>Edit note</h1>
		<form action="UpdateServlet" method="post">
		<input type="hidden" name=noteId value="<%=note.getId() %>">
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">Note Title</label> 
				<input required type="text" class="form-control" name="title" value="<%=note.getTitle() %>" id="exampleFormControlInput1">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1"class="form-label">Note Content</label>
				<textarea class="form-control" name="content"  id="exampleFormControlTextarea1" rows="3"><%=note.getContent() %></textarea>
			</div>
			<div class="container text-center">
			<button type="submit" class="btn btn-primary mb-3 m-3">Update note</button>
			<a href="view_note.jsp" class="btn btn-secondary">Cancel</a>
			</div>
		</form>
	</div>




</body>
</html>
