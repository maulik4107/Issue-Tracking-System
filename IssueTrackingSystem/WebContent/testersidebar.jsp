<%@page import="com.issuetracker.bean.User"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<%
		HttpSession session6 = request.getSession(false);
	%>
	<%
		User tester = (User) session6.getAttribute("tester");
	%>
	<ul class="nav">
		<br>
		<li class="nav-item nav-category border"
			style="font-size: 20px; text-align: center; border-radius: 35px; font-style: italic; font-family: Apple; background-color: white; color: blue"><b>
				Tester</b></li>
		<br>
		<br>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="menu-icon typcn typcn-coffee"></i> <span
				class="menu-title"><i class="bi bi-file-ppt"
					style="margin-right: 10px;"></i>Projects</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="GetProjectList?id=3"><i class="bi bi-file-earmark-check"
							style="margin-right: 10px;"></i>View Projects</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="menu-icon typcn typcn-coffee"></i> <span
				class="menu-title"><i class="bi bi-question-circle"
					style="margin-right: 10px;"></i>Issues</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="TesterModules?id=<%=tester.getUserId()%>&str=create"><i class="bi bi-question-circle"
							style="margin-right: 10px;"></i>Create issue</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ViewIssue?id=<%=tester.getUserId() %>"><i
							class="bi bi-question-circle" style="margin-right: 10px;"></i>View
							Issues</a></li>
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
						href="TesterModules?id=<%=tester.getUserId()%>&str=view"><i
							class="bi bi-file-earmark-post-fill" style="margin-right: 10px;"></i>My
							Modules</a></li>
					<li class="nav-item"><a class="nav-link" href="#"><i
							class="bi bi-question-circle" style="margin-right: 10px;"></i>My
							Issues</a></li>
				</ul>
			</div></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth" aria-expanded="false" aria-controls="auth"> <i
				class="menu-icon typcn typcn-document-add"></i> <span
				class="menu-title"><i class="bi bi-person-circle"
					style="margin-right: 10px;"></i>Profile</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="EditProfile?id=3"><i class="bi bi-pencil-square"
							style="margin-right: 10px;"></i>Edit Profile </a></li>
					<li class="nav-item"><a class="nav-link"
						href="EditPasswordCheck?id=3"><i class="bi bi-lock-fill"
							style="margin-right: 10px;"></i> Change Password </a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" href="LogOut?id=3">
				<i class="menu-icon typcn typcn-bell"></i> <span class="menu-title"><i
					class="bi bi-box-arrow-in-left" style="margin-right: 10px;"></i>
					Logout </span>
		</a></li>
	</ul>
</nav>
