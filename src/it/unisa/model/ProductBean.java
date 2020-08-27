package it.unisa.model;

import java.io.Serializable;

public class ProductBean implements Serializable {
      
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int idProdotto;
	String nomeProdotto;
    String marcaProdotto;
    String tipoCategoria;
    String tipoProdotto;
    String descrizioneProdotto;
    double prezzoProdotto;
    String immagine;
    int numPezziDisponibili;
    
    public ProductBean() {
    	idProdotto= -1;
    	nomeProdotto="";
        marcaProdotto="";
        tipoCategoria="";
        tipoProdotto="";
        descrizioneProdotto="";
        prezzoProdotto=0;
        immagine="";
        numPezziDisponibili=0;
    	
    }

	public int getIdProdotto() {
		return idProdotto;
	}

	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}

	public String getNomeProdotto() {
		return nomeProdotto;
	}

	public void setNomeProdotto(String nomeProdotto) {
		this.nomeProdotto = nomeProdotto;
	}

	public String getMarcaProdotto() {
		return marcaProdotto;
	}

	public void setMarcaProdotto(String marcaProdotto) {
		this.marcaProdotto = marcaProdotto;
	}

	public String getTipoCategoria() {
		return tipoCategoria;
	}

	public void setTipoCategoria(String tipoCategoria) {
		this.tipoCategoria = tipoCategoria;
	}

	public String getTipoProdotto() {
		return tipoProdotto;
	}

	public void setTipoProdotto(String tipoProdotto) {
		this.tipoProdotto = tipoProdotto;
	}

	public String getDescrizioneProdotto() {
		return descrizioneProdotto;
	}

	public void setDescrizioneProdotto(String descrizioneProdotto) {
		this.descrizioneProdotto = descrizioneProdotto;
	}

	public double getPrezzoProdotto() {
		return prezzoProdotto;
	}

	public void setPrezzoProdotto(double prezzoProdotto) {
		this.prezzoProdotto = prezzoProdotto;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	public int getNumPezziDisponibili() {
		return numPezziDisponibili;
	}

	public void setNumPezziDisponibili(int numPezziDisponibili) {
		this.numPezziDisponibili = numPezziDisponibili;
	}
	
	public boolean isEmpty() {
		return idProdotto == -1;
	}
	
	@Override
	public boolean equals(Object other) {
		return (this.getIdProdotto() == ((ProductBean)other).getIdProdotto());
	}
    /*non è obbligatorio ma è x aver la certezza di cosa sto leggendo man a mano*/
    @Override
    public String toString() {
    	return nomeProdotto+"(" + idProdotto +")" + marcaProdotto +"," + tipoCategoria + "," + tipoProdotto +","+ descrizioneProdotto + "," + prezzoProdotto + "," + immagine + "," + numPezziDisponibili;
    	
    }
}

/*così il bean è pronto*/
