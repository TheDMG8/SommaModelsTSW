<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.UtenteBean"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="CSS/profilo.css" rel="stylesheet">

<title>PaginaPersonale</title>

</head>
<body>


<%@ include file="jsp/navbar2.jsp" %>


<%if(nome.isBlank()){ 
	response.sendRedirect("Index.jsp");

%>


<%}else{ %>	
	<div class="user-div">
   			<form action="Logout" method="get" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Logout"/></form> 
    </div>


<div class="container emp-profile">
            <form method="post">
                <div class="row">
                    <div class="col-md-6">
                        <div class="profile-head">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Profilo</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="ordine-tab" data-toggle="tab" href="ordini.jsp" role="tab" aria-controls="profile" aria-selected="false">Ordini</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Nome:</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=user.getNome()  %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Cognome:</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=user.getCognome() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email:</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=user.getEmail() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Telefono:</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=user.getCellulare()  %></p>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Regione:</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=user.getRegione()  %></p>
                                            </div>
                                        </div>
                                    
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Città:</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=user.getCitta()%></p>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Indirizzo:</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=user.getVia()%> <%=user.getNumCivico()%></p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
         										<a href="modificaProfilo.jsp"><input type="submit"  class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/></a>
   										</div>

                            </div>
                            
                            
                        </div>
                    </div>
                </div>
            </form>           
        </div>	

</body>
<% }%>
<%@ include file="jsp/footer.jsp" %>
</html>