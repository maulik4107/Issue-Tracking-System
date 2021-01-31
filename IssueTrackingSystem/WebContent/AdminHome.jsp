<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin Home</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
<% String CreateMsg=(String)request.getAttribute("message"); %>
<% String allocateMessage=(String)request.getAttribute("msg"); %>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="adminsidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/buglogof.png); background-repeat: no-repeat; background-position: center; background-size: 550px;">
					<%if(CreateMsg!=null) {%>
					<h1><%=CreateMsg%></h1>
					<%} %>
					
					<%if(allocateMessage!=null) {%>
					<h1><%=allocateMessage%></h1>
					<%} %>
					
				</div>
			</div>
		</div>
	</div>
<%@include file="commonjspluggins.jsp"%>
</body>
</html>