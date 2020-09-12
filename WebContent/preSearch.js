/**
 * 
 */
function ricerca(str){//str è il valore inserito nella text-search

         $.ajax({
             url: './JsonResponse', 
             data:"",
             datatype: "Json",
             type:"Post",
             
             success: function(responseJson){//lista ritornata composta da item
            	 if (str.length==0) {
            			document.getElementById("search-layer").innerHTML="";
            			document.getElementById("search-layer").style.border="0px";
            			return;
            	 }	
            	 $("#search-layer").children().remove();//pulisce la livesearch per non creare copie di dati 

         	     document.getElementById("search-layer").style.border="1px solid #A5ACB2";
         	   
            	 $.each(responseJson, function(index, item) {
            		 if(item.nomeProdotto.indexOf(str.toUpperCase()) >=0 ) 
            			 	var $input = $("<a href='DettagliProd?id="+item.idProdotto +"'>"+item.nomeProdotto+"</a><br>").appendTo("#search-layer");	 
             }) 
             
             }, 
             error: function(responseText){
                    alert("error");
              }

         });
}

