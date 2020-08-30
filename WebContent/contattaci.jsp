<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.UtenteBean" %>
    <%
    
    UtenteBean user= (UtenteBean)request.getSession().getAttribute("user");
  //Recupero dati utente dalla session, se presenti.
   	String nome="";
   	if(user != null){nome= user.getNome();}
    
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Somma Models</title>
</head>
<body>
<%@ include file="jsp/navbar2.jsp" %>


	<% if(!nome.isBlank()){ %> <br><h4>Bentornato/a <%=nome %></h4><br>

   <form action="Logout" method="get" > 
     <input type="submit" value="Logout"/>
   </form> 
   
 <%}%>
	<h1>CONTATTACI</h1>
	<p> INDIRIZZO: 		Via Giovanni Paolo II, 132 - 84084 Fisciano (SA) <br>
		TELEFONO: 		08187800 <br>
		CELLULARE: 		32244466 <br>
		PARTITA IVA:	0023455555 <br>
		E-MAIL:			sommamodels@gmail.com <br>
	</p>


</body>

<%@ include file="jsp/footer.jsp" %>

</html>