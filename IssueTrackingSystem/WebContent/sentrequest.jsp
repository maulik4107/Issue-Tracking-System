<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Request Pending Page </title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex  error-page bg-info">

				<%
					String uname = (String)request.getAttribute("uname");
				%>
				<div class="text-white"
					style="text-align: center; margin-top: 200px; margin-left: 50px;">

					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: white; text-align: center;">
							Hello,
							<%=uname%>
							Your registration request has been sent successfully !!!
						</h2>
					</marquee>
					<br>
					<br>
					<h4
						style="font-size: 30px; font-style: italic; font-family: Apple; color: white; text-align: center;">You
						will get an email when your request gets accepted by Admin.</h4>
					<br>
					<a
						style="font-size: 20px; font-style: italic; font-family: Apple; color: white; text-align: center;"
						href="index.jsp">Back to home</a>

				</div>
			</div>
		</div>
	</div>
<%@include file="commonjspluggins.jsp"%>
</body>
</html>