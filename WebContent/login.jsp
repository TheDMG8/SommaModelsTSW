<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%
		String message= (String) request.getAttribute("message");
	%>
<title>LOGIN</title>


</head>
<link href="CSS/login.css" rel="stylesheet" type="text/css">
<body>
<%@ include file="jsp/navbar3.jsp" %>
 <%if(message != null){%>
 		<h4><%=message %></h4>
 	<%}%>
<h1>Bentornato!</h1>
  <form action="AddUtente" method="POST">
     <div class="container">
     <label for="username"><b>Username</b></label><br>
     <input type="text" name="username" placeholder="email address" required><br>
     
     <label for="password"><b>Password</b></label><br>
     <input type="password" name="password" placeholder ="password" required>
     <button type="submit" value="Login">Login</button>
     
     <input type="hidden" name="action" value="login">
     </div>
     <p class="message">Not registered? <a href="CreaUtente.jsp">Create an account</a></p>
    
   </form>
</body>
<%@ include file="jsp/footer.jsp" %>
</html>