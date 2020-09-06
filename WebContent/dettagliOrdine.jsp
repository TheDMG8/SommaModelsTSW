<%@page import="it.unisa.model.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.UtenteBean ,it.unisa.model.OrdineBean" %>
    <%

    
   	ServletContext ctx= request.getServletContext();
    ArrayList<ProductBean> collProd= (ArrayList<ProductBean>)ctx.getAttribute("prodotti");
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
<style type="text/css">
.col-md-6 p{
border: 1px solid black;
padding: 15px;
}
</style>
<title>PaginaPersonale</title>

</head>
<body>
<%@ include file="jsp/navbar2.jsp" %>

<%if(nome.isBlank()){ 
	response.sendRedirect("Index.jsp");
	}else{ %>	

	<% ctx.setAttribute("User", user); 
	}
	%>
	
	<div class="user-div">
	<%if(user.isAdmin().equals("true")){ 
             request.getSession().setAttribute("adminRoles", true);
             request.getServletContext().setAttribute("adminRoles", true);
        %>
        <form action="adminArea.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Area Amministratore"/></form> 
   		
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
                                    <a class="nav-link active" id="ordine-tab" data-toggle="tab" href="ordini.jsp"  role="tab" aria-controls="profile" aria-selected="false">Ordini</a>
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
                                                <label>Dettaglio Ordine:</label>
                                                
                                            </div>
                                            <div class="col-md-6">
                                                <%if(collProd != null && collProd.size()>0){
                                                	    	Iterator<?> it= collProd.iterator();
                                                	    	int totale=0;
                                                	    	while(it.hasNext()){
                                                	    		ProductBean bean = (ProductBean)it.next();
                                                	    		totale+=bean.getPrezzoProdotto();
                                                	    		%>
                                                	    		<p>
                                                	    	<br><%=bean.getNomeProdotto()%><br>
                                                	    	<br>Prezzo: <%=bean.getPrezzoProdotto()%>&euro;<br>
                                                	    	</p>
                                                	    	
                                                <%}%>
                                                <br>Totale:<%=totale %>&euro;<br>
                                             <%}%>   
                                            </div>
                                        </div>
                                        
                            </div>
                        </div>
                    </div>
                </div>
            </form>           
        </div>	

</body>

<%@ include file="jsp/footer.jsp" %>
</html>