<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Issue Tracking System</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="se-pre-con"></div>
	<%
		HttpSession session1 = request.getSession(false);
	User u = (User) session1.getAttribute("tester");
	%>
	<%
		String msg = (String) request.getAttribute("msg");
	%>
	<%
		String issueFoundMsg = (String) request.getAttribute("msgissuefound");
	%>
	<%
		String editIssue = (String) request.getAttribute("editissue");
	%>
	<%
		String email = (String) request.getAttribute("email");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<%@include file="testersidebar.jsp"%>
			</nav>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="header-wrapper">
						<div class="zoominheader">
							<div class="zoomoutheader">
								<section id="hero">
									<div class="hero container">
										<%
											if (email == null && msg == null && issueFoundMsg == null && editIssue == null) {
										%>
										<h1 style="font-size: 70px; margin-bottom: 400px;">
											Welcome<span></span>
										</h1>
										<h1
											style="font-size: 70px; margin-bottom: 400px; margin-left: 20px;">
											Mr.<span></span>
										</h1>
										<h1
											style="font-size: 70px; margin-bottom: 400px; margin-left: 20px;">
											<%=u.getUserName()%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (msg != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=msg%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (issueFoundMsg != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=issueFoundMsg%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (editIssue != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=editIssue%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (email != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=email%><span></span>
										</h1>
										<%
											}
										%>
									</div>
								</section>
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