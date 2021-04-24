<%@page import="com.issuetracker.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin Home</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="se-pre-con"></div>
	<%
		String create = (String) request.getAttribute("message");
	%>

	<%
		String remove = (String) request.getAttribute("remove");
	%>

	<%
		String update = (String) request.getAttribute("update");
	%>

	<%
		String allocate = (String) request.getAttribute("allocate");
	%>

	<%
		String profile = (String) request.getAttribute("msg");
	%>

	<%
		String pmsg = (String) request.getAttribute("pmsg");
	%>

	<%
		String moduleUpdate = (String) request.getAttribute("updateMessage");
	%>

	<%
		String editIssue = (String) request.getAttribute("Editmsg");
	%>

	<%
		String email = (String) request.getAttribute("email");
	%>
	<%
		HttpSession session1 = request.getSession(false);
	User u = (User) session1.getAttribute("user");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="adminsidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="header-wrapper">
						<div class="zoominheader">
							<div class="zoomoutheader">
								<section id="hero">
									<div class="hero container">
										<%if(email==null && editIssue==null && create==null && moduleUpdate==null && remove==null && update==null && allocate==null &&pmsg==null && profile==null){ %>
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
											if (create != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=create%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (remove != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=remove%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (update != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=update%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (allocate != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=allocate%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (profile != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=profile%><span></span>
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
											if (moduleUpdate != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=moduleUpdate%><span></span>
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