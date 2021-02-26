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
					<p class="mb-4">Testers</p>

					<div class="card shadow mb-4">
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Tester
									Details</h6>
							</div>
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
												<td><%=cnt%></td>
												<td><%=user.getUserName()%></td>
												<td><%=user.getUserContact()%></td>
												<td><%=user.getAreaName()%></td>
												<td><%=user.getUserEmail()%></td>
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
		</div>
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>