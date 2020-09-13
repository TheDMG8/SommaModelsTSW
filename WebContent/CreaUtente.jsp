<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="CSS/creaUtente.css" rel="stylesheet" type="text/css">
<link href="CSS/assistenza.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Registrazione Utente</title>
<script src="FormValidation.js"></script>
</head>

<body onload="document.registration.nome.focus();">
<%@ include file="jsp/navbar3.jsp" %>
<h1 id=benvenutoRegistazione>Unisciti a noi!</h1>
<p id="registrazione">Compila il form per effettuare la registrazione</p>
<%
if(request.getSession()!=null){
String error=  (String)request.getSession().getAttribute("error");
if(error != null){%>
	<h1>CAMPI INSERITI SONO ERRATI</h1>
<%} }%>


<form action="AddUtente" method= "POST" name="registration" onSubmit="return FormValidation();" >
<input type="hidden" name="action" value="insert">
<fieldset>
   <table id="table-form" class="center">
   <tr>
   <td><label for="nome" ><b>Nome</b></label></td>
   <td><input type="text" size="40" name="nome" placeholder="Mario"></td>
   </tr>
   <tr>
   <td><label for="cognome"><b>Cognome</b></label></td>
   <td><input type="text" size="40" name="cognome" placeholder="Rossi"></td>
   </tr>
   <tr>
   <td><label for="sesso"><b>Sesso</b></label></td>
   <td><select name="sesso" id="sesso"> 
    <option value="maschio" >M</option>
    <option value="femmina">F</option>
	</select></td>
	</tr>
	<tr>
   <td><label for="regione"><b>Regione</b></label></td>
   <td><input type="text" size="40" name="regione" placeholder="Lazio"></td>
   </tr>
   <tr>
   <td><label for="citta"><b>Citta'</b></label></td>
   <td><input type="text" size="40" name="citta" placeholder="Roma"></td>
   </tr>
   <tr>
   <td><label for="provincia"><b>Provincia</b></label></td>
   <td><input type="text" size="40" name="provincia" placeholder="RO"></td>
   </tr>
   <tr>
   <td><label for="via"><b>Via</b></label></td>
   <td><input type="text" size="40" name="via" placeholder="Via Grande"></td>
   </tr><tr>
   <td><label for="numerocivico"><b>Numero Civico</b></label></td>
   <td><input type="number" size="40" name="numerocivico" placeholder="1"></td>
   </tr><tr>
   <td><label for="cellulare"><b>Cellulare</b></label></td>
   <td><input type="tel" size="40" name="cellulare" placeholder="3334445556"></td>
   </tr><tr>
   <td><label for="email"><b>Email</b></label></td>
   <td><input class=margin type="text" size="40"name="email" placeholder="marioRossi@example.com"></td>
   </tr><tr>
   <td><label for="password"><b>Password</b></label></td>
   <td><input type="password" size="40" name="password" ></td>
   </tr>
   </table>
   <input  class=bottoniCreaUtente type ="submit" name="Inviaci i dati" value="Iscriviti" >
   <input class=bottoniCreaUtente type="reset" > 
 </fieldset>
  
</form>

</body>
<%@ include file="jsp/footer.jsp" %>
</html>