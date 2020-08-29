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
	<h3>Bentornato!</h3>
	<p>Hai bisogno di aiuto? Compila il form e soddisferemo le tue esigenze!</p>
	
<!-- creare una classe per l'assistenza -->
	<form>
	<ul>
		<li><label for="categoria"><b>Categoria: </b></label></li>
   			<select name="categoria" id="categoria">
   		 		<option value="statico">Modellismo statico</option>
    			<option value="dinamico">Modellismo dinamico</option>
			</select>
			
		<li><label for="orario"><b>Fascia oraria in cui sei disponibile: </b></label></li>
   			<li><select name="orario" id="orario"> </li>
   		 		<option value="noveTredici">9:00-13:00</option>
   		 		<option value="quattordiciQuindici">14:00-17:00</option>
    			<option value="sediciDiciassette">17:00-19:00</option>
			</select>
			
		<li><label for="problema"><b>Descrivi il tuo problema: </b></label></li>
		<input type="text" size="100" name="descrizioneProblema"> 
	</ul>
	</form>

	 <input type ="submit" value="Inviaci i dati">
	 
	<li><p><b> Ti contattiamo noi il prima possibile! </b></p> </li>


</body>

<%@ include file="jsp/footer.jsp" %>

</html>