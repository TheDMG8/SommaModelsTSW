<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nuovo Utente Creato </title>
</head>
<%@ include file="jsp/navbar3.jsp" %>
<body>
<!-- nuovo utente creato -->

<h2>NUOVO UTENTE CREATO</h2>
<p>Nuovo Utente registrato con successo:
</p>
<p>
   Nome: <% String nome = request.getParameter("nome"); out.print(nome); %><br>
   Cognome : <% String cognome = request.getParameter("cognome"); out.print(cognome); %><br>
   Sesso : <% String sesso = request.getParameter("sesso"); out.print(sesso); %><br>
   Regione : <% String regione = request.getParameter("regione"); out.print(regione); %><br>
   Città : <% String città = request.getParameter("città"); out.print(città); %><br>
   Provincia :<% String provincia = request.getParameter("provincia"); out.print(provincia); %><br>
   Via :<% String via = request.getParameter("via"); out.print(via); %><br>
   Numero civico :<% String numerocivico = request.getParameter("numerocivico"); out.print(numerocivico); %><br>
   Cellulare :<% String cellulare = request.getParameter("cellulare"); out.print(cellulare); %><br>
   Email :<% String email = request.getParameter("email"); out.print(email); %><br>
   Password : <%String password = request.getParameter("password"); out.print(password); %><br>



</body>
<%@ include file="jsp/footer.jsp" %>
</html>