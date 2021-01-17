<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Blank page </title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.jsp -->
		<%@include file="_navbar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link"
						href="index.jsp"> <i
							class="menu-icon typcn typcn-document-text"></i> <span
							class="menu-title">Home</span>
					</a></li>
				</ul>
			</nav>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(buglogof.png); background-repeat: no-repeat; background-position: center; background-size: 550px;">
					<h4>Hello</h4>
				</div>
			</div>
		</div>
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>