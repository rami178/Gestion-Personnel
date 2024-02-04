<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>تطبيق إدارة شؤون الموظفين</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<style>
  .pushable {
    background: hsl(340deg 100% 32%);
    border-radius: 12px;
    border: none;
    padding: 0;
    cursor: pointer;
    outline-offset: 4px;
  }
  .front {
    display: block;
    padding: 2px 30px;
    border-radius: 12px;
    font-size: 0.7rem;
    background: hsl(345deg 100% 47%);
    color: white;
    transform: translateY(-6px);
    font-weight: 900;
  }

  .pushable:active .front {
    transform: translateY(-2px);
  }
  
   .pushable_edit {
    background: hsl(500deg 100% 20%);
    border-radius: 12px;
    border: none;
    padding: 0;
    cursor: pointer;
    outline-offset: 4px;
    
  }
  .front_edit {
    display: block;
    padding: 2px 35px;
    border-radius: 12px;
    font-size: 0.7rem;
    background: hsl(850deg 100% 35%);
    color: white;
    transform: translateY(-6px);
    font-weight: 900;
  }

  .pushable_edit:active .front {
    transform: translateY(-2px);
  }
</style>
<body>

	<header style="position:fixed;z-index:999;width:100%;
    height: 40px;">
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/"
					class="nav-link">الخروج</a></li>
			</ul>
			</div>
			  <div style="position:relative;margin-left:74.5%">
		    <ul class="navbar-nav navbar-collapse justify-content-end">
		        <li>   <a  href="<%= request.getContextPath() %>/listF" class="navbar-brand"> Français</a></li>
		        <li>   <a  href="<%= request.getContextPath() %>/list" class="navbar-brand"> العربية</a></li>
		    </ul>
		   </div>
		    <div style = "position:relative;margin-left:2%">
	             <a  href="<%= request.getContextPath() %>/" class="navbar-brand">صفحة الدخول</a>
			</div>
		</nav>
	</header>

	<div style="float:left;margin-left:2%;margin-top: 5%;margin-bottom: 5%" class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container" >
			<h1 style=" width:130%;font-weight: 900" class="text-center">قائمة الموظفين</h1>
			<hr style="width: 130%;border: 5px outset #33F3FF;">
			<div class="container text-left">

				<a style="font-weight: 800;width :24.5%;margin-left: 106%" href="<%=request.getContextPath()%>/new" class="btn btn-success">إضافة موظف جديد</a>
			</div>
			<br>
			<table style="width: 130%; border: 3px solid black;"class="table table-bordered">
				<thead>
					<tr style="text-align:center;font-size: large;font-style:oblique; background-color: #C4FFBA ; border: 3px solid black;">
						<th  style="border: 3px solid black; ">الإعدادات</th>
						<th style="border: 3px solid black;">العنوان</th>
						<th style="border: 3px solid black;">الهاتف</th>
						<th style="border: 3px solid black;">البريد الإلكتوني</th>
						<th style="border: 3px solid black;">مكان العمل</th>
						<th style="border: 3px solid black;">الرتبة</th>
						<th style="border: 3px solid black;">الإسم و اللقب</th>
						<th style="border: 3px solid black;">الرقم الإداري</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="personnel" items="${listPersonnel}">

							<tr style="text-align:right; border: 3px solid black;">					
							<td style="border: 3px solid black;"><a href="edit?mat=<c:out value='${personnel.mat}' />"> <button  class="pushable_edit"><span class="front_edit">Edit</button></span></a>
								 <a href="delete?mat=<c:out value='${personnel.mat}' />"><button  class="pushable"><span class="front">Delete</button></span></a></td>
							<td style="border: 3px solid black;"><c:out value="${personnel.adresse}" /></td>
							<td style="border: 3px solid black;color:#328F21;font-weight: 900"><c:out value="${personnel.tel}" /></td>
							<td style="border: 3px solid black;"><a href="mailto:"><c:out value="${personnel.email}" /></a></td>
							<td style="border: 3px solid black;"><c:out value="${personnel.prison}" /></td>
							<td style="border: 3px solid black;"><c:out value="${personnel.grade}" /></td>		
							<td style="border: 3px solid black;"><c:out value="${personnel.nom}" /></td>
							<td style="border: 3px solid black;font-weight: 900;color:red;"><c:out value="${personnel.mat}" /></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
