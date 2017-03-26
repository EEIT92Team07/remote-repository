<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../css/main.css" />
<title>Product</title>
<script type="text/javascript">
function clearForm() {
	var inputs = document.getElementsByTagName("input");
	for(var i=0; i<inputs.length; i++) {
		if(inputs[i].type=="text") {
			inputs[i].value="";
		}
	}
}
</script>
</head>
<body>

<h3>行程管理系統 </h3>

<form action="<c:url value="/display.jsp" />" method="post">
<table>
	<tr>
		<td>Name : </td>
		<td><input type="text" name="name" value="${param.spotName}"></td>
		<td></td>
	</tr>

	<tr>
		<td>SuggestTime : </td>
		<td><input type="text" name="price" value="${param.suggestTime}"></td>
		
	</tr>
	<tr>
		<td>coordinate</td>
		<td><input type="text" name="coordinate" value="${param.coordinate}"></td>
	</tr>
	<tr>
		<td>Info : </td>
		<td><input type="text" name="Info" value="${param.Info}"></td>
	</tr>
		<tr>
		<td>opentime : </td>
		<td><input type="text" name="opentime" value="${param.opentime}"></td>

	<tr>
		<td>price : </td>
		<td><input type="text" name="price" value="${param.price}"></td>
	</tr>
		<tr>
		<td>type : </td>
		<td><input type="text" name="type" value="${param.type}"></td>
	</tr>
		</tr>
		<tr>
		<td>photo : </td>
		<td><input type="text" name="photo
		" value="${param.photo}"></td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="prodaction" value="Insert">
			<input type="submit" name="prodaction" value="Update">
		</td>
		<td>
			<input type="submit" name="prodaction" value="Delete">
			<input type="submit" name="prodaction" value="Select">
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
	</tr>
</table>

</form>


<c:if test="${not empty delete}">
<h3>Delete Product Table Success : ${delete} row deleted</h3>
<script type="text/javascript">clearForm();</script>
</c:if>

<c:if test="${not empty insert}">
<h3>Insert Product Table Success</h3>
<table border="1">
	<tr><td>Id</td><td>${insert.id}</td></tr>
	<tr><td>Name</td><td>${insert.name}</td></tr>
	<tr><td>Price</td><td>${insert.price}</td></tr>
	<tr><td>Make</td><td>${insert.make}</td></tr>
	<tr><td>Expire</td><td>${insert.expire}</td></tr>
</table>
<script type="text/javascript">clearForm();</script>
</c:if>

<c:if test="${not empty update}">
<table border="1">
	<tr><td>Id</td><td>${update.id}</td></tr>
	<tr><td>Name</td><td>${update.name}</td></tr>
	<tr><td>Price</td><td>${update.price}</td></tr>
	<tr><td>Make</td><td>${update.make}</td></tr>
	<tr><td>Expire</td><td>${update.expire}</td></tr>
</table>
<script type="text/javascript">clearForm();</script>
</c:if>

</body>
</html>