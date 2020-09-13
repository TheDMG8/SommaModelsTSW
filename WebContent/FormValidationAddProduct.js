function FormValidationAddProduct(){
	
	
	var unome = document.registrazione.nomeprodotto;
	var umarca = document.registrazione.marcaprodotto;
	var ucategoria = document.registrazione.categoria;
	var utipo = document.registrazione.tipoprodotto;
	var udescrizione = document.registrazione.descrizioneprodotto;
	var uprezzo = document.registrazione.prezzoprodotto;
	var uvia = document.registrazione.via;
	var upezzidisponibili = document.registrazione.numPezziDisponibili;
	

if(unome||umarca||ucategoria||utipo||udescrizione||uprezzo||uemail||upezzidisponibili){
	alert('Inserisci tutti i campi');
	return false;
}

if(allLet(unome))
{
if(allLett(umarca))
{
if(allLette(usesso))
{
if(allLetter(uregione))
{ 
if(allLettera(ucittà))
{
if(allLetteras(uprovincia))
{
if(allLetterad(uvia))
{
if(allnumeric(ucellulare))
{
}
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
     alert('Il campo Nome deve essere compilato');
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
  function allLette(usesso){ 
	    var letters = /^[A-Za-z]+$/;
	  if(usesso.value.match(letters)){
	    return true;
	   }else{
	     alert('Il campo Sesso deve essere compilato');
	      usesso.focus();
	      return false;
	      }
  }
	  function allLetter(uregione){ 
		    var letters = /^[A-Za-z- ]+$/;
		  if(uregione.value.match(letters)){
		    return true;
		   }else{
		     alert('Il campo Regione deve essere compilato');
		      uregione.focus();
		      return false;
		      }
	  }
		  function allLettera(ucittà){ 
			    var letters = /^[A-Za-z- ]+$/;
			  if(ucittà.value.match(letters)){
			    return true;
			   }else{
			     alert('Il campo Città deve essere compilato');
			      ucittà.focus();
			      return false;
			      }
		  }
			  function allLetteras(uprovincia){ 
				    var letters = /^[A-Za-z- ]+$/;
				  if(uprovincia.value.match(letters)){
				    return true;
				   }else{
				     alert('Il campo Provincia deve essere compilato');
				      uprovincia.focus();
				      return false;
				      }
			  }
				  function allLetterad(uvia){ 
					    var letters = /^[A-Za-z- ]+$/;
					  if(uvia.value.match(letters)){
					    return true;
					   }else{
					     alert('Il campo Via deve essere compilato');
					      uvia.focus();
					      return false;
					      }
				  }
				  function allnumeric(ucellulare){ 
					  var numbers = /^[0-9]+$/;
					if(ucellulare.value.match(numbers)){
					    return true;
					  }else{
					  alert('Il campo Cellulare deve essere compilato');
					   ucellulare.focus();
					  return false;
					  }
				  }
					
