<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="all_js_css_files.jsp"%>
<title>Add Notes</title>
</head>
<body>
	<div class="container">
		<%@include file="NavBar.jsp"%>
		<br>

		<h1>Please fill your note details</h1>


		<!-- this is add form -->
		<form action="SaveNoteServlet" method="post">
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">Note Title</label> 
				<input required type="text" class="form-control" name="title" id="exampleFormControlInput1">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1"class="form-label">Note Content</label>
				<textarea class="form-control" name="content" id="exampleFormControlTextarea1"rows="3"></textarea>
			</div>
			<div class="container text-center">
			<button type="submit" class="btn btn-primary mb-3">Add</button>
			</div>
		</form>
	</div>




</body>
</html>
