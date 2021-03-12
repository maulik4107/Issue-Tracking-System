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
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="projectmanagersidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/pic1.jpg); background-repeat: no-repeat; background-position: center; background-size: 1200px;">

					<%
						if (editIssue==null && profile == null && msg==null && module == null && message1 == null && pmsg == null && deletedModule == null && updateMessage == null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							Welcome Mr.
							<%=u.getUserName()%>
						</h2>
					</marquee>
					<%
						}
					%>

					<%
						if (profile != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=profile%>
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

					<%
						if (module != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=module%>
						</h2>
					</marquee>
					<%
						}
					%>
					<%
						if (updateMessage != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=updateMessage%>
						</h2>
					</marquee>
					<%
						}
					%>
					<%
						if (message1 != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=message1%>
						</h2>
					</marquee>
					<%
						}
					%>
					<%
						if (pmsg != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=pmsg%>
						</h2>
					</marquee>
					<%
						}
					%>
					<%
						if (deletedModule != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=deletedModule%>
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
				</div>
			</div>
		</div>
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>