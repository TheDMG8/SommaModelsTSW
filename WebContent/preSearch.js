/**
 * 
 */
function ricerca(str){//str è il valore inserito nella text-search
		 //esegue la funzione ajax
         $.ajax({
             url: './JsonResponse',  // chiamata alla servlet
             data:"",                // 
             datatype: "Json",		 // definisce il tipo di dato da ricevere dalla servlet
             type:"Post",			//tipo di protocollo utilizzato dalla servlet 
             //se ha successo viene eseguta tale funzione che prende l'oggetto json
             success: function(responseJson){// la funzione success: compone gli item per la barra 
            	 if (str.length==0) { //se non ci sono caratteri nella text-search inizializza la box
            			document.getElementById("search-layer").innerHTML=""; 
            			document.getElementById("search-layer").style.border="0px"; 
            			return; // non ritorna nessun valore
            	 }	
            	 //quando verranno inseriti 1 o piu caratteri nella text-search esegue il resto del codice 
            	 //cancella i children per una pulizia prima di una nuova ricerca altrimenti i dati andrebbero a sovrasciversi ai precedenti 
            	 $("#search-layer").children().remove();//pulisce la livesearch per non creare copie di dati 
            	 //viene inizializzato il search-layar con uno style
         	     document.getElementById("search-layer").style.border="1px solid #A5ACB2";
         	     //inserisce tutti gli item ritornati dalla servlet nella barra di ricerca con un link che lo reinderizza alla pagina relativa 
            	 $.each(responseJson, function(index, item) {
            		 if(item.nomeProdotto.indexOf(str.toUpperCase()) >=0 ) 
            			 	var $input = $("<a href='DettagliProd?id="+item.idProdotto +"'>"+item.nomeProdotto+"</a><br>").appendTo("#search-layer");	 
             })  
             }, 
            //se non ha successo viene eseguito un allert
             error: function(responseText){
                    alert("error");
              }

         });
}

