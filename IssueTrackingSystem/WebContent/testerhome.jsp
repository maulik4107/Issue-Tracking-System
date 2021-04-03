<%@page import="com.issuetracker.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Tester Home</title>
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
			<%@include file="testersidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/pic1.jpg); background-repeat: no-repeat; background-position: center; background-size: 1200px;">

					<%
						if (email==null && msg == null && issueFoundMsg == null && editIssue==null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							Welcome mr.
							<%=u.getUserName()%>
						</h2>
					</marquee>
					<%
						}
					%>

					<%
						if (msg != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=msg%>
						</h2>
					</marquee>
					<%
						}
					%>
					<%
						if (email != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=email%>
						</h2>
					</marquee>
					<%
						}
					%>
					<%
						if (issueFoundMsg != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=issueFoundMsg%>
						</h2>
					</marquee>
					<%
						}
					%>
					<%
						if (editIssue != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=editIssue%>
						</h2>
					</marquee>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>