<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>About us</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.jsp -->
		<nav
			class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div style="background-color: blue"
				class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
				<h1
					style="color: white; font-style: italic; font-family: Apple; margin-top: 10px; border-radius: 35px;">Issue
					Tracker</h1>
			</div>
			<div class="navbar-menu-wrapper d-flex align-items-center"
				style="background-color: blue; border: solid white;">
				<div class="form-group ">
					<h3
						style="font-style: italic; font-family: Apple; color: white; margin: 500px; padding-top: 15px">About
						us</h3>
				</div>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<br>
					<li class="nav-item"><a class="nav-link" href="index.jsp">
							<i class="menu-icon typcn typcn-document-text"></i> <span
							class="menu-title">Home</span>
					</a></li>
				</ul>
			</nav>
			<div class="main-panel">
				<div class="header-wrapper">
					<div class="zoominheader">
						<div class="zoomoutheader">
							</br> </br> </br> </br>
							<div class="txteffect text">
								<h1
									style="text-align: center; font-family: Apple; font-style: italic; font-weight: bold;; color: white; font-size: 60px;">Issue
									Tracking System</h1>
							</div>
							<br><br><br>
							<div style="padding-left: 90px; border: 2px solid white;">
								<div style="text-align: center; font-family: Apple; font-style: italic; font-weight: bold;; color: white;">
									<p style="color: white; font-size: 20px;">The main purpose
										of this project Issue Tracking System is to deal with
										providing online support to the software engineers who are
										facing the issues or errors in software technologies. This
										project can maintaining project details, developer details and
										tester details. Issue Tracking System is the system which
										enable to detect the issues. It does not find the issues but
										provides the full information regarding issues detected. Issue
										Tracking System allows the user of it who wants to know about
										a provide information to the identified issues. The engineers
										develop the project as per client requirements.The tester will
										identify the issues in the testing phase. Whenever the tester
										facing number of issues then he adds the issue id and
										information in the database.The tester informs to project
										manager and developer. The issue details in the database table
										are accessible to project manager and developer. Issue
										Tracking System plays a main role in the testing phase. But it
										supports assigning projects for the developer, tester. This
										Issue Tracking System maintaining the different users and it
										provides separate environments for project manager, developer
										and tester.</p>
								</div>
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