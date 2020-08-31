<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.UtenteBean"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style type="text/css">
.user-div {

	padding:10px; 
	border: 1px solid black;
	color:#fff;
	direction: rtl;
	overflow: hidden;
}
.user-div h4 {
	 color: red; 
}

.user-div form{
	float: left;
  	display: block;
	color: red; 
}

.button a{
	text-decoration: none;
}



</style>
<title>PaginaPersonale</title>

</head>
<body>
<%@ include file="jsp/navbar2.jsp" %>


	
	<% if(!nome.isBlank()){ %> 
	<div class="user-div">
	<br><h4>Bentornato/a <%=nome %></h4><br>
  
  
   <form action="Logout" method="get" > 
     	<input type="submit" value="Logout"/> 
   </form> 
		
   </div>

 <%}%>
	

</body>

<%@ include file="jsp/footer.jsp" %>
</html>