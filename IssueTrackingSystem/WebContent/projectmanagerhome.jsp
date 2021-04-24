<%@page import="com.issuetracker.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Project Manager Home</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="se-pre-con"></div>
	<%
		String updateMessage = (String) request.getAttribute("updateMessage");
	%>
	<%
		String deletedModule = (String) request.getAttribute("deleteMessage");
	%>
	<%
		String message1 = (String) request.getAttribute("message1");
	%>
	<%
		String msg = (String) request.getAttribute("msg1");
	%>
	<%
		HttpSession session1 = request.getSession(false);
	User u = (User) session1.getAttribute("pm");
	%>
	<%
		String profile = (String) request.getAttribute("msg");
	%>
	<%
		String pmsg = (String) request.getAttribute("pmsg");
	%>
	<%
		String module = (String) request.getAttribute("CreateModule");
	%>
	<%
		String editIssue = (String) request.getAttribute("Editmsg");
	%>
	<%
		String email = (String) request.getAttribute("email");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="projectmanagersidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="header-wrapper">
						<div class="zoominheader">
							<div class="zoomoutheader">
								<section id="hero">
									<div class="hero container">
										<%
											if (email == null && editIssue == null && profile == null && msg == null && module == null && message1 == null
												&& pmsg == null && deletedModule == null && updateMessage == null) {
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
											if (updateMessage != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=updateMessage%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (deletedModule != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=deletedModule%><span></span>
										</h1>
										<%
											}
										%>
										<br>
										<%
											if (message1 != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=message1%><span></span>
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
											if (module != null) {
										%>
										<h1
											style="font-size: 40px; margin-bottom: 400px; margin-left: 20px;">
											<%=module%><span></span>
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