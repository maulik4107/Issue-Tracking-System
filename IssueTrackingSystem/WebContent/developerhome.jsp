<%@page import="com.issuetracker.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Developer Home</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="se-pre-con"></div>
	<%
		HttpSession session1 = request.getSession(false);
	User u = (User) session1.getAttribute("developer");
	%>
	<%
		String editp = (String) request.getAttribute("msg");
	%>
	<%
		String pmsg = (String) request.getAttribute("pmsg");
	%>
	<%
		String updateStatusMessage = (String) request.getAttribute("statusMessage");
	%>
	<%
		String email = (String) request.getAttribute("email");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="developersidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="header-wrapper">
						<div class="zoominheader">
							<div class="zoomoutheader">
								<section id="hero">
									<div class="hero container">
										<%
											if (email == null && editp == null && pmsg == null && updateStatusMessage == null) {
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
											if (editp != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=editp%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (pmsg != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=pmsg%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (updateStatusMessage != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=updateStatusMessage%><span></span>
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