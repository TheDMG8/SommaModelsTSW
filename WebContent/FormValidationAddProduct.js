function FormValidationAddProduct(){
	
	
	var unome = document.registrazione.nomeprodotto;
	var umarca = document.registrazione.marcaprodotto;
	var ucategoria = document.registrazione.categoria;
	var utipo = document.registrazione.tipoprodotto;
	var udescrizione = document.registrazione.descrizioneprodotto;
	var uprezzo = document.registrazione.prezzoprodotto;
	var upezzidisponibili = document.registrazione.numPezziDisponibili;


if(allLet(unome))
{
if(allLett(umarca))
{
if(allLette(ucategoria))
{
if(allLetter(utipo))
{ 
if(allLettera(udescrizione))
{
if(allLetteras(uprezzo))
{
if(allnumeric(upezzidisponibili))
{
}
} 
}
} 
}
}
}

return false;

}

function allLet(unome){ 
    var letters = /^[A-Za-z- ]+$/;
  if(unome.value.match(letters)){
    return true;
   }else{
     alert('Il campo Nome Prodotto deve essere compilato');
      unome.focus();
      return false;
      }
   }

function allLett(umarca){ 
    var letters = /^[A-Za-z- ]+$/;
  if(umarca.value.match(letters)){
    return true;
   }else{
     alert('Il campo Marca Pordotto deve essere compilato');
     umarca.focus();
      return false;
      }
}
  function allLette(ucategoria){ 
	    var letters = /^[A-Za-z]+$/;
	  if(ucategoria.value.match(letters)){
	    return true;
	   }else{
	     alert('Il campo Tipo Categoria deve essere compilato');
	     ucategoria.focus();
	      return false;
	      }
  }
	  function allLetter(utipo){ 
		    var letters = /^[A-Za-z- ]+$/;
		  if(utipo.value.match(letters)){
		    return true;
		   }else{
		     alert('Il campo Tipo Prodotto deve essere compilato');
		     utipo.focus();
		      return false;
		      }
	  }
		  function allLettera(udescrizione){ 
			  var letters = /^[.A-Za-z- ]+$/;
			  if(udescrizione.value.match(letters)){
			    return true;
			   }else{
			     alert('Il campo Nome Prodotto deve essere compilato');
			      unome.focus();
			      return false;
			      }
			   }
		  
			  function allLetteras(uprezzo){ 
				    var numbers = /^[0-9.]+$/;
				  if(uprezzo.value.match(numbers)){
				    return true;
				   }else{
				     alert('Il campo Prezzo Prodotto deve essere compilato');
				     uprezzo.focus();
				      return false;
				      }
			  }
				 
				  function allnumeric(upezzidisponibili){ 
					  var numbers = /^[0-9]+$/;
					if(upezzidisponibili.value.match(numbers)){
						alert('Form Succesfully Submitted');
						  window.location.reload() 
						    return true;
					  }else{
						  alert('Il campo Pezzi Disponibili deve essere compilato');
							  upezzidisponibili.focus();
							  return false;
					  } 
				  }
					
