<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.UtenteBean" %>
    
  
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet "href="CSS/assistenza.css">
	<link rel="stylesheet" hred="CSS/mediaquery.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Contattaci</title>
<style type="text/css">
.tab-map{
padding: 30px;
margin-left: 100px;
}
.map #map1{
width:500px; 
height:350px; 

allowfullscreen:""; 
aria-hidden:"false"; 
tabindex:"0";
}

.pagina{
width:500px; 
height:350px; 

allowfullscreen:""; 
aria-hidden:"false"; 
tabindex:"0";
}

#map2{
display: none;
width:200; 
height:200;
frameborder:0; 
style:border; 
allowfullscreen:""; 
aria-hidden:false; 
tabindex:0;
}

@media
</style>
</head>
<body>
<%@ include file="jsp/navbar2.jsp" %>
<br>
	
	
  <table class="tab-map">
  <tr>
  	<td>
<div class="map">
	<iframe id="map1"class="frame" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3021.436868083287!2d14.78755571536688!3d40.77440887932511!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc5a579fb2a6d%3A0x48b9915fbe878e6e!2sInvariante%2012%2FB%2C%20Via%20Giovanni%20Paolo%20II%2C%20132%2C%2084084%20Fisciano%20SA!5e0!3m2!1sit!2sit!4v1599814401832!5m2!1sit!2sit" ></iframe>
    <iframe id="map2"src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d6042.873725190542!2d14.789744000000002!3d40.774409!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc5a579fb2a6d%3A0x48b9915fbe878e6e!2sInvariante%2012%2FB%2C%20Via%20Giovanni%20Paolo%20II%2C%20132%2C%2084084%20Fisciano%20SA!5e0!3m2!1sit!2sit!4v1599823588472!5m2!1sit!2sit" ></iframe>
</div>
</td>
  <td>
	<p class=pagina> 
	    <b class=titolo>I nostri recapiti:</b><br>
	    <b>INDIRIZZO:</b> 		Via Giovanni Paolo II, 132 - 84084 Fisciano (SA) <br>
		<b>TELEFONO:</b> 		08187800 <br>
		<b>CELLULARE: </b>		32244466 <br>
		<b>PARTITA IVA:</b>	0023455555 <br>
		<b>E-MAIL:</b>			sommamodels@gmail.com <br>
		 <iframe id="map2"src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d6042.873725190542!2d14.789744000000002!3d40.774409!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc5a579fb2a6d%3A0x48b9915fbe878e6e!2sInvariante%2012%2FB%2C%20Via%20Giovanni%20Paolo%20II%2C%20132%2C%2084084%20Fisciano%20SA!5e0!3m2!1sit!2sit!4v1599823588472!5m2!1sit!2sit" ></iframe>
		
	</p>
	</td>

</tr>
</table>
</body>

<%@ include file="jsp/footer.jsp" %>

</html>