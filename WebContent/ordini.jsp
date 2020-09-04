<%@page import="it.unisa.model.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.UtenteBean ,it.unisa.model.OrdineBean" %>
    <%

    
   	ServletContext ctx= request.getServletContext();
    Collection<OrdineBean> collOrdini= (Collection<OrdineBean>)ctx.getAttribute("ordini");
    String error = (String)request.getAttribute("error");
	
    
	
    
  %>

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
	}else{ %>	

	<% ctx.setAttribute("User", user); 
	
	if(collOrdini == null ) {
 		response.sendRedirect(response.encodeRedirectURL("./OrdiniControl"));
 		return;
		}
	%>
	
	<div class="user-div">
	<%if(user.isAdmin().equals("true")){ 
             request.getSession().setAttribute("adminRoles", true);
             request.getServletContext().setAttribute("adminRoles", true);
        %>
        <form action="AddUtente?action=login%>" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Area Amministratore"/></form> 
   		
        <%} %>
   			<form action="Logout" method="get" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Logout"/></form> 
    </div>


<div class="container emp-profile">
            <form method="post">
                <div class="row">
                    <div class="col-md-6">
                        <div class="profile-head">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link " id="home-tab" data-toggle="tab" href="userPersonalPage.jsp" role="tab" aria-controls="home" aria-selected="true">Profilo</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" id="ordine-tab" data-toggle="tab" href="#ordini" role="tab" aria-controls="profile" aria-selected="false">Ordini</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
                                 

                            </div>
                            
                            <div class="tab-pane fade show active" id="ordini" role="tabpanel" aria-labelledby="ordine-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>I tuoi Ordini:</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%if(collOrdini != null && collOrdini.size()>0){
                                                	    	Iterator<?> it= collOrdini.iterator();
                                                	    	while(it.hasNext()){
                                                	    		OrdineBean bean = (OrdineBean)it.next();
                                                	    		%>
                                                	    	<br>Data Ordine: <%=bean.getDataOrdine()%><br>
                                                	    	<br>Indirizzo Recapito: <%=bean.getRegione()%>,<%=bean.getProvincia()%>,<%=bean.getCitta()%>,<%=bean.getVia()%>,<%=bean.getNumCivico()%><br>
                                                	    	<br>Stato Ordine: <%=bean.getStatoOrdine()%><br>
                                                	    	<%}
                                                	}else{%>
                                                	<br>Non ci sono ordini<br>
                                                	<%}%></p>
                                            </div>
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