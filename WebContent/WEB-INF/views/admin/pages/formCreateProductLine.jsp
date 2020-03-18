<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creater product line new</title>
</head>
<body>
	<form:form action="add.htm" modelAttribute="productLine">
		<form:input path="productLine"></form:input>
		<form:input path="textDescription" />
		<input type="submit" value="save">
	</form:form>
</body>
</html>