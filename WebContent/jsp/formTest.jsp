<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FormTest</title>
</head>
<body>
<% 
	String name=(String) request.getAttribute("name");
	if(name== null) name="";
	
	String surname=(String) request.getAttribute("surname");
	if(surname== null) surname="";

	String errorForm= (String) request.getAttribute("errorForm");
	if(errorForm != null) {
		%>
		<div><%=errorForm %></div>
	<% 
	}
	
	String message=(String) request.getAttribute("message");
	if(message != null) {
		%>
		<div><%=message%></div>
	<% 
	}
%>

<form name="formTest" method="post" action="/form.html">
name: <input type="text" name="name" placeholder="Mario" value="<%=name%>"><br>
surname: <input type="text" name="surname" placeholder="Rossi" value="<%=surname%>"><br>
<br>
<input type="submit">
<input type="reset">
</form>


</body>
</html>