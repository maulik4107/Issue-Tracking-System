<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Request Pending Page</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="assets/vendors/iconfonts/ionicons/dist/css/ionicons.css">
<link rel="stylesheet"
	href="assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="assets/vendors/css/vendor.bundle.addons.css">
<!-- endinject -->
<!-- inject:css -->
<link rel="stylesheet" href="assets/css/shared/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="assets/images/favicon.ico" />
</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex  error-page bg-info">
			
			<% String uname = (String)request.getAttribute("uname");%>

				<div class="text-white" style="text-align: center; margin-top: 200px; margin-left: 200px;">
				
					<marquee scrolldelay="10" direction="down" scrollamount="5" behavior="slide"><h2 style="font-size: 60px; font-style: italic; font-family: Apple; color: white; text-align: center;">Heyy <%=uname %> Your Registration Request Sent Successfully !!!</h2></marquee>
					<br><br><h4 style="font-size: 30px;  font-style: italic; font-family: Apple; color: white; text-align: center;">We will send an Email when Your Registration request accept by Admin. </h4>
					<br><a style="font-size: 20px;  background-color:blue;  font-style: italic; font-family: Apple; color: white; text-align: center;" href="index.jsp">Back
					to home</a>
				
				</div>



				


			</div>
		</div>
	</div>


	<!-- plugins:js -->
	<script src="assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="assets/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
</body>
</html>