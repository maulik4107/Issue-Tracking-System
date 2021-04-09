<%@page import="com.issuetracker.bean.User"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<%
		HttpSession session5 = request.getSession(false);
	%>
	<%
		User pm = (User) session5.getAttribute("pm");
	%>

	<ul class="nav">
		<br>
		<li class="nav-item nav-category border"
			style="font-size: 20px; text-align: center; border-radius: 35px; font-style: italic; font-family: Apple; background-color: white; color: blue"><b>
				Project Manager</b></li>
		<br>
		<br>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth1" aria-expanded="false" aria-controls="auth1"> <i
				class="menu-icon typcn typcn-document-add"></i> <span
				class="menu-title"><i class="bi bi-file-ppt"
					style="margin-right: 10px;"></i>Projects</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth1">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="GetProjectList?id=1"> <i
							class="menu-icon typcn typcn-shopping-bag"></i> <span
							class="menu-title"><i class="bi bi-file-earmark-check"
								style="margin-right: 10px;"></i>View Projects</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="PmProjectLists?id=<%=pm.getUserId()%>&str=plist"> <i
							class="menu-icon typcn typcn-shopping-bag"></i> <span
							class="menu-title"><i class="bi bi-file-person-fill"
								style="margin-right: 10px;"></i>My Projects</span>
					</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="menu-icon typcn typcn-coffee"></i> <span
				class="menu-title"><i class="bi bi-file-earmark-post-fill"
					style="margin-right: 10px;"></i>Modules</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="PmProjectLists?id=<%=pm.getUserId()%>&str=module"><i
							class="bi bi-file-earmark-post-fill" style="margin-right: 10px;"></i>Create
							Modules</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ModuleAllocate?id=<%=pm.getUserId()%>"><i
							class="bi bi-person-check" style="margin-right: 10px;"></i>Assign
							Modules to Developer</a></li>

					<li class="nav-item"><a class="nav-link"
						href="ModuleAllocatetoTester?id=<%=pm.getUserId()%>"><i
							class="bi bi-person-check" style="margin-right: 10px;"></i>Assign
							Modules to Tester</a></li>
					<li class="nav-item"><a class="nav-link"
						href="GetProjects?id=<%=pm.getUserId()%>&str=view"><i
							class="bi bi-file-earmark-post-fill" style="margin-right: 10px;"></i>View
							Modules</a></li>
							<li class="nav-item"><a class="nav-link"
						href="GetProjects?id=<%=pm.getUserId()%>&str=change"><i
							class="bi bi-file-earmark-post-fill" style="margin-right: 10px;"></i>Change
							Module Status</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth2" aria-expanded="false" aria-controls="auth2"> <i
				class="menu-icon typcn typcn-document-add"></i> <span
				class="menu-title"><i class="bi bi-question-circle"
					style="margin-right: 10px;"></i>Issue</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth2">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="GetAllProject?str=pm&id=<%=pm.getUserId()%>"><i
							class="bi bi-question-circle" style="margin-right: 10px;"></i>View
							Issues</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ChangeIssueStatusPM?id=<%=pm.getUserId()%>"><i
							class="bi bi-question-circle" style="margin-right: 10px;"></i>Change
							Issue Status</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth3" aria-expanded="false" aria-controls="auth3"> <i
				class="menu-icon typcn typcn-document-add"></i> <span
				class="menu-title"><i class="bi bi-people"
					style="margin-right: 10px;"></i>View Team</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth3">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="GetDevelopersDetails"> <i
							class="menu-icon typcn typcn-shopping-bag"></i> <span
							class="menu-title"><i class="bi bi-person-fill"
								style="margin-right: 10px;"></i>View Developers</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="GetTestersDetails"> <i
							class="menu-icon typcn typcn-shopping-bag"></i> <span
							class="menu-title"><i class="bi bi-person-fill"
								style="margin-right: 10px;"></i>View Testers</span>
					</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth4" aria-expanded="false" aria-controls="auth4"> <i
				class="menu-icon typcn typcn-document-add"></i> <span
				class="menu-title"><i class="bi bi-person-circle"
					style="margin-right: 10px;"></i>Profile</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth4">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="EditProfile?id=1"><i class="bi bi-pencil-square"
							style="margin-right: 10px;"></i> Edit Profile </a></li>
					<li class="nav-item"><a class="nav-link"
						href="EditPasswordCheck?id=1"><i class="bi bi-lock-fill"
							style="margin-right: 10px;"></i>Change Password </a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" href="IdentifyUser?id=1">
				<i class="menu-icon typcn typcn-bell"></i> <span class="menu-title"><i
					class="bi bi-envelope" style="margin-right: 10px;"></i>Send Message
			</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="LogOut?id=1">
				<i class="menu-icon typcn typcn-bell"></i> <span class="menu-title">
					<i class="bi bi-box-arrow-in-left" style="margin-right: 10px;"></i>Logout
			</span>
		</a></li>
	</ul>
</nav>
