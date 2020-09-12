<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="it.unisa.model.ProductBean"%>

   <%
// Check user credentials
	Boolean adminRoles = (Boolean) request.getSession().getAttribute("adminRoles");
   
	if (adminRoles != true)
	{	
   		 response.sendRedirect("./login.jsp");
   	 	return;
	}

    Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
	String error = (String)request.getAttribute("error");
	
    if(prodotti == null ) {
		response.sendRedirect(response.encodeRedirectURL("./ModProductController"));
		return;
	}
		

%>

<!DOCTYPE html>
<html>
<head>
<link href="CSS/profilo.css" rel="stylesheet">
<link href="CSS/assistenza.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Modifica Prodoto</title>


</head>
<body>
	<%@ include file="jsp/navbar2.jsp" %>

	<header>
		<div class="user-div">
	<form action="addProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Aggiungi Prodotti"/></form> 
    <form action="editProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Elimina Prodotti"/></form> 
   	<form action="adminArea.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Area Amministratore"/></form> 
   		</div>
	</header>
	


</body>
<%@ include file="jsp/footer.jsp" %>
</html>