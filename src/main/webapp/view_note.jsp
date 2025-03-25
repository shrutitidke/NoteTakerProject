<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Note"%>
<%@page import="java.io.IOException"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Note</title>
    <%@include file="all_js_css_files.jsp"%>
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
        <h1><%= note.getTitle() %></h1>
        <p><%= note.getContent() %></p>
        <a href="view_all.jsp" class="btn btn-secondary">Back</a>
    </div>
</body>
</html>
