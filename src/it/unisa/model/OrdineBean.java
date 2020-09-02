package it.unisa.model;

import java.io.Serializable;

public class OrdineBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int idOrdine; 
    String dataOrdine;
    String regione;
    String citta;
    String provincia;
    String via;
    int numCivico;
	String statoOrdine;
	int idUtente;
	
	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public OrdineBean() {
		idOrdine = -1; 
	    dataOrdine= "";
	    regione= "";
	    citta= "";
	    provincia= "";
	    via= "";
	    numCivico= 0;
		statoOrdine= "";
		idUtente=-1;
	}

	public int getIdOrdine() {
		return idOrdine;
	}

	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}

	public String getDataOrdine() {
		return dataOrdine;
	}

	public void setDataOrdine(String dataOrdine) {
		this.dataOrdine = dataOrdine;
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

	public String getStatoOrdine() {
		return statoOrdine;
	}

	public void setStatoOrdine(String statoOrdine) {
		this.statoOrdine = statoOrdine;
	}
	public boolean equals(Object other) {
		return (this.getIdOrdine() == ((OrdineBean)other).getIdOrdine());
	}
}
