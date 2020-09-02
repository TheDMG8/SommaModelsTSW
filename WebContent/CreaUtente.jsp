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
<p id="registrazione margin">Compila il form per effettuare la registrazione</p>



<form action="AddUtente" method= "POST" name="registration" onSubmit="return FormValidation();" >
<input type="hidden" name="action" value="insert">
<fieldset>
   <ul>
   <li><label class=margin for="nome"><b>Nome</b></label></li>
   <li><input class=margin type="text" size="40" name="nome" ></li>
   <li><label class=margin for="cognome"><b>Cognome</b></label></li>
   <li><input class=margin type="text" size="40" name="cognome" ></li>
   <li><label class=margin for="sesso"><b>Sesso</b></label></li>
   <select class=margin name="sesso" id="sesso">
    <option value="femmina">F</option>
    <option value="maschio">M</option>
	</select>
   <li><label class=margin for="regione"><b>Regione</b></label></li>
   <li><input class=margin type="text" size="40" name="regione"></li>
   <li><label class=margin for="citta"><b>Città</b></label></li>
   <li><input class=margin type="text" size="40" name="citta"></li>
   <li><label class=margin for="provincia"><b>Provincia</b></label></li>
   <li><input class=margin type="text" size="40" name="provincia"></li>
   <li><label class=margin for="via"><b>Via</b></label></li>
   <li><input class=margin type="text" size="40" name="via"></li>
   <li><label class=margin for="numerocivico"><b>Numero Civico</b></label></li>
   <li><input class=margin type="number" size="40" name="numerocivico"></li>
   <li><label class=margin for="cellulare"><b>Cellulare</b></label></li>
   <li><input class=margin type="tel" size="40" name="cellulare"></li>
   <li><label class=margin for="email"><b>Email</b></label></li>
   <li><input class=margin type="text" size="40"name="email"></li>
   <li><label class=margin for="password"><b>Password</b></label></li>
   <li><input class=margin type="password" size="40" name="password" ></li>
   </ul>
   <input  class="margin bottoniCreaUtente" type ="submit" name="Iviaci i dati" value="Iscriviti" >
   <input class=bottoniCreaUtente type="reset" class=button> 
 </fieldset>
  
</form>

</body>
<%@ include file="jsp/footer.jsp" %>
</html>