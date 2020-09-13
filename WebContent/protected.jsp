<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
// Check user credentials
Boolean adminRoles = (Boolean) request.getSession().getAttribute("adminRoles");
if (adminRoles != true)
{	
    response.sendRedirect("./login.jsp");
    return;
}
%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Protected Page</title>

</head>
<body>
<%@ include file="jsp/navbar2.jsp" %>
<h1>Welcome to the Protected Page</h1>
Congratulations. You have accessed a protected document.
<br><br>
<nav>
			<ul>
				<li><a href="addProduct.jsp">Aggiungi Prodotti</a></li>
				<li><a href="editProduct.jsp">Modifica Prodotti</a></li>
			</ul>
		</nav>


</body>
<%@ include file="jsp/footer.jsp" %>
</html>