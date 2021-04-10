<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>About us</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="se-pre-con"></div>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<%@include file="aboutsidebar.jsp"%>
			</nav>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="header-wrapper">
						<div class="zoominheader">
							<div class="zoomoutheader">
								<section id="hero">
									<div class="hero container">
										<br>
										<div
											style="border: 2px solid white; border-radius: 10px; margin-bottom: 50px; margin-left: 130px; width: 800px;">
											<div style="border: 1px solid white; border-radius: 10px;">
												<h3
													style="color: white; font-family: URW Gothic; font-size: 50px;">Services</h3>
											</div>
											<p
												style="color: white; font-family: URW Gothic; font-size: 30px;">
												<i class="bi bi-file-earmark-plus"
													style="margin-right: 10px;"></i>Project Creation & Tracking
											</p>
											<p
												style="color: white; font-family: URW Gothic; font-size: 30px;">
												<i class="bi bi-file-earmark-post-fill"
													style="margin-right: 10px;"></i>Module Creation & Tracking
											</p>
											<p
												style="color: white; font-family: URW Gothic; font-size: 30px;">
												<i class="bi bi-question-circle" style="margin-right: 10px;"></i>Issue
												Creation & Tracking
											</p>
											<p
												style="color: white; font-family: URW Gothic; font-size: 30px;">
												<i class="bi bi-file-earmark-person"
													style="margin-right: 10px;"></i>Report Creation
											</p>
											<div style="border: 1px solid white; border-radius: 10px;">
												<p
													style="color: white; font-family: URW Gothic; font-size: 20px;">Create
													your project and assign to your team</p>
												<p
													style="color: white; font-family: URW Gothic; font-size: 20px;">Your
													team can create module of your project</p>
												<p
													style="color: white; font-family: URW Gothic; font-size: 20px;">Your
													QA can create Issue of your module</p>
												<p
													style="color: white; font-family: URW Gothic; font-size: 20px;">You 
													can track your Project, Module & Issue using diffrent kind of status</p>
											</div>
											<div style="border: 1px solid white; border-radius: 10px;">
												<p
													style="color: white; font-family: URW Gothic; font-size: 20px;">
													<a href="https://youtu.be/_rwBbhur9dw" style="color: white;">Want to know more about system?</a>
													</p>
											</div>
										</div>
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