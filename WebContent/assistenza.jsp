<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.UtenteBean" %>
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet "href="CSS/assistenza.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Assistenza clienti</title>
</head>
<body>
<%@ include file="jsp/navbar2.jsp" %>


	<% if(nome.isBlank()){ %> 
		<p class=titolo>Effettua il login per richiedere assistenza!</p>   
 <%}else{%>
	 
	<p class=titolo>Hai bisogno di aiuto?<br>Compila il form e soddisferemo le tue esigenze!</p>
	
	<form action="AddAssistenza" method= "POST" name="assistenza" onSubmit="return successAssistenza"; >
	<input type="hidden" name="azione" value="assistenza">
	
	<table id="table-form" class="center">
		<tr>
		<td><label  for="categoria"><b>Categoria: </b></label></td>
   			<td><select  name="categoria" id="categoria" >
   		 		<option value="statico">Modellismo statico</option>
    			<option value="dinamico">Modellismo dinamico</option>
			</select></td>
		</tr>
		<tr>	
		<td><label  for="orario"><b>Fascia oraria in cui sei disponibile: </b></label></td>
   			<td><select class=margin name="orario" id="orario"> 
   		 		<option value="Nove-Tredici">9:00-13:00</option>
   		 		<option value="Quattordici-Quindici">14:00-17:00</option>
    			<option value="Sedici-Diciassette">17:00-19:00</option>
			</select> </td>
		</tr>
		<tr>	
		<td><label  for="problema"><b>Descrivi il tuo problema: </b></label></td>
		<td><textarea  id=problma name="problema" rows="4" col="100"> </textarea></td>
		</tr>
	</table>
	<table id="table-form" class="center">
	<tr>
	<td><input class=bottoneAssistenza id=bottoneAssistenza type ="submit" value="Inviaci i dati" ></td>
	</tr>
	</table>
	</form>

	 
	 
	

 <% }%>
</body>

<%@ include file="jsp/footer.jsp" %>

</html>