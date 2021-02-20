<%@page import="com.issuetracker.bean.User"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
<%HttpSession session5 = request.getSession(false);%>
<%User pm = (User)session5.getAttribute("pm");%>

	<ul class="nav">
		<br>
		<li class="nav-item nav-category border"
			style="font-size: 20px; text-align: center; border-radius: 35px; font-style: italic; font-family: Apple; background-color: white; color: blue"><b>
				Project Manager</b></li>
		<br>
		<br>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="menu-icon typcn typcn-coffee"></i> <span
				class="menu-title">Modules</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="PmProjectLists?id=<%=pm.getUserId()%>&str=module">Create
							Modules</a></li>
					<li class="nav-item"><a class="nav-link" href="ModuleAllocate?id=<%=pm.getUserId()%>">Allocate
							Modules</a></li>
					<li class="nav-item"><a class="nav-link" href="#">View
							Modules</a></li>
					<li class="nav-item"><a class="nav-link" href="#">View
							Issues</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth" aria-expanded="false" aria-controls="auth"> <i
				class="menu-icon typcn typcn-document-add"></i> <span
				class="menu-title">Projects</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="GetProjectList?id=1">
							<i class="menu-icon typcn typcn-shopping-bag"></i> <span
							class="menu-title">View Projects</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="PmProjectLists?id=<%=pm.getUserId()%>&str=plist">
							<i class="menu-icon typcn typcn-shopping-bag"></i> <span
							class="menu-title">My Projects</span>
					</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" href="#"> <i
				class="menu-icon typcn typcn-th-large-outline"></i> <span
				class="menu-title">Developers & Testers</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth" aria-expanded="false" aria-controls="auth"> <i
				class="menu-icon typcn typcn-document-add"></i> <span
				class="menu-title">Profile</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="EditProfile?id=1"> Edit Profile </a></li>
					<li class="nav-item"><a class="nav-link"
						href="EditPasswordCheck?id=1"> Change Password </a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" href="LogOut?id=1"> <i
				class="menu-icon typcn typcn-bell"></i> <span class="menu-title">
					Logout </span>
		</a></li>
	</ul>
</nav>
