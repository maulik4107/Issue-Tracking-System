<%@page import="java.util.List"%>
<%@page import="com.issuetracker.bean.Issue"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	var flag = 0;

	function projectname() {
		var pname = document.getElementById("pid").value;
		var plabel = document.getElementById("plabel");
		plabel.innerHTML = "";

		if (pname.length <= 0) {
			document.getElementById("pid").style.borderColor = "red";
			plabel.innerHTML = "Enter Issue Name.";
			flag = 1;
		} else {
			if (pname.length < 3) {
				plabel.innerHTML = "Please Enter at least 3 Character.";
				document.getElementById("pid").style.borderColor = "red";
				flag = 1;
			} else {
				document.getElementById("pid").style.borderColor = "green";
				flag = 0;
			}
		}

	}
	function checkdoc() {
		var pdes = document.getElementById("des").value;
		var dlabel = document.getElementById("dlabel");
		dlabel.innerHTML = "";
		if (pdes.length==0) {
			document.getElementById("des").style.borderColor = "red";
			dlabel.innerHTML = "Enter Description of Issue.";
			flag=1;
		} else {
			document.getElementById("des").style.borderColor = "green";
			flag=0;
		}
	}

	function validateForm() {

		var pname = document.getElementById("pid").value;
		var pdes = document.getElementById("des").value;

		var plabel = document.getElementById("plabel");
		var dlabel = document.getElementById("dlabel");

		plabel.innerHTML = "";
		dlabel.innerHTML = "";

		if (pname == "") {
			plabel.innerHTML = "Issue Name is Empty.";
			document.getElementById("pid").style.borderColor = "red";
			flag = 1;
		}
		if (pname.length < 3) {
			plabel.innerHTML = "Please Enter at least 3 Character.";
			document.getElementById("pid").style.borderColor = "red";
			flag = 1;
		}
		if (pdes == "") {
			dlabel.innerHTML = "Description is Empty.";
			document.getElementById("des").style.borderColor = "red";
			flag = 1;
		}
		if (pdes.length > 0) {
			document.getElementById("des").style.borderColor = "green";
			flag=0;
		}
		
		if (flag == 1) {
			return false;
		} else {
			return true;
		}

	}
	$(document).ready(function() {
		$('#sdate').change(function() {
			var sdlabel = document.getElementById("sdlabel");
			document.getElementById("sdate").style.borderColor = "green";
			sdlabel.innerHTML = "";
		});
	});
	$(document).on('click', '.data-enlargeable', function() {
		var src = $(this).attr('src');
		var modal;
		function removeModal() {
			modal.remove();
			$('body').off('keyup.modal-close');
		}
		modal = $('<div>').css({
			background : 'RGBA(0,0,0,.5) url(' + src + ') no-repeat center',
			backgroundSize : 'contain',
			width : '100%',
			height : '100%',
			position : 'fixed',
			zIndex : '10000',
			top : '0',
			left : '0',
			cursor : 'zoom-out'
		}).click(function() {
			removeModal();
		}).appendTo('body');
		//handling ESC
		$('body').on('keyup.modal-close', function(e) {
			if (e.key === 'Escape') {
				removeModal();
			}
		});
	});

</script>

<title>Edit Issue</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
<div class="se-pre-con"></div>
	<%
		Issue issue = (Issue) request.getAttribute("issue");
	%>
	<%
		int testerId = (Integer) request.getAttribute("testerId");
	%>
	<%
		int mid = (Integer) request.getAttribute("mid");
	%>
	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.jsp -->
		<%@include file="_navbar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<%@include file="testersidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="container-fluid page-body-wrapper full-page-wrapper">
						<div
							class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">

							<div class="row w-100">
								<div style="align-content: center;">
									<h2
										style="color: darkblue; font-family: Apple; font-style: italic; margin-left: 200px; text-align: center">
										<b>Edit Issue</b>
									</h2>
									<div class="auto-form-wrapper"
										style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
										<form action="UpdateIssueDetails" method="post"
											enctype="multipart/form-data">
											<div class="form-group">
												<label class="label">Issue Name</label> <input type="hidden"
													value="<%=issue.getIssueId()%>" name="pId"> <input
													title="Enter Issue Name." type="text" id="pid"
													class="form-control" placeholder="Issue Name"
													style="font-size: small; size: 30px;"
													onkeyup="projectname();" name="pName"
													value="<%=issue.getIssueName()%>"> <span
													id="plabel" style="color: red; font-size: small;"></span>
											</div>
											<%
												if (issue.getDocumentString() != null) {
											%>
											<div class="form-group">
												<img
													class="data-enlargeable" width="100"
													style="cursor: zoom-in"
													src="data:image/png;base64,<%=issue.getDocumentString()%>">
											</div>
											<%
												} else {
											%>
											<p style="font-family: apple; font-weight: bolder;">Document not uploaded yet.</p>
											<%
												}
											%>
											<div class="form-group">
												<label class="label">Document</label> <input type="file"
													title="Attach Document" id="doc" class="form-control"
													placeholder="Document" style="font-size: small;"
													name="pdocument" value="<%=issue.getDocumentString()%>">
												<span id="clabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label" style="font-size: small;">Issue
													Status</label>
												<div class="input-group">
													<input type="text" class="form-control"
														value="<%=issue.getIssueStatusName()%>"
														readonly="readonly" name="projectStatusName"> <input
														type="hidden" value="<%=issue.getIssueStatusId()%>"
														readonly="readonly" name="projectStatus">

												</div>
												<span id="lpm" style="color: red; font-size: small;"></span>

											</div>
											<div class="form-group" style="size: 50px">
												<label class="label">Created Date</label> <input type="date"
													id="sdate" value="<%=issue.getIssueCreatedDate()%>"
													class="form-control" placeholder="dd/mm/yyyy"
													style="font-size: small; size: 30px;" name="sdate">
												<span id="sdlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label">Description</label> <input type="text"
													id="des" class="form-control"
													value="<%=issue.getIssueDes()%>" placeholder="Description"
													style="font-size: small; size: 30px;" name="description"
													onkeyup="checkdoc();"> <span id="dlabel"
													style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="Save Changes" />
											</div>
											<p class="footer-text text-center text-center">
												<a href="GetIssueDetails?id=<%=testerId%>&moduleId=<%=mid%>"
													style="color: black; font-weight: bolder;">Go Back</a>
											</p>
										</form>
									</div>
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