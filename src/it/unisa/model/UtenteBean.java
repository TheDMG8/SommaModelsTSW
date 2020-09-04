package it.unisa.model;

public class UtenteBean {

	int idUtente;
	String nome;
	String cognome;
	String sesso;
	String regione;
	String citta;
	String provincia;
	String via;
	int numCivico;
	String cellulare;
	String email;
	String psswrd;
	String isAdmin;
	
	public UtenteBean() {
		idUtente = -1;
	    nome = "";
		cognome= "";
		sesso= "";
		regione= "";
		citta= "";
		provincia= "";
		via= "";
		numCivico=0;
		cellulare="";
		email= "";
		psswrd = "";
		isAdmin="";
	}
	public UtenteBean(String isAdmin) {
		idUtente = -1;
	    nome = "";
		cognome= "";
		sesso= "";
		regione= "";
		citta= "";
		provincia= "";
		via= "";
		numCivico=0;
		cellulare="";
		email= "";
		psswrd = "";
		this.isAdmin=isAdmin;
	}

	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getSesso() {
		return sesso;
	}

	public void setSesso(String sesso) {
		this.sesso = sesso;
	}

	public String getRegione() {
		return regione;
	}

	public void setRegione(String regione) {
		this.regione = regione;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public int getNumCivico() {
		return numCivico;
	}

	public void setNumCivico(int numCivico) {
		this.numCivico = numCivico;
	}

	public String getCellulare() {
		return cellulare;
	}

	public void setCellulare(String cellulare) {
		this.cellulare = cellulare;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPsswrd() {
		return psswrd;
	}

	public void setPsswrd(String psswrd) {
		this.psswrd = psswrd;
	}
	public boolean isEmpty() { // return true if id=-1, otherwise it will return false
		return this.getIdUtente() == -1;
	}

	public String isAdmin() {
		return isAdmin;
	}
	
	public void setAdmin(String isAdmin) {
		this.isAdmin=isAdmin;
	}
	

}

