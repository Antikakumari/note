<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes:NoteTaker</title>

<%@include file="allcss.jsp"%>
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%><br>
		<h1 class="text-uppercase">*****Your Notes Are****</h1>

		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();

				for (Note note : list) {
				%>

				<div class="card mt-3">
					<img class="card-img-top m-3 mx-auto" style="max-width: 100px;"
						src="img/image.jpeg" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>


						<p class="text-primary"><b>
							<%=note.getAddedDate()%></p></b>

						<div class="container text-center m-2">
							<a href="DeleteServlet?note_id=<%=note.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary">Update</a>

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