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
<%@ include file="jsp/navbar2.jsp" %>
<body onload="document.registration.nome.focus();">
<h1 id=benvenutoRegistazione>Unisciti a noi!</h1>
<p id="registrazione ">Compila il form per effettuare la registrazione</p>



<form action="AddUtente" method= "POST" name="registration" onSubmit="return FormValidation();" >
<input type="hidden" name="action" value="insert">
<fieldset>
   <ul>
   <li><label for="nome"><b>Nome</b></label></li>
   <li><input type="text" size="40" name="nome" ></li>
   <li><label for="cognome"><b>Cognome</b></label></li>
   <li><input type="text" size="40" name="cognome" ></li>
   <li><label for="sesso"><b>Sesso</b></label></li>
   <li><select name="sesso" id="sesso"></li> 
    <option value="femmina">F</option>
    <option value="maschio">M</option>
	</select>
   <li><label for="regione"><b>Regione</b></label></li>
   <li><input type="text" size="40" name="regione"></li>
   <li><label for="citta"><b>Città</b></label></li>
   <li><input type="text" size="40" name="citta"></li>
   <li><label for="provincia"><b>Provincia</b></label></li>
   <li><input type="text" size="40" name="provincia"></li>
   <li><label for="via"><b>Via</b></label></li>
   <li><input type="text" size="40" name="via"></li>
   <li><label for="numerocivico"><b>Numero Civico</b></label></li>
   <li><input type="number" size="40" name="numerocivico"></li>
   <li><label for="cellulare"><b>Cellulare</b></label></li>
   <li><input type="tel" size="40" name="cellulare"></li>
   <li><label for="email"><b>Email</b></label></li>
   <li><input class=margin type="text" size="40"name="email"></li>
   <li><label for="password"><b>Password</b></label></li>
   <li><input type="password" size="40" name="password" ></li>
   </ul>
   <input  class=bottoniCreaUtente type ="submit" name="Iviaci i dati" value="Iscriviti" >
   <input class=bottoniCreaUtente type="reset" > 
 </fieldset>
  
</form>

</body>
<%@ include file="jsp/footer.jsp" %>
</html>