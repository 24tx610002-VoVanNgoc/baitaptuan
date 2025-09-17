<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
</head>
<body>


	${name}



	<form action="home" method="POST">
		<label>Họ tên</label> 
		<input type="text" name="ten"> 
		<input type="text" name="holot">
		<input type="submit" name="OK">
	</form>
	
</body>
</html>
