<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
     pageEncoding="UTF-8" import="java.util.*"%>
    <%
    Collection<?> prodotto = (Collection<?>) request.getAttribute("prodotto");
    
 	String error = (String)request.getAttribute("error");
 	
 	if(prodotto == null && error == null) {
 		response.sendRedirect(response.encodeRedirectURL("./InitServlet"));
 		return;
 	}
 	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Somma Models</title>

</head>
<%@ include file="jsp/navBar.jsp" %>

  <%= prodotto %>
 
</body>
</html>