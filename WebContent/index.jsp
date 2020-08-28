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



<%if(user == null){ %>
<%@ include file="jsp/userBar.jsp" %> 
<% }else{%>
<div class="userBar">	
			 <a href="Carrello.jsp"><i class="fa fa-shopping-cart"></i> Carrello</a> 

           	 <a href="login.jsp"><i class="fa fa-fw fa-user"><%=nome %> </a>       	
        </div>
<%} %>
<%@ include file="jsp/navBar.jsp" %> 


<!-- Carousel (Scorrimento orizzontale) -->

	<%@ include file="jsp/SlideBar.jsp" %> 
	
	<br>
	
	<% if(!nome.isBlank()){ %> <br><h4>Bentornato/a <%=nome %></h4><br>

   <form action="Logout" method="get" > 
     <input type="submit" value="Logout"/>
</form> 
   
 <%}%>
	
<!-- Three cards category -->

	<%@ include file="jsp/ThreeContainer.jsp" %> 
<br>
<br>


<!-- Ends cards category -->

	<%@ include file="jsp/footer.jsp" %>
</body>
</html>