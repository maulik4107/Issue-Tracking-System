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
				<div class="content-wrapper"
					style="background-image: url(pages/samples/pic1.jpg); background-repeat: no-repeat; background-position: center; background-size: 1200px;">

					<%
						if (email==null && editp == null && pmsg == null && updateStatusMessage == null) {
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
						if (editp != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">

							<%=editp%>
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
						if (updateStatusMessage != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">

							<%=updateStatusMessage%>
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