package model;

import java.io.Serializable;

public class ContieneBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int idOrdineC;
	int idProdottoC;
	
	public ContieneBean() {
		idOrdineC = -1;
		idProdottoC = -1;
	}

	public int getIdOrdineC() {
		return idOrdineC;
	}

	public void setIdOrdineC(int idOrdineC) {
		this.idOrdineC = idOrdineC;
	}

	public int getIdProdottoC() {
		return idProdottoC;
	}

	public void setIdProdottoC(int idProdottoC) {
		this.idProdottoC = idProdottoC;
	}
	
}
