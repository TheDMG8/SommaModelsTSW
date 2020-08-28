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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="CSS/navBar.css">
<body>
<%@ include file="jsp/userBar.jsp" %>
<%@ include file="jsp/navBarSimple.jsp" %>
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
     <p class="message">Non sei ancora registrato? <a href="CreaUtente.jsp">Crea un account!</a></p>
    
   </form>
</body>
<%@ include file="jsp/footer.jsp" %>
</html>