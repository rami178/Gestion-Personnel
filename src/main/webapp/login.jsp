<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>تطبيق إدارة شؤون الموظفين</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div style="margin-top:5%;  width: 30%;justify-content: center;overflow: auto; " class="container col-md-8 col-md-offset-3">
		<h1>تسجيل الدخول</h1>
		<form action="<%=request.getContextPath()%>/" method="post">

			<div  class="form-group">
				<label "for="uname">إسم المستخدم:</label> <input type="text"
					class="form-control" id="username" placeholder="إسم المستخدم"
					name="username" required>
			</div>

			<div class="form-group">
				<label for="uname">كلمة السر:</label> <input type="password"
					class="form-control" id="password" placeholder="كلمة السر"
					name="password" required>
			</div>


			<button type="submit" class="btn btn-primary">تسجيل الدخول</button>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>