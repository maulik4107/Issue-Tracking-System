<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Blank page</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<%
		String message = (String) request.getAttribute("msg");
	%>
	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.jsp -->
		<%@include file="_navbar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<%@include file="adminsidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div
						class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
						<div class="row w-100">
							<div class="col-lg-4 mx-auto">

								<%
									if (message != null) {
								%>
								<marquee scrolldelay="10" direction="down" scrollamount="5"
									behavior="slide">
									<h3
										style="font-size: 50px; font-style: italic; font-family: Apple; color: darkblue; text-align: center; font-weight: bold;"><%=message%></h3>
								</marquee>
								<%
									}
								%>


								<p class="footer-text text-center"
									style="color: black; font-weight: bolder;">copyright © 2020
									Issue Tracker. All rights reserved.</p>
								<p class="footer-text text-center text-center">
									<a href="AdminHome.jsp" target="_blank"
										style="color: black; font-weight: bolder;">Back</a>
								</p>
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