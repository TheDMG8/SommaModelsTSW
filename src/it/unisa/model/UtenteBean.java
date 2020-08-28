package it.unisa.model;

public class UtenteBean {

	int idUtente;
	String nome;
	String cognome;
	String sesso;
	String regione;
	String città;
	String provincia;
	String via;
	int numCivico;
	String cellulare;
	String email;
	String psswrd;
	
	public UtenteBean() {
		idUtente = -1;
	    nome = "";
		cognome= "";
		sesso= "";
		regione= "";
		città= "";
		provincia= "";
		via= "";
		numCivico=0;
		cellulare="";
		email= "";
		psswrd = "";
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
		return città;
	}

	public void setCitta(String citta) {
		this.città = citta;
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

	

}

