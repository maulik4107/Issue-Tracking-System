<%@page import="com.issuetracker.bean.User"%>
<%@page import="com.issuetracker.bean.ActiveUsers"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>View Testers</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<%
		int cnt = 0;
	%>
	<%
		List<User> testers = (List) request.getAttribute("testersDetails");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="projectmanagersidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/buglogof.png); background-repeat: no-repeat; background-position: center; background-size: 550px;">

					<h1 class="h3 mb-2 text-gray-800">Issue Tracking System</h1>
					<p class="mb-4">Tester Details</p>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0" style="border: black;">
								<thead>
									<tr>
										<th>Sr No.</th>
										<th>Tester Name</th>
										<th>Contact</th>
										<th>Area Name</th>
										<th>Email</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (User user : testers) {
									%>
									<%
										cnt = cnt + 1;
									%>
									<tr>
										<td style="color: white"><%=cnt%></td>
										<td style="color: white"><%=user.getUserName()%></td>
										<td style="color: white"><%=user.getUserContact()%></td>
										<td style="color: white"><%=user.getAreaName()%></td>
										<td style="color: white"><%=user.getUserEmail()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>