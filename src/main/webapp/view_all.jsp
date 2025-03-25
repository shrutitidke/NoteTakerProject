<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All notes : Note Taker</title>
<%@include file="all_js_css_files.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
</head>
<body>
	<div class=container>
		<%@include file="NavBar.jsp"%>
		<br>
		<h1>ALL NOTES:</h1>

		<%
		Session s = FactoryProvider.getFactory().openSession();
		List<Note> notes = s.createQuery("from Note", Note.class).list();
		Iterator<Note> iterator = notes.iterator();
		while (iterator.hasNext()) {
			Note note = iterator.next();
		%>
		<div class="col-md-12">
			<%-- 3 cards per row --%>
			<div class="card shadow-lg mb-4">
				<div class="card-body">
					<i class="fa-solid fa-clipboard fa-2x" style="max-width: 200px"></i>
					<p class="card-text"><%=note.getAddedDate()%></p>
					<h5 class="card-title"><%=note.getTitle()%></h5>
					<p class="card-text"><%=note.getContent()%></p>

					<div class="container text-center">
						<a href="view_note.jsp?noteId=<%=note.getId()%>"
							class="btn btn-primary">View</a> 
						<a href="DeleteServlet?noteId=<%=note.getId()%>"
							class="btn btn-danger">Delete</a> 
						<a href="update_note.jsp?noteId=<%=note.getId()%>"
						    class="btn btn-secondary">Update</a>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		s.close();
		%>
	</div>

</body>
</html>