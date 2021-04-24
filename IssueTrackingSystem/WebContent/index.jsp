<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Issue Tracking System</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="se-pre-con"></div>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<%@include file="_sidebar.jsp"%>
			</nav>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="header-wrapper">
						<div class="zoominheader">
							<div class="zoomoutheader">
								<section id="hero">
									<div class="hero container">
										<h1 style="font-size: 70px;margin-bottom: 400px;">
											Issue <span></span>
										</h1>
										<h1 style="font-size: 70px;margin-bottom: 400px;margin-left: 20px;">
											Tracking<span></span>
										</h1>
										<h1 style="font-size: 70px;margin-bottom: 400px;margin-left: 20px;">
											System<span></span>
										</h1>
										<br>
										<div
											style="border: 2px solid white; border-radius: 10px; margin-left: 200px;">
											<div style="border: 1px solid white;border-radius: 10px;">
												<p
													style="color: white; font-family: URW Gothic; font-size: 30px;">We
													are Team of Talented issue Tracker</p>
											</div>
											<div style="border: 1px solid white;border-radius: 10px;">
												<p
													style="color: white; font-family: URW Gothic; font-size: 30px;">An
													issue tracker that your team and clients will love</p>
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