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
    var letters = /^[A-Za-z]+$/;
  if(unome.value.match(letters)){
    return true;
   }else{
     alert('Nome must have alphabet characters only');
      unome.focus();
      return false;
      }
   }

function allLett(ucognome){ 
    var letters = /^[A-Za-z]+$/;
  if(ucognome.value.match(letters)){
    return true;
   }else{
     alert('Cognome must have alphabet characters only');
      ucognome.focus();
      return false;
      }
}
  function allLette(usesso){ 
	    var letters = /^[A-Za-z]+$/;
	  if(usesso.value.match(letters)){
	    return true;
	   }else{
	     alert('Sesso must have alphabet characters only');
	      usesso.focus();
	      return false;
	      }
  }
	  function allLetter(uregione){ 
		    var letters = /^[A-Za-z]+$/;
		  if(uregione.value.match(letters)){
		    return true;
		   }else{
		     alert('Regione must have alphabet characters only');
		      uregione.focus();
		      return false;
		      }
	  }
		  function allLettera(ucittà){ 
			    var letters = /^[A-Za-z]+$/;
			  if(ucittà.value.match(letters)){
			    return true;
			   }else{
			     alert('Città must have alphabet characters only');
			      ucittà.focus();
			      return false;
			      }
		  }
			  function allLetteras(uprovincia){ 
				    var letters = /^[A-Za-z]+$/;
				  if(uprovincia.value.match(letters)){
				    return true;
				   }else{
				     alert('Provincia must have alphabet characters only');
				      uprovincia.focus();
				      return false;
				      }
			  }
				  function allLetterad(uvia){ 
					    var letters = /^[A-Za-z]+$/;
					  if(uvia.value.match(letters)){
					    return true;
					   }else{
					     alert('Via must have alphabet characters only');
					      uvia.focus();
					      return false;
					      }
				  }
				  function allnumeric(ucellulare){ 
					  var numbers = /^[0-9]+$/;
					if(ucellulare.value.match(numbers)){
					    return true;
					  }else{
					  alert('Cellulare code must have numeric characters only');
					   ucellulare.focus();
					  return false;
					  }
				  }
					function ValidateEmail(uemail){
						var x = uemail.value;
					    var atpos = x.indexOf("@");
					    var dotpos = x.lastIndexOf(".");
					    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
					        alert("Not a valid e-mail address");
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
