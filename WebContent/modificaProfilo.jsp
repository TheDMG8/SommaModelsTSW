<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.UtenteBean"%>

<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="CSS/profilo.css" rel="stylesheet">

<meta charset="ISO-8859-1">
<title>Modifica profilo</title>

<style type="text/css">
.col-md-6 input{
    padding: 10px; 

}
.nota p{
	color: red;
}

input[type=number]{
    width: 70px;
} 

</style>
</head>
<body>
<%@ include file="jsp/navbar2.jsp" %>

<%if(nome.isBlank()){ 
	response.sendRedirect("Index.jsp");

%>


<%}else{ %>	
	<div class="user-div">
	 	<%
	 	request.getSession().setAttribute("idUser", user.getIdUtente());
	 	if(user.isAdmin().equals("true")){ 
             request.getSession().setAttribute("adminRoles", true); 
             request.getServletContext().setAttribute("adminRoles", true);
        %>
        <form action="adminArea.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Area Amministratore"/></form> 
   		
        <%} %>
		<form action="Logout" method="get" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Logout"/></form> 
		
    </div>

<div class="container emp-profile">
            <form action="AddUtente" method= "post" name="modifica" onSubmit="return FormValidation();" >
            
            	<input type="hidden" name="action" value="modify">
            	<fieldset>
                <div class="row">
                    <div class="col-md-6">
                        <div class="profile-head">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link " id="home-tab" data-toggle="tab" href="userPersonalPage.jsp" role="tab" aria-controls="home" aria-selected="true">Profilo:</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" id="ordine-tab" data-toggle="tab" role="tab" aria-controls="profile" aria-selected="true">Modifica dati</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab"></div>
                            
                            <div class="tab-pane fade show active" id="ordini" role="tabpanel" aria-labelledby="ordine-tab">
                                        
                                        <div class="row">
                                            <div class="col-md-6">
                                                
                                                <label for="nome"><b>Nome:<input type="text" size="40" name="nome" value="<%=user.getNome()%>"></b></label>
                                                <label for="cognome"><b>Cognome:<input type="text" size="40" name="cognome" value="<%=user.getCognome()%>"></b></label><br>
                                                <label for="sesso"><b>Sesso:</b> <%if(user.getSesso().equals("Maschio")==true||user.getSesso().equals("m")==true||user.getSesso().equals("maschio")==true||user.getSesso().equals("M")==true){%>
                                                	<%="M"%>
                                                <%}else{ %>
                                                    <%="F" %>
                                                <%} %>
                                                </label><br>
                                                <label for="regione"><b>Regione:<input type="text" size="40" name="regione" value="<%=user.getRegione()%>"></b></label><br>
                                                <label for="citta"><b>Citta':<input type="text" size="40" name="citta" value="<%=user.getCitta()%>"></b></label><br>
                                                <label for="provincia"><b>Provincia:<input type="text" size="40" name="provincia" value="<%=user.getProvincia()%>"></b></label><br>
                                                <label for="via"><b>Via:<input type="text" size="40" name="via" value="<%=user.getVia()%>"></b></label><br>
                                                <label for="numerocivico"><b>Numero Civico:   <br><input type="number" size="40" name="numerocivico" value="<%=user.getNumCivico()%>"></b></label><br>
                                                <label for="cellulare"><b>Cellulare:<input type="tel" size="40" name="cellulare" value="<%=user.getCellulare()%>"></b></label><br>
                                                <label for="email"><b>Email:</b> <%=user.getEmail() %></label><br>
                                                <label for="password"><b>Password:<input type="password" size="40" name="password" value="<%=user.getPsswrd()%>"></b></label><br>
                                            	<!-- <input  class=bottoniModificaUtente type ="submit" name="Iviaci i dati" value="Modifica" >  -->
                                                <br><br><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Modifica"/>
                                                
                                            </div>
                                            <div class="nota">
                                            <br><p>*una volta effettuata una modifica verrai reindirizzato alla pagina profilo.</p>
                                        	</div>
                                        </div>
                                  
                            </div>
                            
                        </div>
                    </div>
                </div>
                </fieldset>  
            </form>           
        </div>	
<%} %>
</body>

<%@ include file="jsp/footer.jsp" %>
</html>

