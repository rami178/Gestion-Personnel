<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<header style="position:fixed;z-index:999;width:100%;
    height: 40px;">
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/"
					class="nav-link">الخروج</a></li>
					<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">العودة</a></li>
			</ul>
			</div>
		    <div style = "position:relative;margin-left:84.5%">
	             <a  href="<%= request.getContextPath() %>/" class="navbar-brand"> صفحة الدخول</a>
			</div>
		</nav>
	</header>