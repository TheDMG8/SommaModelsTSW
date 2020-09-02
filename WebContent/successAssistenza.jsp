<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.UtenteBean" %>
<%@page import="it.unisa.model.AssistenzaBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assistenza riuscita con successo</title>
</head>
<body>

<%@ include file="jsp/navbar2.jsp" %>
<%if(nome.isBlank()){ 
	response.sendRedirect("Index.jsp");

%>


<%}else{ %>	

<p>Rischiesta di assistenza inviata <br>
<li><p> Ti contattiamo noi il prima possibile! </p> </li>

<p>
<% AssistenzaBean assBean=(AssistenzaBean)request.getServletContext().getAttribute("beanAssist"); %>
   Categoria: <%=assBean.getCategoria() %><br>
   Orario :  <%=assBean.getOrario() %> <br>
   Problema : <%=assBean.getProblema() %><br>
   Email : <%= assBean.getEmail() %><br>
</p>

</body>
<% }%>
<%@ include file="jsp/footer.jsp" %>
</html>


