function FormValidation(){
	
	
	var unome = document.registration.nome;
	var ucognome = document.registration.cognome;
	var usesso = document.registration.sesso;
	var uregione = document.registration.regione;
	var ucittà = document.registration.città;
	var uprovincia = document.registration.provincia;
	var uvia = document.registration.via;
	var ucellulare = document.registration.cellulare;
	var uemail = document.registration.email;
	var password = document.registration.password;


if(allLet(unome))
{
if(allLett(ucognome))
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
if(ValidateEmail(uemail))
{
if(password_validation(password,7,12))
{
}
}
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

function allLett(ucognome){ 
    var letters = /^[A-Za-z- ]+$/;
  if(ucognome.value.match(letters)){
    return true;
   }else{
     alert('Il campo Cognome deve essere compilato');
      ucognome.focus();
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
					function ValidateEmail(uemail){
						var x = uemail.value;
					    var atpos = x.indexOf("@");
					    var dotpos = x.lastIndexOf(".");
					    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
					        alert("Il campo Email deve essere compilato");
					        uemail.focus();
					        return false;
					    }else{
					       return true;
					    }
					}		  
                 
					function password_validation(password,mx,my){
					var password_len = password.value.length;
					if (password_len == 0 ||password_len >= my || password_len < mx){
					  alert("Password should not be empty / length be between "+mx+" to "+my);
					    password.focus();
					   return false;
					  }else{
						  alert('Form Succesfully Submitted');
						  window.location.reload() 
					  return true;
						  }
					}
