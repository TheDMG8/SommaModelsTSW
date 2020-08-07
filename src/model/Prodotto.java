package model;

import java.io.Serializable;

public class Prodotto implements Serializable {

	private static final long serialVersionUID = 1L;
		private int idProdotto;
		private String nomeProdotto;
		private String marcaProdotto;
		private String tipoCategoria;
		private String tipoProdotto;
		private String descrizioneProdotto;
		private double prezzoProdotto;
		private String immagine;
		private double numPezziDisponibili;
		
	public Prodotto() {
		
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

	public double getNumPezziDisponibili() {
		return numPezziDisponibili;
	}

	public void setNumPezziDisponibili(double numPezziDisponibili) {
		this.numPezziDisponibili = numPezziDisponibili;
	}
	/*non è obbligatorio ma è x aver la certezza di cosa sto leggendo man a mano*/
    @Override
    public String toString() {
    	return nomeProdotto+"(" + idProdotto +")" + marcaProdotto +"," + tipoCategoria + "," + tipoProdotto +","+ descrizioneProdotto + "," + prezzoProdotto + "," + immagine + "," + numPezziDisponibili;
    }
}



